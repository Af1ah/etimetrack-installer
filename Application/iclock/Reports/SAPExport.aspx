<%@ page language="VB" autoeventwireup="false" inherits="Reports_SAPExport, App_Web_g2q1nt2r" enableeventvalidation="false" %>

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
<body>
    <form id="form1" runat="server">
    <div>
         <div>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
    </div>
 
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="ReportProtoType" runat="server" IsModal="true" Height="200" Width="570"
            StyleFolder="~/Styles/mainwindow/blue" Title="SAP P10/P20 Export" VisibleOnLoad="true"
            ShowCloseButton="true" Left="80" Top="45" ShowStatusBar="False">
            <table width="100%" height="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset>
                            <table>
                                <tr>
                                    <td>
                                        From Date
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
                                        To Date
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
                                <tr>
                                    <td>
                                        File&nbsp;Format
                                    </td>
                                    <td>
                                        <obout:Combobox Validate="False" ID="drp_FileFormat" CssClass="WebControls" runat="server"
                                            FolderStyle="~/styles/default" SelectedIndex="0" Expanded="False" Width="154"
                                            Mode="Combobox" OpenOnSuggest="False" Sort="None" Text="dd_MM_yyyy" 
                                            Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_2_">
                                            <Options>
                                                
<obout:Option ID="Option3" runat="server" Text="dd_MM_yyyy" 
                                            Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_2_"></obout:Option>
                                                
<obout:Option ID="Option5" runat="server" Text="ddMMyyyy" 
                                            Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_4_"></obout:Option>
                                                
<obout:Option ID="Option1" runat="server" Text="dd-MM-yyyy" 
                                            Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_"></obout:Option>
                                                
<obout:Option ID="Option4" runat="server" Text="MM_dd_yyyy" 
                                            Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_3_"></obout:Option>
                                                
<obout:Option ID="Option6" runat="server" Text="MMddyyyy" 
                                            Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_5_"></obout:Option>
                                                
<obout:Option ID="Option2" runat="server" Text="MM-dd-yyyy" 
                                            Value="cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_0_cbo_1_"></obout:Option>
                                            
</Options>
                                        
</obout:Combobox>
                                    </td>
                                    <td>
                                        File&nbsp;Extn
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FileExtn" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Enter&nbsp;Path
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtPath" Width="300px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                 <tr>
                                    <td align="left" colspan="3">
                                        <asp:CheckBox ID="chk_PrefixWithZero" Checked="true"  Text="Prefix With Zero [8]."
                                            runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="3">
                                        <asp:CheckBox ID="chk_IncludeEmployeeDeviceCode" Text="Include Employee Device Code at the end."
                                            runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btn_Export" CssClass="WebControls" runat="server" Text="Export"  
                             OnClientClick="this.disabled = true; this.value = 'Exporting...';" UseSubmitBehavior="false"/>&nbsp;<input type="button" class="WebControls" value="Close"
                                id="btn_Close" onclick="ReportProtoType.Close();" />&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </owd:Window>
    </div>
    </form>
    <script type="text/javascript">
        document.getElementById("ob_drp_FileFormatContainer").style.zIndex = "99999";
    </script>
</body>
</html>
