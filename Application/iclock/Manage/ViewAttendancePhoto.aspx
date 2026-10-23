<%@ page language="VB" autoeventwireup="false" inherits="Manage_ViewAttendancePhoto, App_Web_usmjemmz" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type = "text/javascript">

        function OnClose() {

            if (window.opener != null && !window.opener.closed) {

                window.opener.HideModalDiv();

            }

        }

        window.onunload = OnClose;

</script>


</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <asp:Image ID="img_Photo" runat="server" Height="236px" Width="226px" />
        </center>
    </div>
    </form>
</body>
</html>
