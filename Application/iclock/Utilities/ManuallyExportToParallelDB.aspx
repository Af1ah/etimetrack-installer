<%@ page language="VB" autoeventwireup="false" inherits="Utilities_ManuallyExportToParallelDB, App_Web_vcxdl3a3" enableEventValidation="false" %>

<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div>
                <uctrl:header ID="MyHeader" runat="server" />
                <owd:Window ID="ParallelProtoType" runat="server" IsModal="true" Height="160" Width="350"
                    StyleFolder="~/Styles/mainwindow/blue" Title="Export Logs to Parallel DB" VisibleOnLoad="true"
                    ShowCloseButton="true" Left="350" Top="155" ShowStatusBar="False">
                    <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                        border-right-style: none; border-left-style: none; border-bottom-style: none;">
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
                        </tr>
                        <tr>
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
                            <td colspan="2">
                            </td>
                        </tr>
                        <tr>
                            <td style="width:50;">
                            </td>
                            <td align="left">
                                <asp:Timer ID="ProcessTimer" Enabled="false" Interval="100" runat="server">
                                </asp:Timer>
                                <br />

                                <asp:Button ID="btn_Export" runat="server" CssClass="WebControls" Text="Export" OnClientClick="javascript:document.getElementById('ParallelProtoType_lblStatus').innerHTML='';" />&nbsp;&nbsp;<input
                                    id="Button1" type="button" value="Close" onclick="ParallelProtoType.Close();"
                                    class="WebControls" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr />
                                <asp:Label ID="lblStatus" runat="server"  CssClass="WebControls" ForeColor="Red" Height="20px"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </owd:Window>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
<script type="text/javascript">
    
</script>
<script type="text/javascript">


</script>
