<%@ page language="VB" autoeventwireup="false" inherits="ResetPassword, App_Web_0qcqrg5t" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/header.ascx" TagName="header" %>
<!DOCTYPE  html  PUBLIC  "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>eTimeTrackLite Server Online</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">
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
        </table>
      <div style="text-align: center;vertical-align: text-top">
      <br />
          <asp:Label ID="lblError" runat="server" Style="font-size: 14pt; color: #ff6666" Width="717px"></asp:Label>
          <br />
          <br />
          <asp:HyperLink ID="hprLink" Style="font-size: 14pt;" runat="server">Login Here</asp:HyperLink>
          
                <owd:Window ID="ChangePassword" runat="server" IsModal="true" Height="200" Width="405"
                    StyleFolder="~/Styles/mainwindow/blue" Title="Reset Password" VisibleOnLoad="true"
                    ShowCloseButton="false" ShowStatusBar="False" Left="350" Top="155">
                    <table width="100%" height="100%" cellpadding="1" class="Table" style="border-top-style: none;
                        border-right-style: none; border-left-style: none; border-bottom-style: none;">
                        <tr>
                            <td>
                                <fieldset>
                                    <legend>Reset Password</legend>
                                    <table>
                                        <tr>
                                            <td style="font-weight: bold;">
                                                New Password</td>
                                            <td>
                                                <asp:TextBox ID="txt_NewPassword" runat="server" TextMode="Password" Width="230px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: bold;">
                                                Confirm Password</td>
                                            <td>
                                                <asp:TextBox  ID="txt_ConfirmPassword"  runat="server" TextMode="Password" Width="230px"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button ID="Btn_Save" runat="server" Text="Save" Width="60px" OnClientClick="return Btn_SaveOnClientClick();" />
                                &nbsp;&nbsp;&nbsp;<input id="btn_Cancel" type="button" value="Close" onclick="return closeWindow();" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Lbl_Error" runat="server" EnableViewState="False" Text="&nbsp;" ForeColor="Red"></asp:Label>&nbsp;
                                <asp:HyperLink ID="hprLink1"  runat="server">Login Here</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </owd:Window>
            </div>
    </form>
    
    <script type="text/javascript">
        function closeWindow()
        {
         try
		         {
		        
		        ChangePassword.Close();
		         }
		         catch(ex)
		         {
		            alert(ex.message);
		         }
        
        }
        
        function Btn_SaveOnClientClick()
            {
                 
                
                    if(document.getElementById("<%=txt_NewPassword.ClientID %>").value==='')
                    {
                            document.getElementById("<%=Lbl_Error.ClientID %>").innerHTML="Please Enter New Password"
                            return false;
                    }
                    
                    else  if(document.getElementById("<%=txt_ConfirmPassword.ClientID %>").value==='')
                    {
                        document.getElementById("<%=Lbl_Error.ClientID %>").innerHTML="Please Enter Confirm Password"
                        return false;
                    }
                    
                    else if(document.getElementById("<%=txt_NewPassword.ClientID %>").value===document.getElementById("<%=txt_ConfirmPassword.ClientID %>").value)
                    {
                        return true;
                    }
                    
                    else
                        {
                            document.getElementById("<%=Lbl_Error.ClientID %>").innerHTML="New Password and Confirm Password is not Match"
                            return false;
                        }
            }
    </script>
  
</body>
</html>