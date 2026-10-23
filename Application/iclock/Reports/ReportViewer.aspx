<%@ page language="VB" autoeventwireup="false" inherits="Reports_ReportViewer, App_Web_z1ac55br" enableeventvalidation="false" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
     <div>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
    </div>
 
    <div>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="1000px" Width="100%">
    </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
