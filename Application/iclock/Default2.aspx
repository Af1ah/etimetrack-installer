<%@ page language="VB" autoeventwireup="false" inherits="Default2, App_Web_wdniqpox" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Basic Update Panel</title>
  <script type="text/javascript">
      var count = 0
      function oJump() {
          var lb = document.getElementById("Label1");
          lb.innerText = document.getElementById("<%=HiddenField1.ClientID %>").value;
//          count++;
//          if (lb.innerText == 10)
//          { clearTimeout(obj) }
      }
      function run() {
          var obj = setInterval("oJump()", 1000);
      }
</script>
</head>
<body>
<form id="form1" runat="server">
<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
      
        </ContentTemplate>
    </asp:UpdatePanel>
    <input id="Button1" type="button" value="button" onclick="run();" />
          <asp:Button ID="Button2" runat="server" Text="aspbutton" /><asp:HiddenField ID="HiddenField1"
        runat="server" />
</div>
    </form>
</body>
</html>
