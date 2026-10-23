<%@ page language="VB" autoeventwireup="false" inherits="Manage_FTPCustomFormat, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body onload="OnPageLoad();chk_PrefixText_onClick();chkEnable_CheckedChange();chk_Proxy_CheckedChange();rdoFTP_CheckedChange();rdoCustomReport_CheckedChange();rdoP10P20Report_CheckedChange();">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="ReportProtoType" runat="server" IsModal="true" Height="700" Width="730"
            StyleFolder="~/Styles/mainwindow/blue" Title="FTP/sFTP Upload Settings" VisibleOnLoad="true"
            ShowCloseButton="true" Left="80" Top="45" ShowStatusBar="False">
            <table width="100%" height="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td colspan="6">
                                    <asp:RadioButton ID="rdoCustomReport"  Text="Custom Report" AutoPostBack="true" runat="server"
                                        GroupName="b" onclick="rdoCustomReport_CheckedChange();"   />&nbsp;&nbsp;
                                    <asp:RadioButton ID="rdoP10P20Report" Text="P10 P20 Report"  runat="server"
                                        AutoPostBack="true" GroupName="b" onclick="rdoP10P20Report_CheckedChange();" />&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <hr />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                File Format
                                            </td>
                                            <td>
                                                <asp:Panel ID="pnlExport" runat="server">
                                                    <obout:Combobox Validate="false" ID="drp_FileFormat" CssClass="WebControls" runat="server"
                                                        Width="110" FolderStyle="~/styles/default" SelectedIndex="0" Text="dd_MM_yyyy"
                                                        Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_">
                                                        <Options>
                                                            <obout:Option ID="Option1" runat="server" Text="dd-MM-yyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_"></obout:Option>
                                                            <obout:Option ID="Option2" runat="server" Text="MM-dd-yyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_1_"></obout:Option>
                                                            <obout:Option ID="Option3" runat="server" Text="dd_MM_yyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_2_"></obout:Option>
                                                            <obout:Option ID="Option4" runat="server" Text="MM_dd_yyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_3_"></obout:Option>
                                                            <obout:Option ID="Option5" runat="server" Text="ddMMyyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_4_"></obout:Option>
                                                            <obout:Option ID="Option6" runat="server" Text="MMddyyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_5_"></obout:Option>
                                                        </Options>
                                                    </obout:Combobox>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chk_PrefixText" runat="server" onclick="chk_PrefixText_onClick();"
                                                    Text="PrefixText" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_PrefixText" Enabled="false" runat="server" Width="90px" 
                                                    CssClass="aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                File Extension
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_FileExtension" runat="server" Width="50px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                Field Seprator
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_FieldSeprator" runat="server" CssClass="WebControls">
                                                    <asp:ListItem Selected="True">Space</asp:ListItem>
                                                    <asp:ListItem>Tab</asp:ListItem>
                                                    <asp:ListItem>Comma</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                Data Field No. 1
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_DataField1" runat="server" ToolTip="1" onchange="drp_onChange(this)"
                                                    CssClass="WebControls">
                                                    <asp:ListItem>Device SerialNumber</asp:ListItem>
                                                    <asp:ListItem>Device Name</asp:ListItem>
                                                    <asp:ListItem Selected="True">Employee Code</asp:ListItem>
                                                    <asp:ListItem>Employee Device Code</asp:ListItem>
                                                    <asp:ListItem>Punch Date Time</asp:ListItem>
                                                    <asp:ListItem>Direction</asp:ListItem>
                                                    <asp:ListItem>Time in Minutes</asp:ListItem>
                                                    <asp:ListItem>Reserved Field</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField1_1" runat="server" Text="No of Char"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField1_1" Text="0" runat="server" Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField1_2" runat="server" Text="Out Dir Symbol" Style="display: none;"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField1_2" Text="1" runat="server" Width="100px" CssClass="WebControls"
                                                    Style="display: none;"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                Data Field No. 2
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_DataField2" runat="server" ToolTip="2" onchange="drp_onChange(this)"
                                                    CssClass="WebControls">
                                                    <asp:ListItem>Device SerialNumber</asp:ListItem>
                                                    <asp:ListItem>Device Name</asp:ListItem>
                                                    <asp:ListItem>Employee Code</asp:ListItem>
                                                    <asp:ListItem Selected="True">Employee Device Code</asp:ListItem>
                                                    <asp:ListItem>Punch Date Time</asp:ListItem>
                                                    <asp:ListItem>Direction</asp:ListItem>
                                                    <asp:ListItem>Time in Minutes</asp:ListItem>
                                                    <asp:ListItem>Reserved Field</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField2_1" runat="server" Text="No of Char"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField2_1" Text="0" runat="server" Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField2_2" runat="server" Text="Out Dir Symbol" Style="display: none;"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField2_2" Text="1" runat="server" Style="display: none;"
                                                    CssClass="WebControls" Width="100px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                Data Field No. 3
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_DataField3" runat="server" ToolTip="3" onchange="drp_onChange(this)"
                                                    CssClass="WebControls">
                                                    <asp:ListItem Selected="True">Device SerialNumber</asp:ListItem>
                                                    <asp:ListItem>Device Name</asp:ListItem>
                                                    <asp:ListItem>Employee Code</asp:ListItem>
                                                    <asp:ListItem>Employee Device Code</asp:ListItem>
                                                    <asp:ListItem>Punch Date Time</asp:ListItem>
                                                    <asp:ListItem>Direction</asp:ListItem>
                                                    <asp:ListItem>Time in Minutes</asp:ListItem>
                                                    <asp:ListItem>Reserved Field</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField3_1" runat="server" Text="No of Char"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField3_1" Text="0" runat="server" Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField3_2" runat="server" Text="Out Dir Symbol" Style="display: none;"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField3_2" Text="1" runat="server" Style="display: none;"
                                                    Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                Data Field No. 4
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_DataField4" runat="server" ToolTip="4" onchange="drp_onChange(this)"
                                                    CssClass="WebControls">
                                                    <asp:ListItem>Device SerialNumber</asp:ListItem>
                                                    <asp:ListItem Selected="True">Device Name</asp:ListItem>
                                                    <asp:ListItem>Employee Code</asp:ListItem>
                                                    <asp:ListItem>Employee Device Code</asp:ListItem>
                                                    <asp:ListItem>Punch Date Time</asp:ListItem>
                                                    <asp:ListItem>Direction</asp:ListItem>
                                                    <asp:ListItem>Time in Minutes</asp:ListItem>
                                                    <asp:ListItem>Reserved Field</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField4_1" runat="server" Text="No of Char"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField4_1" Text="0" runat="server" Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField4_2" runat="server" Text="Out Dir Symbol" Style="display: none;"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField4_2" Text="1" runat="server" Style="display: none;"
                                                    Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                Data Field No. 5
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_DataField5" runat="server" ToolTip="5" onchange="drp_onChange(this)"
                                                    CssClass="WebControls">
                                                    <asp:ListItem>Device SerialNumber</asp:ListItem>
                                                    <asp:ListItem>Device Name</asp:ListItem>
                                                    <asp:ListItem>Employee Code</asp:ListItem>
                                                    <asp:ListItem>Employee Device Code</asp:ListItem>
                                                    <asp:ListItem Selected="True">Punch Date Time</asp:ListItem>
                                                    <asp:ListItem>Direction</asp:ListItem>
                                                    <asp:ListItem>Time in Minutes</asp:ListItem>
                                                    <asp:ListItem>Reserved Field</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField5_1" runat="server" Text="No of Char"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField5_1" Text="0" runat="server" Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField5_2" runat="server" Text="Out Dir Symbol" Style="display: none;"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField5_2" Text="1" runat="server" Style="display: none;"
                                                    Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                Data Field No. 6
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_DataField6" runat="server" ToolTip="6" onchange="drp_onChange(this)">
                                                    <asp:ListItem>Device SerialNumber</asp:ListItem>
                                                    <asp:ListItem>Device Name</asp:ListItem>
                                                    <asp:ListItem>Employee Code</asp:ListItem>
                                                    <asp:ListItem>Employee Device Code</asp:ListItem>
                                                    <asp:ListItem>Punch Date Time</asp:ListItem>
                                                    <asp:ListItem Selected="True">Direction</asp:ListItem>
                                                    <asp:ListItem>Time in Minutes</asp:ListItem>
                                                    <asp:ListItem>Reserved Field</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField6_1" runat="server" Text="No of Char"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField6_1" Text="0" runat="server" Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField6_2" runat="server" Text="Out Dir Symbol" Style="display: none;"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField6_2" Text="1" runat="server" Style="display: none;"
                                                    Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                Data Field No. 7
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_DataField7" runat="server" CssClass="WebControls" ToolTip="7"
                                                    onchange="drp_onChange(this)">
                                                    <asp:ListItem>Device SerialNumber</asp:ListItem>
                                                    <asp:ListItem>Device Name</asp:ListItem>
                                                    <asp:ListItem>Employee Code</asp:ListItem>
                                                    <asp:ListItem>Employee Device Code</asp:ListItem>
                                                    <asp:ListItem>Punch Date Time</asp:ListItem>
                                                    <asp:ListItem>Direction</asp:ListItem>
                                                    <asp:ListItem Selected="True">Time in Minutes</asp:ListItem>
                                                    <asp:ListItem>Reserved Field</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField7_1" runat="server" Text="No of Char"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField7_1" Text="0" runat="server" Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField7_2" runat="server" Text="Out Dir Symbol" Style="display: none;"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField7_2" Text="1" runat="server" Style="display: none;"
                                                    Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                Data Field No. 8
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drp_DataField8" runat="server" CssClass="WebControls" onchange="drp_onChange(this)"
                                                    ToolTip="8">
                                                    <asp:ListItem>Device SerialNumber</asp:ListItem>
                                                    <asp:ListItem>Device Name</asp:ListItem>
                                                    <asp:ListItem>Employee Code</asp:ListItem>
                                                    <asp:ListItem>Employee Device Code</asp:ListItem>
                                                    <asp:ListItem>Punch Date Time</asp:ListItem>
                                                    <asp:ListItem>Direction</asp:ListItem>
                                                    <asp:ListItem>Time in Minutes</asp:ListItem>
                                                    <asp:ListItem Selected="True">Reserved Field</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField8_1" runat="server" Text="No of Char"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField8_1" Text="0" runat="server" Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_DataField8_2" runat="server" Text="Out Dir Symbol"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_DataField8_2" Text="1" runat="server" Width="100px" CssClass="WebControls"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <fieldset>
                                        <legend>
                                            <asp:CheckBox ID="chkEnable" runat="server" onclick="chkEnable_CheckedChange();"
                                                Text="Enable FTP/sFTP Settings" /></legend>
                                        <asp:Panel ID="pnlSettings" runat="server">
                                            <table id="tblSettings" runat="server">
                                                <tr colspan="6">
                                                    <td>
                                                        <asp:RadioButton ID="rdoFTP" Text="FTP" runat="server" GroupName="a" />&nbsp;&nbsp;
                                                        <asp:RadioButton ID="rdoWebDav" Text="WebDav"   runat="server" GroupName="a" />&nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                Host&nbsp;Name&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txt_HostName" runat="server"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                User&nbsp;Name&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txt_UserName" runat="server"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Password&nbsp;&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txt_Password" TextMode="Password" runat="server"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Directory&nbsp;&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txt_Directory" runat="server"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Port&nbsp;&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txt_Port" runat="server"></asp:TextBox> 
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="lblProxy" runat="server" Text="Enable Proxy"></asp:Label>&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:CheckBox ID="chk_Proxy" runat="server" onclick="chk_Proxy_CheckedChange();"
                                                                                    Text="" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="lblProxyAddress" runat="server" Text="Proxy Address"></asp:Label>&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txt_Proxyaddress" runat="server"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="lblProxyUserName" runat="server" Text="Proxy UserName"></asp:Label>&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txt_ProxyUserName" runat="server"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="lblProxyPassword" runat="server" Text="Proxy Password"></asp:Label>&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txt_ProxyPassword" TextMode="Password" runat="server"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="btn_TestConnection" runat="server" Text="Test Connection" />
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <table>
                                                                        <tr id="trLastRunDate" runat="server">
                                                                            <td>
                                                                                Last Run Date
                                                                            </td>
                                                                            <td colspan="3">
                                                                                <asp:DropDownList ID="DRP_LastRunDateYYYY" runat="server" CssClass="WebControls">
                                                                                </asp:DropDownList>
                                                                                <asp:DropDownList ID="DRP_LastRunDateMM" runat="server" CssClass="WebControls">
                                                                                </asp:DropDownList>
                                                                                <asp:DropDownList ID="DRP_LastRunDateDD" runat="server" CssClass="WebControls">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Run Everyday at
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="drp_HHTime" runat="server" Width="60">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="drp_MMtime" runat="server" Width="60">
                                                                                </asp:DropDownList>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                HH:MM 24 hr fmt
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </fieldset>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table id="tblManualExport" runat="server">
                                        <tr>
                                            <td colspan="3" style="font-weight: bold">
                                                Manual Export
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Select Date
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="Drp_FromDateDD" runat="server" CssClass="WebControls">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="Drp_FromDateMM" runat="server" CssClass="WebControls">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="Drp_FromDateYYYY" runat="server" CssClass="WebControls">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Button ID="btn_Export" CssClass="WebControls" runat="server" Text="Export" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="6">
                                    <asp:Button ID="btn_Save" CssClass="WebControls" runat="server" Text="Save" />&nbsp;<input
                                        type="button" class="WebControls" value="Close" id="btn_Close" onclick="ReportProtoType.Close();" />&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <tr>
                    </tr>
            </table>
        </owd:Window>
    </div>
    <script type="text/javascript">

        //txt_DataField1_1
        function chk_PrefixText_onClick() {
            document.getElementById('<%=txt_PrefixText.ClientID %>').disabled = true;
            if (document.getElementById('<%=chk_PrefixText.ClientID %>').checked)
                document.getElementById('<%=txt_PrefixText.ClientID %>').disabled = false;
        }
        function drp_onChange(object) {
            if (object.title == '1') {
                document.getElementById("<%=lbl_DataField1_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField1_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField1_2.ClientID %>").style.display = 'none';
               
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField1_1.ClientID %>").innerHTML = 'Format';
                    if (document.getElementById("<%=txt_DataField1_1.ClientID %>").value == '') {
                        document.getElementById("<%=txt_DataField1_1.ClientID %>").value = 'yyyy-MM-dd HH:mm:ss';
                    }
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField1_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField1_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField1_2.ClientID %>").style.display = 'inline';
                }
                else {

                    if (document.getElementById("<%=txt_DataField1_1.ClientID %>").value == 'yyyy-MM-dd HH:mm:ss') {
                        document.getElementById("<%=txt_DataField1_1.ClientID %>").value = '0';
                    }

                }
            }

            else if (object.title == '2') {
                document.getElementById("<%=lbl_DataField2_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField2_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField2_2.ClientID %>").style.display = 'none';
               
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField2_1.ClientID %>").innerHTML = 'Format';
                    if (document.getElementById("<%=txt_DataField2_1.ClientID %>").value == '') {
                        document.getElementById("<%=txt_DataField2_1.ClientID %>").value = 'yyyy-MM-dd HH:mm:ss';
                    }
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField2_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField2_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField2_2.ClientID %>").style.display = 'inline';
                }
                else {

                    if (document.getElementById("<%=txt_DataField2_1.ClientID %>").value == 'yyyy-MM-dd HH:mm:ss') {
                        document.getElementById("<%=txt_DataField2_1.ClientID %>").value = '0';
                    }

                }
            }

            else if (object.title == '3') {
                document.getElementById("<%=lbl_DataField3_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField3_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField3_2.ClientID %>").style.display = 'none';
               
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField3_1.ClientID %>").innerHTML = 'Format';
                    if (document.getElementById("<%=txt_DataField3_1.ClientID %>").value == '') {
                        document.getElementById("<%=txt_DataField3_1.ClientID %>").value = 'yyyy-MM-dd HH:mm:ss';
                    }
                   
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField3_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField3_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField3_2.ClientID %>").style.display = 'inline';
                }
                else {

                    if (document.getElementById("<%=txt_DataField3_1.ClientID %>").value == 'yyyy-MM-dd HH:mm:ss') {
                        document.getElementById("<%=txt_DataField3_1.ClientID %>").value = '0';
                    }

                }
            }

            else if (object.title == '4') {
                document.getElementById("<%=lbl_DataField4_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField4_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField4_2.ClientID %>").style.display = 'none';
                
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField4_1.ClientID %>").innerHTML = 'Format';
                    if (document.getElementById("<%=txt_DataField4_1.ClientID %>").value == '') {
                        document.getElementById("<%=txt_DataField4_1.ClientID %>").value = 'yyyy-MM-dd HH:mm:ss';
                    }
                   
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField4_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField4_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField4_2.ClientID %>").style.display = 'inline';
                }
                else {

                    if (document.getElementById("<%=txt_DataField4_1.ClientID %>").value == 'yyyy-MM-dd HH:mm:ss') {
                        document.getElementById("<%=txt_DataField4_1.ClientID %>").value = '0';
                    }

                }
            }

            else if (object.title == '5') {
                document.getElementById("<%=lbl_DataField5_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField5_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField5_2.ClientID %>").style.display = 'none';
                
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField5_1.ClientID %>").innerHTML = 'Format';
                    if (document.getElementById("<%=txt_DataField5_1.ClientID %>").value == '') {
                        document.getElementById("<%=txt_DataField5_1.ClientID %>").value = 'yyyy-MM-dd HH:mm:ss';
                    }
                    
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField5_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField5_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField5_2.ClientID %>").style.display = 'inline';
                }
                else {

                    if (document.getElementById("<%=txt_DataField5_1.ClientID %>").value == 'yyyy-MM-dd HH:mm:ss') {
                        document.getElementById("<%=txt_DataField5_1.ClientID %>").value = '0';
                    }

                }
            }

            else if (object.title == '6') {
                document.getElementById("<%=lbl_DataField6_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField6_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField6_2.ClientID %>").style.display = 'none';
                
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField6_1.ClientID %>").innerHTML = 'Format';
                    if (document.getElementById("<%=txt_DataField6_1.ClientID %>").value == '') {
                        document.getElementById("<%=txt_DataField6_1.ClientID %>").value = 'yyyy-MM-dd HH:mm:ss';
                    }
                 
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField6_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField6_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField6_2.ClientID %>").style.display = 'inline';
                }
                else {

                    if (document.getElementById("<%=txt_DataField6_1.ClientID %>").value == 'yyyy-MM-dd HH:mm:ss') {
                        document.getElementById("<%=txt_DataField6_1.ClientID %>").value = '0';
                    }

                }
            }

            else if (object.title == '7') {
                document.getElementById("<%=lbl_DataField7_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField7_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField7_2.ClientID %>").style.display = 'none';

                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField7_1.ClientID %>").innerHTML = 'Format';
                    if (document.getElementById("<%=txt_DataField7_1.ClientID %>").value == '') {
                        document.getElementById("<%=txt_DataField7_1.ClientID %>").value = 'yyyy-MM-dd HH:mm:ss';
                    }
                   
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField7_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField7_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField7_2.ClientID %>").style.display = 'inline';
                }
                else {

                    if (document.getElementById("<%=txt_DataField7_1.ClientID %>").value == 'yyyy-MM-dd HH:mm:ss') {
                        document.getElementById("<%=txt_DataField7_1.ClientID %>").value = '0';
                    }

                }
            }

            else if (object.title == '8') {
                document.getElementById("<%=lbl_DataField8_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField8_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField8_2.ClientID %>").style.display = 'none';
                
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField8_1.ClientID %>").innerHTML = 'Format';
                    if (document.getElementById("<%=txt_DataField8_1.ClientID %>").value == '') {
                        document.getElementById("<%=txt_DataField8_1.ClientID %>").value = 'yyyy-MM-dd HH:mm:ss';
                    }
                   
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField8_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField8_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField8_2.ClientID %>").style.display = 'inline';
                }
                else {

                    if (document.getElementById("<%=txt_DataField8_1.ClientID %>").value == 'yyyy-MM-dd HH:mm:ss') {
                        document.getElementById("<%=txt_DataField8_1.ClientID %>").value = '0';
                    }

                }
            }
           

        }

        function OnPageLoad() {
            drp_onChange(document.getElementById("<%=drp_DataField1.ClientID %>"));
            drp_onChange(document.getElementById("<%=drp_DataField2.ClientID %>"));
            drp_onChange(document.getElementById("<%=drp_DataField3.ClientID %>"));
            drp_onChange(document.getElementById("<%=drp_DataField4.ClientID %>"));
            drp_onChange(document.getElementById("<%=drp_DataField5.ClientID %>"));
            drp_onChange(document.getElementById("<%=drp_DataField6.ClientID %>"));
            drp_onChange(document.getElementById("<%=drp_DataField7.ClientID %>"));
            drp_onChange(document.getElementById("<%=drp_DataField8.ClientID %>"));
        }

        function chkEnable_CheckedChange() {
           
            var Sender = document.getElementById("<%=chkEnable.ClientID%>");
            var SenderProxy = document.getElementById("<%=chk_Proxy.ClientID%>");      
            var controls = document.getElementById("<%=pnlSettings.ClientID%>").getElementsByTagName("input");
            if (Sender.checked) {
                
                for (var i = 0; i < controls.length; i++) {
                    controls[i].disabled = false;
                }
                
                document.getElementById("<%=drp_HHTime.ClientID%>").disabled = false;
                document.getElementById("<%=drp_MMTime.ClientID%>").disabled = false;

                document.getElementById("<%=DRP_LastRunDateDD.ClientID%>").disabled = false;
                document.getElementById("<%=DRP_LastRunDateMM.ClientID%>").disabled = false;
                document.getElementById("<%=DRP_LastRunDateYYYY.ClientID%>").disabled = false;

                var inPutProxy = document.getElementById("<%=txt_Proxyaddress.ClientID%>").value;
                if (inPutProxy == "") {
                    SenderProxy.checked = false;
                    document.getElementById("<%=txt_Proxyaddress.ClientID%>").disabled = true;
                    document.getElementById("<%=txt_ProxyUserName.ClientID%>").disabled = true;
                    document.getElementById("<%=txt_ProxyPassword.ClientID%>").disabled = true;
                }
               
            }
            else {
               
                for (var i = 0; i < controls.length; i++) {
                    controls[i].disabled = true;
                }
                document.getElementById("<%=drp_HHTime.ClientID%>").disabled = true;
                document.getElementById("<%=drp_MMTime.ClientID%>").disabled = true;

                document.getElementById("<%=DRP_LastRunDateDD.ClientID%>").disabled = true;
                document.getElementById("<%=DRP_LastRunDateMM.ClientID%>").disabled = true;
                document.getElementById("<%=DRP_LastRunDateYYYY.ClientID%>").disabled = true;

                SenderProxy.checked = false;
                document.getElementById("<%=txt_Proxyaddress.ClientID%>").disabled = true;
                document.getElementById("<%=txt_ProxyUserName.ClientID%>").disabled = true;
                document.getElementById("<%=txt_ProxyPassword.ClientID%>").disabled = true;
            }
           
            rdoFTP_CheckedChange();
         

        }

        function chk_Proxy_CheckedChange() {
            var SenderProxy = document.getElementById("<%=chk_Proxy.ClientID%>");
            if (SenderProxy.checked) {
                document.getElementById("<%=txt_Proxyaddress.ClientID%>").disabled = false;
                document.getElementById("<%=txt_ProxyUserName.ClientID%>").disabled = false;
                document.getElementById("<%=txt_ProxyPassword.ClientID%>").disabled = false;

            } else {
                SenderProxy.checked = false;
                document.getElementById("<%=txt_Proxyaddress.ClientID%>").disabled = true;
                document.getElementById("<%=txt_ProxyUserName.ClientID%>").disabled = true;
                document.getElementById("<%=txt_ProxyPassword.ClientID%>").disabled = true;
            }
        }


       
        function rdoFTP_CheckedChange() {

            var SenderFTP = document.getElementById("<%=rdoFTP.ClientID%>");

            if (SenderFTP.checked) {
              
                document.getElementById("<%=lblProxy.ClientID%>").style.display = 'inline';
                document.getElementById("<%=lblProxyaddress.ClientID%>").style.display = 'inline';
                document.getElementById("<%=lblProxyUserName.ClientID%>").style.display = 'inline';
                document.getElementById("<%=lblProxyPassword.ClientID%>").style.display = 'inline';
               

                document.getElementById("<%=txt_Proxyaddress.ClientID%>").style.display = 'inline';
                document.getElementById("<%=txt_ProxyUserName.ClientID%>").style.display = 'inline';
                document.getElementById("<%=txt_ProxyPassword.ClientID%>").style.display = 'inline';
                document.getElementById("<%=chk_Proxy.ClientID%>").style.display = 'inline';


                var inPutProxy = document.getElementById("<%=txt_Proxyaddress.ClientID%>").value;

                if (inPutProxy == "") {
                    var SenderProxy = document.getElementById("<%=chk_Proxy.ClientID%>");
                    SenderProxy.checked = false;
                    document.getElementById("<%=txt_Proxyaddress.ClientID%>").disabled = true;
                    document.getElementById("<%=txt_ProxyUserName.ClientID%>").disabled = true;
                    document.getElementById("<%=txt_ProxyPassword.ClientID%>").disabled = true;
                }

               
            } else {
                SenderFTP.checked = false;
                document.getElementById("<%=lblProxy.ClientID%>").style.display = 'none';
                document.getElementById("<%=lblProxyaddress.ClientID%>").style.display = 'none';
                document.getElementById("<%=lblProxyUserName.ClientID%>").style.display = 'none';
                document.getElementById("<%=lblProxyPassword.ClientID%>").style.display = 'none';

                document.getElementById("<%=txt_Proxyaddress.ClientID%>").style.display = 'none';
                document.getElementById("<%=txt_ProxyUserName.ClientID%>").style.display = 'none';
                document.getElementById("<%=txt_ProxyPassword.ClientID%>").style.display = 'none';
                document.getElementById("<%=chk_Proxy.ClientID%>").style.display = 'none';
            }



        }


        function rdoCustomReport_CheckedChange() {

           
            var SenderCustomReport = document.getElementById("<%=rdoCustomReport.ClientID%>");

            if (SenderCustomReport.checked) {

                document.getElementById("<%=chk_PrefixText.ClientID%>").disabled = false;
                document.getElementById("<%=txt_PrefixText.ClientID%>").disabled = false;
                document.getElementById("<%=txt_FileExtension.ClientID%>").disabled = false;
                document.getElementById("<%=drp_FieldSeprator.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField1_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField1_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField2.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField2_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField2_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField3.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField3_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField3_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField4.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField4_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField4_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField5.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField5_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField5_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField6.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField6_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField6_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField7.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField7_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField7_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField8.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField8_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField8_2.ClientID%>").disabled = false;

                document.getElementById("<%=DRP_LastRunDateDD.ClientID%>").disabled = false;
                document.getElementById("<%=DRP_LastRunDateMM.ClientID%>").disabled = false;
                document.getElementById("<%=DRP_LastRunDateYYYY.ClientID%>").disabled = false;

            } else {
                document.getElementById("<%=chk_PrefixText.ClientID%>").disabled = true;
                document.getElementById("<%=txt_PrefixText.ClientID%>").disabled = true;
                document.getElementById("<%=txt_FileExtension.ClientID%>").disabled = true;
                document.getElementById("<%=drp_FieldSeprator.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField1_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField1_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField2.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField2_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField2_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField3.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField3_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField3_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField4.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField4_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField4_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField5.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField5_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField5_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField6.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField6_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField6_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField7.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField7_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField7_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField8.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField8_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField8_2.ClientID%>").disabled = true;

                document.getElementById("<%=DRP_LastRunDateDD.ClientID%>").disabled = true;
                document.getElementById("<%=DRP_LastRunDateMM.ClientID%>").disabled = true;
                document.getElementById("<%=DRP_LastRunDateYYYY.ClientID%>").disabled = true;
               
            }


        }


        function rdoP10P20Report_CheckedChange() {


            var SenderP10P20Report = document.getElementById("<%=rdoP10P20Report.ClientID%>");
            var controls = document.getElementById("<%=pnlExport.ClientID%>").getElementsByTagName("input");

            if (SenderP10P20Report.checked) {
                document.getElementById("<%=chk_PrefixText.ClientID%>").disabled = true;
                document.getElementById("<%=txt_PrefixText.ClientID%>").disabled = true;
                document.getElementById("<%=txt_FileExtension.ClientID%>").disabled = true;
                document.getElementById("<%=drp_FieldSeprator.ClientID%>").disabled = true;
                document.getElementById("<%=drp_DataField1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField1_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField1_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField2.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField2_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField2_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField3.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField3_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField3_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField4.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField4_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField4_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField5.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField5_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField5_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField6.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField6_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField6_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField7.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField7_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField7_2.ClientID%>").disabled = true;

                document.getElementById("<%=drp_DataField8.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField8_1.ClientID%>").disabled = true;
                document.getElementById("<%=txt_DataField8_2.ClientID%>").disabled = true;

                document.getElementById("<%=tblManualExport.ClientID%>").style.display = 'inline';

                for (var i = 0; i < controls.length; i++) {
                    controls[i].disabled = true;
                }
                

            } else {


                document.getElementById("<%=chk_PrefixText.ClientID%>").disabled = false;
                document.getElementById("<%=txt_PrefixText.ClientID%>").disabled = false;
                document.getElementById("<%=txt_FileExtension.ClientID%>").disabled = false;
                document.getElementById("<%=drp_FieldSeprator.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField1_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField1_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField2.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField2_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField2_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField3.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField3_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField3_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField4.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField4_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField4_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField5.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField5_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField5_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField6.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField6_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField6_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField7.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField7_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField7_2.ClientID%>").disabled = false;

                document.getElementById("<%=drp_DataField8.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField8_1.ClientID%>").disabled = false;
                document.getElementById("<%=txt_DataField8_2.ClientID%>").disabled = false;

                document.getElementById("<%=tblManualExport.ClientID%>").style.display = 'none';

                for (var i = 0; i < controls.length; i++) {
                    controls[i].disabled = false;
                }
                
                
            }



        }
       
    </script>
    <script type="text/javascript">
        document.getElementById("ob_drp_FileFormatContainer").style.zIndex = "99999";
    </script>
    </form>
    </body>
</html>
