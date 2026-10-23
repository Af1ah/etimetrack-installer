<%@ page language="VB" autoeventwireup="false" inherits="Reports_ReportFilter1, App_Web_z1ac55br" enableeventvalidation="false" %>


<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>

<script runat="server">

	
	

</script>
<html>
	<head>
		<title>obout slide menu example - xp_silver style</title>
		<style type="text/css">
			body {
				font:11px Verdana;
				color:#333333;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}
			a:hover {
				color:crimson;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
			xp_silver style example
			
			<br /><br />
			
			<ASP:PlaceHolder runat="server" id="SMPlaceholder"></ASP:PlaceHolder>
			
			<br /><br /><br />
			
			<%--<a href="Default.aspx?div=vb">« Back to examples</a>--%>
		</form>
	</body>
</html>