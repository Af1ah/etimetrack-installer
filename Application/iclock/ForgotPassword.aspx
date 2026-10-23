<%@ page language="VB" autoeventwireup="false" inherits="Admin_ForgotPassword, App_Web_wdniqpox" enableeventvalidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Forgot Password Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
                function Close() {  
                   self.close();  
                } 
		      
        
   </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="rowEditTable">
            <tr>
                <td>
                    <span style="font-size: 11pt; color: #6699ff"><strong>Forgot&nbsp;Password:</strong></span></td>
            </tr>
            <tr>
                <td>
                    <fieldset>
                        <table>
                            <tr>
                                <td style="font-weight: bold;">
                                    Enter&nbsp;Email&nbsp;Id</td>
                                <td>
                                    <asp:TextBox ID="txt_EmailId" AutoComplete="off" runat="server" Width="299px"></asp:TextBox>
                                </td>
                               
                            </tr>
                           
                           
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2" style="text-align: center">
                    <asp:Button ID="btnSave" runat="server" Text="Submit" />
                    <input
                        id="btn_EditCancel" type="button" value="Close" onclick="Close();" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblError" runat="server" style="color: red" Width="409px"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
