<%@ page language="VB" autoeventwireup="false" inherits="LogOut, App_Web_wdniqpox" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
    function DisableHistory() {
    window.history.forward(1);
    }
    function RedirectToHome() {
    setTimeout("window.top.location.href = 'Default.aspx'",0);
    }
    </script>
</head>
<body onload="RedirectToHome();">
    <form id="form1" runat="server">
    <div>
    <span class="kwrd"></span> 
    </div>
    </form>
</body>
</html>