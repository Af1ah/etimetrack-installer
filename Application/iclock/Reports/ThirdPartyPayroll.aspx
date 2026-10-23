<%@ page language="VB" autoeventwireup="false" inherits="Reports_ThirdPartyPayroll, App_Web_z1ac55br" enableeventvalidation="false" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
    </div>
 
    <div>
     <uctrl:header ID="MyHeader" runat="server" />
     
        <owd:Dialog ID="ReportProtoType" runat="server" IsModal="true"  Height="380" Width="570"
            StyleFolder="~/Styles/mainwindow/blue" Title="Continuous Abnormality  Report"  
             VisibleOnLoad="true" ShowCloseButton="true"  Left="250" Top="20"> 
              
               <table cellpadding="2">
             <tr></tr>
             <tr></tr>
             <tr >
             <td>&nbsp;From Date&nbsp;&nbsp;</td>
             <td style="width: 173px" >
               <asp:DropDownList ID="Drp_FromDateDD" runat="server" Width="50px"> </asp:DropDownList>
                <asp:DropDownList ID="Drp_FromDateMM" runat="server" Width="52"></asp:DropDownList>
                <asp:DropDownList ID="Drp_FromDateYYYY" runat="server" Width="58"> </asp:DropDownList>
             </td>
             <td></td>
             <td>&nbsp;To Date&nbsp;&nbsp;</td>
              <td>
              <asp:DropDownList ID="Drp_ToDateDD" runat="server" Width="50px"></asp:DropDownList>
              <asp:DropDownList ID="Drp_ToDateMM" runat="server" Width="52px"></asp:DropDownList>
              <asp:DropDownList ID="Drp_ToDateYYYY" runat="server" Width="58px"></asp:DropDownList> 
              </td>
              </tr>
              <tr></tr>
              <tr></tr>
              <tr></tr>
              <tr>
              <td>File Format</td>
              <td><asp:DropDownList ID="drp_Fileformat" runat="server" Width="150px"></asp:DropDownList>  </td>
              <td></td>
              <td>File Extension </td>
             <td><asp:TextBox ID="txt_fileExtension" runat="server" Width="150px"></asp:TextBox> </td>
             
              </tr>
              
              
              <%--<tr>
              <td colspan="5">
              <<input type="file" name="filediag" style="display:none" />
    <input type="button" value="open file dialogue box..." 
            onclick="document.form1.filediag.click()" />


<asp:FileUpload ID="FileUpload1" runat="server" />
              
              </td>
              
              </tr>--%>
              
              </table>
             
             
             </owd:Dialog>
    
    </div>
    </form>
</body>
</html>
