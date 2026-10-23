<%@ page language="VB" autoeventwireup="false" inherits="CustomError, App_Web_wdniqpox" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div style="background-color: #A52A2A; color: White; height: 10px;">
    </div>
    <div style="background-color: #F0F8FF; color: Black; height: 170px;">
        <div style="padding: 20px;">
            <h3>
                Application Error:</h3>
            <h4>
                Sorry, an error occurred while processing your request.
            </h4>
            <h6>
                <asp:LinkButton ID="lnlLogin" runat="server" OnClick="DetailLinkButton_Click" PostBackUrl="~/LogOut.aspx"
            Style="font-weight: bold">Go To Login</asp:LinkButton></h6>
            <br />
            <br />
        </div>
    </div>
    <div style="background-color: #A52A2A; color: White; height: 20px;">
    </div>
   
    </form>
</body>
</html>
