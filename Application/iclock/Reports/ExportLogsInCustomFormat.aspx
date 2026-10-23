<%@ page language="VB" autoeventwireup="false" inherits="Reports_ExportLogsInCustomFormat, App_Web_g2q1nt2r" enableeventvalidation="false" %>

<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
       

</head>
<body onload="OnPageLoad();chk_PrefixText_onClick();">
    <form id="form1" runat="server">
     <div>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
    </div>
 
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="ReportProtoType" runat="server" IsModal="true" Height="520" Width="730"
            StyleFolder="~/Styles/mainwindow/blue" Title="Export Logs in Custom Format" VisibleOnLoad="true"
            ShowCloseButton="true" Left="80" Top="45" ShowStatusBar="False">
            <table width="100%" height="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                From&nbsp;Date
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
                                                To&nbsp;Date
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="Drp_ToDateDD" runat="server" CssClass="WebControls">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="Drp_ToDateMM" runat="server" CssClass="WebControls">
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="Drp_ToDateYYYY" runat="server" CssClass="WebControls">
                                                </asp:DropDownList>
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
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                File Format
                                            </td>
                                            <td>
                                                <obout:Combobox Validate="false" ID="drp_FileFormat" CssClass="WebControls" runat="server"
                                                    Width="110" FolderStyle="~/styles/default" SelectedIndex="0" Text="dd_MM_yyyy"
                                                    Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_2_">
                                                    <Options>
                                                        <obout:Option ID="Option1" runat="server" Text="dd-MM-yyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_2_"></obout:Option>
                                                        <obout:Option ID="Option2" runat="server" Text="MM-dd-yyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_1_"></obout:Option>
                                                        <obout:Option ID="Option3" runat="server" Text="dd_MM_yyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_"></obout:Option>
                                                        <obout:Option ID="Option4" runat="server" Text="MM_dd_yyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_3_"></obout:Option>
                                                        <obout:Option ID="Option5" runat="server" Text="ddMMyyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_4_"></obout:Option>
                                                        <obout:Option ID="Option6" runat="server" Text="MMddyyyy" Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_5_"></obout:Option>
                                                    </Options>
                                                </obout:Combobox>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chk_PrefixText" runat="server" onclick="chk_PrefixText_onClick();"
                                                    Text="PrefixText" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_PrefixText" Enabled="false" runat="server" Width="90px" CssClass="aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled WebControls"></asp:TextBox>
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
                                                    <asp:ListItem>Semicolon</asp:ListItem>
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
                                                    <asp:ListItem>Device Id</asp:ListItem>
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
                                                    <asp:ListItem>Device Id</asp:ListItem>
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
                                                    <asp:ListItem Selected="True">Device Id</asp:ListItem>
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
                                                    <asp:ListItem>Device Id</asp:ListItem>
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
                                                    <asp:ListItem>Device Id</asp:ListItem>
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
                                                    <asp:ListItem>Device Id</asp:ListItem>
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
                                                    <asp:ListItem>Device Id</asp:ListItem>
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
                                                    <asp:ListItem>Device Id</asp:ListItem>
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
                            <tr id="tr_AdditionalDirection">
                                <td colspan="6">
                                    <fieldset>
                                        <legend>Additional Direction Values</legend>
                                        <table>
                                            <tr>
                                                <td>
                                                    BreakIn Dir Symbol
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_BreakIn" runat="server" Text="3" Width="100px" CssClass="WebControls"></asp:TextBox>
                                                </td>
                                                <td>
                                                    BreakOut Dir Symbol
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_BreakOut" runat="server" Text="2" Width="100px" CssClass="WebControls"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                Enter&nbsp;Path
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPath" runat="server"></asp:TextBox>
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
                                    <asp:Button ID="btn_Generate" CssClass="WebControls" runat="server" Text="Generate"
                                        OnClientClick="this.disabled = true; this.value = 'Exporting...';" UseSubmitBehavior="false" />&nbsp;<input
                                            type="button" class="WebControls" value="Close" id="btn_Close" onclick="ReportProtoType.Close();" />&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </owd:Window>
    </div>
    </form>
    <script type="text/javascript">

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
                   
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField1_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField1_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField1_2.ClientID %>").style.display = 'inline';
                }
            }

            else if (object.title == '2') {
                document.getElementById("<%=lbl_DataField2_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField2_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField2_2.ClientID %>").style.display = 'none';
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField2_1.ClientID %>").innerHTML = 'Format';
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField2_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField2_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField2_2.ClientID %>").style.display = 'inline';
                }
            }

            else if (object.title == '3') {
                document.getElementById("<%=lbl_DataField3_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField3_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField3_2.ClientID %>").style.display = 'none';
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField3_1.ClientID %>").innerHTML = 'Format';
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField3_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField3_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField3_2.ClientID %>").style.display = 'inline';
                }
            }

            else if (object.title == '4') {
                document.getElementById("<%=lbl_DataField4_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField4_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField4_2.ClientID %>").style.display = 'none';
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField4_1.ClientID %>").innerHTML = 'Format';
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField4_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField4_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField4_2.ClientID %>").style.display = 'inline';
                }
            }

            else if (object.title == '5') {
                document.getElementById("<%=lbl_DataField5_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField5_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField5_2.ClientID %>").style.display = 'none';
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField5_1.ClientID %>").innerHTML = 'Format';
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField5_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField5_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField5_2.ClientID %>").style.display = 'inline';
                }
            }

            else if (object.title == '6') {
                document.getElementById("<%=lbl_DataField6_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField6_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField6_2.ClientID %>").style.display = 'none';
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField6_1.ClientID %>").innerHTML = 'Format';
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField6_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField6_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField6_2.ClientID %>").style.display = 'inline';
                }
            }

            else if (object.title == '7') {
                document.getElementById("<%=lbl_DataField7_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField7_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField7_2.ClientID %>").style.display = 'none';
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField7_1.ClientID %>").innerHTML = 'Format';
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField7_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField7_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField7_2.ClientID %>").style.display = 'inline';
                }
            }

            else if (object.title == '8') {
                document.getElementById("<%=lbl_DataField8_1.ClientID %>").innerHTML = 'No of Char';
                document.getElementById("<%=lbl_DataField8_2.ClientID %>").style.display = 'none';
                document.getElementById("<%=txt_DataField8_2.ClientID %>").style.display = 'none';
                if (object.value == 'Punch Date Time') {
                    document.getElementById("<%=lbl_DataField8_1.ClientID %>").innerHTML = 'Format';
                }
                else if (object.value == 'Direction') {
                    document.getElementById("<%=lbl_DataField8_1.ClientID %>").innerHTML = 'In Dir Symbol';
                    document.getElementById("<%=lbl_DataField8_2.ClientID %>").style.display = 'inline';
                    document.getElementById("<%=txt_DataField8_2.ClientID %>").style.display = 'inline';
                }
            }
            document.getElementById("tr_AdditionalDirection").style.display = 'none';
            if (document.getElementById("<%=drp_DataField1.ClientID %>").value == 'Direction' || document.getElementById("<%=drp_DataField2.ClientID %>").value == 'Direction' || document.getElementById("<%=drp_DataField3.ClientID %>").value == 'Direction' || document.getElementById("<%=drp_DataField4.ClientID %>").value == 'Direction' || document.getElementById("<%=drp_DataField5.ClientID %>").value == 'Direction' || document.getElementById("<%=drp_DataField6.ClientID %>").value == 'Direction' || document.getElementById("<%=drp_DataField7.ClientID %>").value == 'Direction' || document.getElementById("<%=drp_DataField8.ClientID %>").value == 'Direction') {
                document.getElementById("tr_AdditionalDirection").style.display = 'inline';
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
    </script>
    <script type="text/javascript">
        document.getElementById("ob_drp_FileFormatContainer").style.zIndex = "99999";
    </script>
</body>
</html>
