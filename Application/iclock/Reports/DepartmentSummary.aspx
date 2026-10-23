<%@ page language="VB" autoeventwireup="false" inherits="Reports_DepartmentSummary, App_Web_z1ac55br" enableeventvalidation="false" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function jsShowHideProgress() {
            setTimeout(function () { document.getElementById('imgloadinggif').style.display = 'block'; }, 200);
            deleteCookie();

            var timeInterval = 200; // milliseconds (checks the cookie for every half second )

            var loop = setInterval(function () {
                if (IsCookieValid()) {
                    document.getElementById("<%=btn_Calculate.ClientID %>").disabled = false;
                    document.getElementById('imgloadinggif').style.display = 'none'; clearInterval(loop)
                }

            }, timeInterval);
        }

        // cookies
        function deleteCookie() {
            var cook = getCookie('ExcelDownloadFlag');
            document.getElementById('ReportProtoType_lblStatus').innerHTML = '';
            document.getElementById("<%=btn_Calculate.ClientID %>").disabled = true;
            if (cook != "") {
                document.cookie = "ExcelDownloadFlag=; Path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
            }
        }

        function IsCookieValid() {
            var cook = getCookie('ExcelDownloadFlag');
            return cook != '';
        }

        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }
    </script>

</head>
<body onload="chk_CompanySelectDeselectAll_Changed();chk_DepartmentSelectDeselectAll_Changed();">
    <form id="form1" runat="server">
     <div>
        
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;background-color:White; " runat="server" id="tblReport">
                <tr id="trHeader" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                        padding: 5px; color: white;">
                        Report View
                    </td>
                    <td align="right">
                        <input id="btnDisplayReportForm" type="button" onclick="ReportProtoType.Open();" value="Regenerate Report" />&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div style="">
                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BorderColor="Black" BackColor="White"
                                Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana"
                                WaitMessageFont-Size="14pt" Width="1000px" Height="1000px" AsyncRendering="true"
                                SizeToReportContent="true">
                            </rsweb:ReportViewer>
                             <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </div>
                    </td>
                </tr>
            </table>
       

    </div>
 
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <owd:Window ID="ReportProtoType" runat="server" IsModal="true" Height="335" Width="518"
                StyleFolder="~/Styles/mainwindow/blue" Title="Department Summary" VisibleOnLoad="true"
                ShowCloseButton="true" Left="80" Top="45" ShowStatusBar="False">
                <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                    border-right-style: none; border-left-style: none; border-bottom-style: none;">
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;From Date&nbsp;&nbsp;</td>
                        <td style="width: 173px">
                            <asp:DropDownList ID="Drp_FromDateDD" runat="server" CssClass="WebControls">
                            </asp:DropDownList>
                            <asp:DropDownList ID="Drp_FromDateMM" runat="server" CssClass="WebControls">
                            </asp:DropDownList>
                            <asp:DropDownList ID="Drp_FromDateYYYY" runat="server" CssClass="WebControls">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;To Date&nbsp;&nbsp;</td>
                        <td>
                            <asp:DropDownList ID="Drp_ToDateDD" runat="server" CssClass="WebControls">
                            </asp:DropDownList>
                            <asp:DropDownList ID="Drp_ToDateMM" runat="server" CssClass="WebControls">
                            </asp:DropDownList>
                            <asp:DropDownList ID="Drp_ToDateYYYY" runat="server" CssClass="WebControls">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;Select Company&nbsp;&nbsp;</td>
                        <td colspan="2" align="left">
                            &nbsp;Select Departments&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:ListBox ID="Lst_Company" runat="server" Height="135px" Width="145px" CssClass="WebControls"
                                BorderStyle="Solid" BorderWidth="1px" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                        <td colspan="2" align="left">
                            <asp:ListBox ID="Lst_Department" runat="server" Height="135px" Width="145px" CssClass="WebControls"
                                BorderStyle="Solid" BorderWidth="1px" SelectionMode="Multiple"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                            <asp:RadioButton ID="rdo_SelectAllCompany" Checked="true" Text="Select All" onClick="javascript:chk_CompanySelectDeselectAll_Changed();"
                                GroupName="a" runat="server" />&nbsp;&nbsp;
                            <asp:RadioButton ID="rdo_DeselectAllCompany" Text="Deselect All" GroupName="a" runat="server"
                                onClick="javascript:chk_CompanySelectDeselectAll_Changed();" />
                        </td>
                        <td colspan="2" align="left">
                            &nbsp;
                            <asp:RadioButton ID="rdo_SelectAllDepartment" Checked="true" Text="Select All" onClick="javascript:chk_DepartmentSelectDeselectAll_Changed();"
                                GroupName="b" runat="server" />&nbsp;&nbsp;
                            <asp:RadioButton ID="rdo_DeselectAllDepartment" Text="Deselect All" GroupName="b"
                                runat="server" onClick="javascript:chk_DepartmentSelectDeselectAll_Changed();" />
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr  id="trReportFormat" runat=server>
                        <td colspan="4">
                            <fieldset>
                                <legend>
                                    <asp:Label ID="Label1" runat="server" Text="Export File Format" CssClass="WebControls"></asp:Label></legend>
                                <table>
                                    <tr>
                                        <td>
                                            Export File Format&nbsp;&nbsp;</td>
                                        <td>
                                            <asp:RadioButtonList ID="rbtn_FileFormat" RepeatDirection="Horizontal" runat="server">
                                                <asp:ListItem>Excel</asp:ListItem>
                                                <asp:ListItem Selected="True">PDF</asp:ListItem>
                                            </asp:RadioButtonList></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <img style="display: none" id="imgloadinggif" src="../Images/loading.gif" alt="loading.." />&nbsp;
                        </td>
                        <td colspan="4" align="right">
                            <asp:Button ID="btn_Calculate" runat="server" CssClass="WebControls" Text="Generate Report"
                                OnClientClick="jsShowHideProgress();" UseSubmitBehavior="false" />&nbsp;&nbsp;<input
                                    id="Button1" type="button" value="Close" onclick="ReportProtoType.Close();" class="WebControls" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <hr />
                            <asp:Label ID="lblStatus" runat="server" CssClass="WebControls" ForeColor="Red" Height="20px"></asp:Label>
                        </td>
                    </tr>
                </table>
            </owd:Window>
            
            <asp:LinkButton Visible="false" ID="Lnk_SelectAllCompany" runat="server" OnClientClick="return SelectAllComany();">Select All</asp:LinkButton>
            &nbsp;&nbsp;
            <asp:LinkButton Visible="false" ID="Lnk_DeSelectAllCompany" runat="server" OnClientClick="return DeSelectAllComany();">DeSelect All</asp:LinkButton>
            &nbsp;<asp:LinkButton Visible="false" ID="Lnk_SelectAllDepartment" runat="server"
                OnClientClick="return SelectAllDepartment();">Select All</asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton Visible="false" ID="Lnk_DeSelectAllDepartment" runat="server" OnClientClick="return DeSelectAllDepartment();">DeSelect All</asp:LinkButton>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">

   // SELECT ALL 
   
     function SelectAllComany()
        {
                 
	            var ListViewObject=document.getElementById("<%=Lst_Company.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=true;
		                }
		               return false;
	                    }
	                    
	                    
	   function SelectAllDepartment()
            {
            
	           var ListViewObject=document.getElementById("<%=Lst_Department.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=true;
		                }
		            return false;    
	            }
	            
	            // DESELECT ALL
	            
	          function DeSelectAllComany()
                 {
                 
	            var ListViewObject=document.getElementById("<%=Lst_Company.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=false;
		                }
		                        return false;
	                    }
        
              function DeSelectAllDepartment()
                 {
	            var ListViewObject=document.getElementById("<%=Lst_Department.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=false;
		                }
		                        return false;
	                    }
	                    
	                    
	                    
	                    
	                     function chk_CompanySelectDeselectAll_Changed() 
        {
              var checkStatus=document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").checked;
              if (checkStatus)
              {
              
                    var ListViewObject=document.getElementById("<%=Lst_Company.ClientID %>");
		            for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=true;
		                }
                    document.getElementById("<%=Lst_Company.ClientId %>").disabled=true;
//                    document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled=true;
//                    document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled=false;


              }
              else
              {
        
                    document.getElementById("<%=Lst_Company.ClientId %>").disabled=false;
//                    document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled=false;
//                    document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled=true;
                    var ListViewObject=document.getElementById("<%=Lst_Company.ClientID %>");
		            for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=false;
		                }
               }
        }
        
        
       
        
        function chk_DepartmentSelectDeselectAll_Changed() 
        {
                var checkStatus=document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").checked;
                if (checkStatus)
                {
                         var ListViewObject=document.getElementById("<%=Lst_Department.ClientID %>");
		                 for(var j=0;j<ListViewObject.options.length;j++)
		                 {
		                      ListViewObject.options[j].selected=true;
		                 }
                        document.getElementById("<%=Lst_Department.ClientId %>").disabled=true;
//                        document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled=true;
//                        document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled=false;

                }
                else
                {
        
                        document.getElementById("<%=Lst_Department.ClientId %>").disabled=false;
//                        document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled=false;
//                        document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled=true;
                        var ListViewObject=document.getElementById("<%=Lst_Department.ClientID %>");
		                for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=false;
		                }
                }
        }
        

</script>

