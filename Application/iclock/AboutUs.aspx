<%@ page language="VB" autoeventwireup="false" inherits="AboutUs, App_Web_wdniqpox" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript">
        function close_handle()
        {
            var Exp = '<%= Session("IsExpired") %>';
            if(Exp=="11")
            {
               top.location.href="logout.aspx"
            }
        }
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
       
        <owd:Window ID="AboutUsDialog" runat="server" OnClientClose="close_handle()"  StyleFolder="~/Styles/mainwindow/blue"
            Title="About eTimeTrackLite Server" VisibleOnLoad="true" Width="390" Height="168"
            ShowCloseButton="true" Left="50" Top="50" ShowStatusBar="false">
            <table width="100%" height="100%" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none;
                border-bottom-style: none;" runat="server" id="eTimeRegular">
                <tr>
                    <td>
                        <fieldset>
                            <legend></legend>
                            <table>
                                <tr>
                                    <td>
                                        Version
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_SoftwareVersion" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Activation Code:</td>
                                    <td>
                                        <asp:TextBox ID="lbl_ActivationCode" runat="server" Enabled="False" BorderStyle="None"
                                            Width="230px" BorderWidth="0px" 
                                            CssClass="aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                        License Key:</td>
                                    <td>
                                        <asp:TextBox ID="txt_LicenceKey" runat="server" Width="230px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td>
                                    <asp:Label ID="lbl_TrialVersion" Text="" runat="server"></asp:Label>
                                    </td>
                                    <td colspan="2" align="right">
                                        <asp:Label ID="lbl_Noofemployee"
                                            Text="2000" runat="server"></asp:Label>&nbsp;<asp:Label ID="lbl_NoofDevice" Text="2000"
                                                runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label runat="server" ID="lbl_Message" ForeColor="Red" EnableViewState="False"></asp:Label>&nbsp;&nbsp;&nbsp;<input
                            type="button" id="lnk_EditLicense" runat="server" onserverclick="lnk_EditLicense_onServerClick"
                            value="Save" />&nbsp;&nbsp;<input
                            type="button" id="Button1" runat="server"  onclick="AboutUsDialog.Close();"
                            value="Close" />

                    </td>
                </tr>
            </table>
            <table width="100%" height="100%" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none;
                border-bottom-style: none;" runat="server" id="eTimeCloud">
                <tr>
                    <td>
                        <fieldset>
                            <legend></legend>
                            <table>
                                <tr>
                                    <td>
                                        Version:
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_CloudVersion" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cloud&nbsp;Service&nbsp;Expiry&nbsp;Date:</td>
                                    <td>
                                        <asp:TextBox ID="txt_CloudExpiry" runat="server" readonly="true" 
                                            Enabled="False" BorderStyle="None"
                                            BorderWidth="0px" 
                                            CssClass="aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled"></asp:TextBox></td>
                                </tr>
                              
                                <tr>
                                    <td>
                                    </td>
                                    <td colspan="2" align="right">
                                        <asp:Label ID="lbl_cloudEmployee" Text="2000" runat="server"></asp:Label>&nbsp;<asp:Label
                                            ID="lbl_cloudDevice" Text="2000" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
             
            </table>
        </owd:Window>
    </form>
</body>
</html>
