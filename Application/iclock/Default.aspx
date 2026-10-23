<%@ page language="VB" autoeventwireup="false" inherits="_Default, App_Web_wdniqpox" enableeventvalidation="false" %>

<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET" %>
<!DOCTYPE  html  PUBLIC  "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>eTimeTrackLite Server Online</title>
    <script type="text/javascript">
        window.onload = function () {
            if (top.location.href != self.location.href)
                top.location.href = 'Default.aspx';
        };


        function OpenPopUpWindow() {
            var iMyWidth;
            var iMyHeight;
            iMyWidth = (window.screen.width / 2) - (75 + 10);
            iMyHeight = (window.screen.height / 2) - (100 + 50);
            window.open("ForgotPassword.aspx?", "PopupChild", "status=no,height=150,width=460,resizable=yes,left=" + iMyWidth + ",top=" + iMyHeight + ",screenX=" + iMyWidth + ",screenY=" + iMyHeight + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
        }
    </script>

  

    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">


 <script src="js/crypto-js.min.js" type="text/javascript"></script>
  

    <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0">
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
    <owd:Dialog ID="StaffloginDialog" runat="server" StyleFolder="~/Styles/mainwindow/blue"
        Title="Login Window" VisibleOnLoad="true" Width="420" Height="220" IsModal="true"
        ShowCloseButton="true">
        <table style="background-color: #F1F2EF; width: 100%;" cellpadding="0" cellspacing="0">
            <tr style="font-size: 0;">
                <td>
                    <img src="images/login-header.gif" />

                </td>
            </tr>
            <tr>
                <td style="padding-left: 30px; padding-top: 20px;" align="left">
                    <table cellpadding="1px" style="width: 350px;">
                        <tr>
                            <td style="width: 100px;" align="right">
                                <b>
                                    <asp:Label ID="Label1" runat="server" Text="Login Name"></asp:Label></b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txt_LoginName"  runat="server" Width="210px" onkeydown="return (event.keyCode!=222);"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b>
                                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="Txt_Password" AutoCompleteType=Disabled autocomplete="off" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
                                <asp:HiddenField ID="txtKey" runat="server" ></asp:HiddenField>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_InValidError" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                                        </td>
                                        <td align="right">
                                            <asp:Button ID="Btn_Ok" runat="server"   OnClientClick="Javascript:Encrypt();"  Width="70px" Text="Login" />&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="right">
                                            <asp:LinkButton ID="lnkForgotPasswprd" runat="server">Forgot&nbsp;Password?</asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                </table>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </owd:Dialog>
    <owd:Dialog ID="wnd_UpdateLicesnseMessageWindow" runat="server" ShowCloseButton="False"
        VisibleOnLoad="false" Height="125" Width="300" StyleFolder="~/Styles/mainwindow/blue"
        Title="Update License Key" IsModal="False">
        <table>
            <tr>
                <td>
                    <fieldset style="width: 280px">
                        <legend>Update Licesnse Key</legend>
                        <table>
                            <tr>
                                <td>
                                    Your Evalution period has expired. Please update licesnse key?
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Btn_LicenseYes" runat="server" Text="Yes" />
                                    &nbsp;<input id="Btn_LicenseNo" type="button" value="No" onclick="javascript:wnd_UpdateLicesnseMessageWindow.Close();" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_DelError" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </owd:Dialog>&nbsp;
    <owd:Dialog ID="wnd_EvalutionPeriodMessageWindow" runat="server" Height="135" Width="300"
        StyleFolder="~/Styles/mainwindow/blue" Title="eSSL Cloud Service" IsModal="true"
        ShowCloseButton="False" VisibleOnLoad="false">
        <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
            border-right-style: none; border-left-style: none; border-bottom-style: none;">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_Evalution" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btn_EvalutionOk" runat="server" Text="Ok" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </owd:Dialog>
  


    </form>


      <script type="text/javascript">
          //Secret Key.


          function Encrypt() {
              
              var secretKey = document.getElementById("<%=txtKey.ClientID%>").value;

              //Secret Bytes.
              var secretBytes = CryptoJS.enc.Utf8.parse(secretKey);
              //Read the Plain text.
              var txtPlain = document.getElementById("<%=Txt_Password.ClientID%>");


              //Encrypt with AES Alogorithm using Secret Key.
              var encrypted = CryptoJS.AES.encrypt(txtPlain.value, secretBytes, {
                  mode: CryptoJS.mode.ECB,
                  padding: CryptoJS.pad.Pkcs7
              });
              
              //Set the encrypted Text in TextBox.
              txtPlain.value = encrypted;
          }
    </script>


</body>
</html>
