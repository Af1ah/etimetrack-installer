#!/usr/bin/env python3
"""Prepare a sanitized vendor payload and/or build a ZIP without secrets or databases."""
import argparse
import hashlib
import json
import re
import shutil
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ALLOWED = {'.aspx', '.ascx', '.dll', '.compiled', '.config', '.xml', '.js', '.css',
           '.gif', '.png', '.jpg', '.jpeg', '.bmp', '.ico', '.rdlc', '.html', '.htm'}
DATA_DIRS = {'deviceinfo', 'errorfiles', 'photos', 'imagefpsensor', 'sapexport', 'app_docs',
             '.git', '.codex', '.agents', 'employee self service'}
DEV_PAGES = {'testgoogleapi.aspx', 'testupdatepanel.aspx', 'test.ascx', 'testcloud.aspx',
             'testgpssort.rdlc', 'defaulttest.aspx', 'cdata1.aspx', 'deviceloglist1.aspx'}


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def prepare(source):
    target = ROOT / 'Application' / 'iclock'
    if target.exists():
        raise SystemExit('Application payload already exists. Remove it explicitly before preparing a new vendor release.')
    target.mkdir(parents=True)
    excluded = 0
    for path in sorted(source.rglob('*')):
        if path.is_symlink():
            raise SystemExit('Source contains a symbolic link; refusing to package it.')
        if not path.is_file():
            continue
        rel = path.relative_to(source)
        parts = {p.lower() for p in rel.parts[:-1]}
        empty_handler = str(rel).lower() in {'cdata', 'getrequest', 'devicecmd'} and path.stat().st_size == 0
        winscp_runtime = rel.as_posix().lower() == 'bin/winscp.exe'
        if (parts & DATA_DIRS or path.name.lower() in DEV_PAGES or
                path.name.lower().startswith('test') or path.name.lower().endswith('.exe.config') or
                (path.suffix.lower() not in ALLOWED and not winscp_runtime and not empty_handler)):
            excluded += 1
            continue
        # Operational logos can identify the previous customer; use the vendor default separately.
        if re.search(r'companylogo|employeephoto|profilephoto', path.name, re.I) and path.suffix.lower() in {'.png', '.jpg', '.jpeg', '.bmp'}:
            excluded += 1
            continue
        dest = target / rel
        dest.parent.mkdir(parents=True, exist_ok=True)
        if path.suffix.lower() in {'.config', '.xml', '.rdlc'}:
            data = path.read_bytes()
            try:
                tree = ET.fromstring(data)
            except ET.ParseError:
                # These known deployment formats must remain parseable, not be silently copied.
                raise SystemExit(f'Unparseable XML-like payload: {rel}')
            changed = False
            for element in tree.iter():
                for key, value in list(element.attrib.items()):
                    if key.lower() == 'connectionstring':
                        element.set(key, 'Data Source=CONFIGURE_LOCALLY;Initial Catalog=CONFIGURE_LOCALLY;Integrated Security=True')
                        changed = True
                    if key.lower() in {'password', 'pwd', 'clientsecret', 'apikey', 'token', 'secret'}:
                        element.set(key, '')
                        changed = True
                tag = element.tag.rsplit('}', 1)[-1].lower()
                if tag in {'connectstring', 'connectionstring'} and element.text:
                    element.text = 'Data Source=CONFIGURE_LOCALLY;Initial Catalog=CONFIGURE_LOCALLY;Integrated Security=True'
                    changed = True
                if tag == 'compilation':
                    element.set('debug', 'false')
                    changed = True
            if changed:
                ET.ElementTree(tree).write(dest, encoding='utf-8', xml_declaration=True)
            else:
                shutil.copyfile(path, dest)
        else:
            shutil.copyfile(path, dest)
    files = [{'Path': p.relative_to(target).as_posix(), 'Sha256': sha(p)}
             for p in sorted(target.rglob('*')) if p.is_file()]
    (ROOT / 'Application' / 'manifest.json').write_text(json.dumps({
        'Format': 1, 'Product': 'Supplied compiled eTimeTrackLite iclock build',
        'Files': files,
    }, indent=2) + '\n')
    print(f'Prepared {len(files)} files; excluded {excluded} operational/development files.')


