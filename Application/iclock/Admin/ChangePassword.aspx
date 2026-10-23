<%@ page language="VB" autoeventwireup="false" inherits="Admin_ChangePassword, App_Web_kueexnan" enableeventvalidation="false" %>

<%@ Register Src="~/header.ascx" TagName="header" TagPrefix="uc1" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:header ID="Header1" runat="server" />
                <owd:Window ID="ChangePassword" runat="server" IsModal="true" Height="172"
            Width="405" StyleFolder="~/Styles/mainwindow/blue" Title="Change Password"
            VisibleOnLoad="true" ShowCloseButton="false" 
            ShowStatusBar="False" Left="350" Top="155">
            <table width="100%" height="100%" cellpadding="1" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Change Password</legend>
                            <table>
                              <tr>
                            <td style="font-weight: bold;">Old Password</td>
                            <td><asp:TextBox ID="txt_OldPassword" autocomplete="off" AutoCompleteType=Disabled runat="server" TextMode="Password" Width="230px"></asp:TextBox></td>
                            </tr>
                            <tr>
                            <td style="font-weight: bold;">New Password</td>
                            <td><asp:TextBox ID="txt_NewPassword" autocomplete="off" runat="server" AutoCompleteType=Disabled TextMode="Password" Width="230px"></asp:TextBox></td>
                            </tr>
                            
                            <tr>
                            <td style="font-weight: bold;">Confirm Password</td>
                            <td><asp:TextBox ID="txt_ConfirmPassword" autocomplete="off" runat="server" AutoCompleteType=Disabled TextMode="Password" Width="230px"></asp:TextBox></td>
                            </tr>
                                
                            </table>
                        </fieldset>
                    </td>
                    <tr>
                        <td align="right">
                            <asp:Button
                                ID="Btn_Save" runat="server" Text="Save" Width="60px" OnClientClick="return Btn_SaveOnClientClick();" />
                            &nbsp;&nbsp;&nbsp;<input id="btn_Cancel" type="button" value="Close" OnClick="return closeWindow();" />
                        </td>
                    </tr>
                <tr>
                    <td>
                        <asp:Label ID="Lbl_Error" runat="server" EnableViewState="False" Text="&nbsp;" ForeColor="Red"></asp:Label>
                           
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
