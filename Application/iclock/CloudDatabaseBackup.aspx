<%@ page language="VB" autoeventwireup="false" inherits="CloudDatabaseBackup, App_Web_wdniqpox" enableEventValidation="false" %>

<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body background="../Images/bck1.gif" style="background-repeat: no-repeat; background-position-x: right;
    background-position-y: top;">
    <form id="form1" runat="server">
    <owd:Window ID="wnd_DBBackup" runat="server" IsModal="true" Height="90" Width="500"
        StyleFolder="~/Styles/mainwindow/blue" Title="Database Backup" ShowCloseButton="false"
        ShowStatusBar="False" Left="50" Top="80">
        <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
            border-right-style: none; border-left-style: none; border-bottom-style: none;">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_DBBackup" runat="server" Text="Create Backup" />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_Download" runat="server" Text="Download Copy" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="background-color: #EEEEEE;">
                <td style="background-color: #EEEEEE;">
                    <asp:Label ID="Lbl_Error"  runat="server" Style="background-color: #EEEEEE;" EnableViewState="False"
                        ForeColor="Red"></asp:Label><br />
                    <br />
                </td>
            </tr>
        </table>
    </owd:Window>
    </form>
</body>
</html>
