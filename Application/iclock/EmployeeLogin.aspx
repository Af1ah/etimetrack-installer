<%@ page language="VB" autoeventwireup="false" inherits="EmployeeLogin, App_Web_wdniqpox" enableeventvalidation="false" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET" %>
<%@ Register TagPrefix="cc1" Namespace="WebControlCaptcha" Assembly="WebControlCaptcha" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>eTimeTrackLite Server Online</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body   topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" >
            <tr style="font-size: 0;">
                <td style="width: 403px; height: 85px;">
                    <img alt="Logo" src="images/logo.gif" border="0" />
                </td>
                <td align="right" width="100%">
                    <img alt="Top Header Image" src="images/tophimg.gif" border="0" />
                </td>
            </tr>
            <tr style="font-size: 0;">
                <td colspan="2" style="background-color: lightsteelblue;">
                    <img alt="Top Header Divider" src="images/header_divider.gif" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <img alt="Background" src="images/bck1.gif" />
                </td>
            </tr>
        </table>
        <owd:Dialog   ID="StaffloginDialog" runat="server" StyleFolder="~/Styles/mainwindow/blue"
            Title="Login Window" VisibleOnLoad="true" Width="420" Height="280" IsModal="true"
            ShowCloseButton="true">
            <table style="background-color: #F1F2EF;width:100%;" cellpadding="0" cellspacing="0" >
                <tr style="font-size: 0;">
                    <td>
                        <img src="images/login-header.gif" />
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 30px; padding-top: 20px;" align="left">
                        <table cellpadding="1px" style="width:350px;" >
                            <tr>
                                <td style="width:100px;" align="right">
                                    <b><asp:Label ID="Label1" runat="server" Text="Login Name"></asp:Label></b></td>
                                <td align="left">
                                    <asp:TextBox ID="txt_LoginName" runat="server" Width="210px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b><asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></b></td>
                                <td  align="left">
                                    
                                    <asp:TextBox ID="Txt_Password"  runat="server" TextMode="Password"  Width="210px"></asp:TextBox></td>
                            </tr>
                            <tr><td colspan="2"  align="right"  >
                            <table width="100%"><tr><td>
                            <cc1:captchacontrol id="CaptchaControl1" runat="server" CaptchaChars="ACDEFGHJKLNPQRTUVXYZ2346789" CaptchaMinTimeout="3" ErrorMessage="" Text="Enter the code shown:"></cc1:captchacontrol></td><td><asp:ValidationSummary  ID="ValidationSummary1" runat="server" Visible="False"  />
                            </td></tr></table>
                            </td></tr>
                            <tr>
                                <td align="right" colspan="2" >
                                <table>
                                <tr>
                                <td>
                                <asp:Label ID="lbl_InValidError" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                                </td>
                                <td align="right">
                                <asp:Button ID="Btn_Ok" runat="server" Width="70px" Text="Login" />&nbsp;&nbsp;&nbsp;
                                </td>
                                </tr>
                                </table>
                            </tr>
                            <tr></tr>
                            <tr></tr>
                            <tr></tr>
                            <tr></tr>
                            <tr></tr>
                            <tr></tr>
                            
                            
                        </table>
                    </td>
                </tr>
            </table>
        </owd:Dialog>
        
    </form>

</body>
</html>