def verify():
    target = ROOT / 'Application' / 'iclock'
    manifest = json.loads((ROOT / 'Application' / 'manifest.json').read_text())
    actual = {p.relative_to(target).as_posix() for p in target.rglob('*') if p.is_file()}
    expected = {e['Path'] for e in manifest['Files']}
    if actual != expected:
        raise SystemExit('Payload file list differs from manifest.')
    for entry in manifest['Files']:
        if sha(target / entry['Path']) != entry['Sha256']:
            raise SystemExit('Payload hash mismatch: ' + entry['Path'])
    for path in target.rglob('*'):
        if not path.is_file():
            continue
        if path.suffix.lower() in {'.txt', '.bak', '.back', '.mdf', '.ldf', '.mdb', '.csv', '.xls', '.xlsx', '.dat', '.pdb', '.log'}:
            raise SystemExit('Forbidden operational file: ' + str(path))
        if path.suffix.lower() in {'.config', '.xml', '.rdlc', '.aspx', '.ascx', '.js', '.html'}:
            text = path.read_text(errors='replace')
            if re.search(r'(?i)(?:password|pwd)\s*=\s*[^;\s"\'<>][^;"\'<>]*', text):
                # A literal database connection-string password is never allowed in the bundle.
                if re.search(r'(?i)(?:server|data source|initial catalog)\s*=', text):
                    raise SystemExit('Possible embedded SQL credential in: ' + str(path.relative_to(target)))
    print('Payload manifest, hashes and operational-data exclusions verified.')
    dependencies = json.loads((ROOT / 'Dependencies' / 'manifest.json').read_text())
    dependency = ROOT / 'Dependencies' / dependencies['UrlRewrite']['File']
    if dependency.name != 'rewrite_amd64_en-US.msi' or sha(dependency) != dependencies['UrlRewrite']['Sha256']:
        raise SystemExit('Bundled Microsoft dependency hash mismatch.')
    if dependency.read_bytes()[:8] != bytes.fromhex('D0CF11E0A1B11AE1'):
        raise SystemExit('Dependency does not have an MSI compound-file header.')
    print('Bundled Microsoft dependency checksum and MSI header verified.')


def bundle(output):
    output.parent.mkdir(parents=True, exist_ok=True)
    allowed_roots = {'Application', 'Dependencies', 'Scripts', 'docs', 'build', 'tests', '.github'}
    root_files = {'README.md', 'NOTICE.md', 'Install-ETimeTrack.ps1', 'Start-Installer.cmd', '.gitignore', '.gitattributes'}
    files = [p for p in ROOT.rglob('*') if p.is_file() and
             (p.relative_to(ROOT).parts[0] in allowed_roots or p.relative_to(ROOT).as_posix() in root_files) and
             '__pycache__' not in p.parts]
    with zipfile.ZipFile(output, 'w', zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(files):
            archive.write(path, 'etimetrack-installer/' + path.relative_to(ROOT).as_posix())
    with zipfile.ZipFile(output) as archive:
        if archive.testzip():
            raise SystemExit('ZIP verification failed.')
    output.with_suffix('.zip.sha256').write_text(sha(output) + '  ' + output.name + '\n')
    print(f'Built {output} ({output.stat().st_size:,} bytes).')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--source', type=Path, help='Clean or supplied iclock deployment; data exclusions and XML sanitization are applied.')
    parser.add_argument('--output', type=Path, default=ROOT / 'dist' / 'etimetrack-installer.zip')
    args = parser.parse_args()
    if args.source:
        prepare(args.source.resolve())
    verify()
    bundle(args.output.resolve())
