<%@ page language="VB" autoeventwireup="false" inherits="Utilities_ExportLogs, App_Web_vcxdl3a3" enableeventvalidation="false" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="wnd_Export" runat="server" IsModal="true" Height="130"
            Width="480" StyleFolder="~/Styles/mainwindow/blue" Title="Backup & Clear Old Logs"
            VisibleOnLoad="true" ShowCloseButton="false" 
            ShowStatusBar="False" Left="350" Top="155">
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Backup & Clear Old Logs</legend>
                            <table>
                            <tr>
                            <td>From Date</td>
                            <td >
                                 <select ID="drp_FromDateday"  runat="server"   class="WebControls" ></select>&nbsp;<select ID="drp_FromDatemonth"  class="WebControls"  runat="server" EnableViewState="true"></select>&nbsp;<select ID="drp_FromDateYear" runat="server"  class="WebControls"  EnableViewState="true"> </select>&nbsp;
                            </td>
                            <td>To Date</td>
                            <td >
                                 <select ID="drp_ToDateday"  runat="server"  class="WebControls" ></select>&nbsp;<select ID="drp_ToDatemonth"  class="WebControls"  runat="server" EnableViewState="true"></select>&nbsp;<select ID="drp_ToDateyear" runat="server"  class="WebControls"  EnableViewState="true"> </select>&nbsp;
                            </td>
                            </tr>
                            
                           <tr>
                           <td>
                           
                           </td>
                           <td>
                               <asp:CheckBox ID="chk_ClearLogs" runat="server" Text="Clear Logs"  CssClass="WebControls" />
                           </td>
                           </tr>
                                
                            </table>
                        </fieldset>
                    </td>
                    <tr>
                        <td>
                        <table>
                        <tr>
                        <td width="350px">
                        <asp:Label ID="Lbl_Error" runat="server" EnableViewState="False" CssClass="WebControls"  ForeColor="Red"></asp:Label>
                        </td>
                        <td align="right">
                        <asp:Button ID="Btn_Save" runat="server" Text="Save"  CssClass="WebControls"  /> &nbsp;&nbsp;<input id="btn_Cancel" type="button" value="Close"   Class="WebControls"  OnClick="return closeWindow();" />
                        </td>
                        </tr>
                        </table>
                        </td>
                    </tr>
                <tr>
                    <td>
                           
                    </td>
                </tr>
            </table>
        </owd:Window>
    </div>
    </form>
</body>
</html>
