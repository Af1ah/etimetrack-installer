<%@ page language="VB" autoeventwireup="false" inherits="Reports_GeneratePaySlip, App_Web_g2q1nt2r" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />

     <script type="text/javascript">
         function jsShowHideProgress() {
             setTimeout(function () { document.getElementById('imgloadinggif').style.display = 'block'; }, 200);
             deleteCookie();

             var timeInterval = 200; // milliseconds (checks the cookie for every half second )

             var loop = setInterval(function () {
                 if (IsCookieValid()) {
                     document.getElementById("<%=btn_GenerateReport.ClientID %>").disabled = false;
                     document.getElementById('imgloadinggif').style.display = 'none'; clearInterval(loop)
                 }

             }, timeInterval);
         }

         // cookies
         function deleteCookie() {
             var cook = getCookie('ExcelDownloadFlag');
             document.getElementById('ReportProtoType_lblStatus').innerHTML = '';
             document.getElementById("<%=btn_GenerateReport.ClientID %>").disabled = true;
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
<body onload="chk_FilterEmployee_CheckedChanged();chk_FilterCompany_CheckChanged(); chk_FilterDepartment_CheckChanged();">
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
     <owd:Window ID="ReportProtoType" runat="server" IsModal="true"  Height="370" Width="660"
            StyleFolder="~/Styles/mainwindow/blue" Title="Generate Pay Slip"  
             VisibleOnLoad="true" ShowCloseButton="true"  Left="80"  Top="45" ShowStatusBar="False"  >     
             
             <table width="100%" cellpadding="1" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
             
             <tr></tr>
             <tr></tr>
             
              <tr>
                  <td colspan="3" align="left">
                  &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Generate Pay Slip" style="font-weight:bold;font-size:12.5px;"></asp:Label>
                  </td>
                  <td colspan="3">
                  Select Month&nbsp;<asp:DropDownList ID="drp_Month" runat="server"></asp:DropDownList>&nbsp;Select Year&nbsp;<asp:DropDownList ID="drp_Year" runat="server"></asp:DropDownList>
                  </td>
              </tr>
              
              
             <tr>
              <td colspan="2">
                <fieldset>
                <legend>
                                <asp:CheckBox ID="chk_FilterEmployee"  Text="Filter Employee" runat="server" CssClass="WebControls" /></legend>
                            <table cellpadding="2">
                                <tr>
                                    <td >Employee Code</td>
                                        
                                    <td >
                                        <asp:TextBox ID="txt_EmployeeCode" runat="server" Width="85px" CssClass="WebControls"></asp:TextBox>
                                        &nbsp;<asp:CheckBox ID="chk_Exact" runat="server"  Text="Exact" CssClass="WebControls"/>
                                    </td>
                                </tr>
                                <tr></tr>
                                <tr>
                                <td >Employee Name</td>
                                <td >
                                        <asp:TextBox ID="txt_EmployeeName" runat="server" Width="120px" CssClass="WebControls"></asp:TextBox></td>
                                 </tr>
                                 <tr></tr>
                                 
                                 <tr>
                                 <td >Employee Category</td>
                                        
                                    <td >
                                        <asp:DropDownList ID="drp_EmployeeCategory" runat="server"  Width="125px" CssClass="WebControls"></asp:DropDownList>
                                        
                                    </td>
                                 </tr>
                                 <tr></tr>
                                 <tr>
                                 <td >Employee Designation</td>
                                        
                                    <td >
                                    <asp:DropDownList ID="drp_EmployeeDesignation" runat="server" Width="125px" CssClass="WebControls">
                                    </asp:DropDownList>
                                    
                                    </td>
                                 </tr>
                                 <tr></tr>
                                 
                                 <tr>
                                     <td >Employee Location</td>
                                     <td >  <asp:DropDownList ID="drp_EmployeeLocation" runat="server" Width="125px" CssClass="WebControls">
                                    </asp:DropDownList></td>
                                     
                                    
                                 </tr>
                                 <tr></tr>
                                 <tr>
                                 <td >Employee Type</td>
                                        
                                    <td >
                                     <asp:DropDownList ID="drp_EmployeeType" runat="server" Width="125px" CssClass="WebControls">
                                    </asp:DropDownList>
                                  
                                       
                                    </td>
                                     </tr>
                                    
                                 </table>
                </fieldset>   
                  
               </td>
               <td colspan="2"  align="right"> 
                               <fieldset style="border:none">
                            <legend></legend>
                            <table cellpadding="2">
                                <tr>
                                <td align="left"><asp:CheckBox ID="chk_FilterCompany" runat="server" Text="Filter Company" CssClass="WebControls"/> </td>
                                </tr>
                                <tr></tr>
                                <tr>
                                <td>
                                    <asp:ListBox ID="Lst_FilterCompany" runat="server" CssClass="WebControls" Height="157px" Width="130px" BorderStyle="Solid" BorderWidth="1px" SelectionMode="Multiple"></asp:ListBox>
                                </td>
                                </tr>
                 
                     <tr><td>
                     <asp:RadioButton ID="rdo_SelectAllCompany" Checked="true" Text="Select All" onClick="javascript:chk_CompanySelectDeselectAll_Changed();"
                                                GroupName="a" runat="server" />&nbsp;&nbsp;
                                            <asp:RadioButton ID="rdo_DeselectAllCompany" Text="Deselect All" GroupName="a" runat="server"
                                                onClick="javascript:chk_CompanySelectDeselectAll_Changed();" />
                      </td>  
                      </tr>
                      </table>
                      </fieldset>
                      </td> 
                                
               <td colspan="2" align="right"> 
                                <fieldset style="border:none">
                            <legend></legend>
                            <table cellpadding="2">
                                <tr>
                                <td align="left"><asp:CheckBox ID="chk_FilterDepartment" runat="server" CssClass="WebControls" Text="Filter Department"/> </td>
                                </tr>
                                <tr></tr>
                                <tr>
                                <td>
                                    <asp:ListBox ID="Lst_FilterDepartment" runat="server" CssClass="WebControls" Height="157px" Width="130px" BorderStyle="Solid" BorderWidth="1px" SelectionMode="Multiple"></asp:ListBox>
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rdo_SelectAllDepartment" Checked="true" Text="Select All" onClick="javascript:chk_DepartmentSelectDeselectAll_Changed();"
                                            GroupName="b" runat="server" />&nbsp;&nbsp;
                                        <asp:RadioButton ID="rdo_DeselectAllDepartment" Text="Deselect All" GroupName="b"
                                            runat="server" onClick="javascript:chk_DepartmentSelectDeselectAll_Changed();" />
                                       
                                    </td>
                                </tr>
                            </table>
                                </fieldset>
               </td>
               
               </tr>   
               <tr></tr>
                       <tr></tr>
                       <tr></tr>
                       
                       <tr   id="trReportFormat" runat=server>
                       <td colspan="6">
                       <fieldset>
                       <legend>
                           <asp:Label ID="Label1" runat="server" Text="Export File Format"   CssClass="WebControls"></asp:Label></legend>
                       <table>
                       <tr>
                       <td>Export File Format&nbsp;&nbsp;</td>
                       <td><asp:RadioButtonList ID="rbtn_FileFormat" RepeatDirection="Horizontal" runat="server"><asp:ListItem>Excel</asp:ListItem><asp:ListItem Selected="True">PDF</asp:ListItem></asp:RadioButtonList></td>
                       </tr>
                       </table>
                         </fieldset>  
                       </td>
                       </tr>
                 <tr>
                     <td colspan="2">
                     </td>
                     <td>
                         <img style="display: none" id="imgloadinggif" src="../Images/loading.gif" alt="loading.." />
                     </td>
                     <td colspan="2" align="right">
                         <asp:Button ID="btn_GenerateReport" runat="server" CssClass="WebControls" Text="Generate"
                              OnClientClick="jsShowHideProgress();" UseSubmitBehavior="false" />&nbsp;<input
                                 type="button" style="font-size: 11px; font-family: Verdana; height: 20px;" value="Close"
                                 id="btn_Close" onclick="ReportProtoType.Close();" />
                     </td>
                 </tr>
                 <tr>
                     <td colspan="6">
                         <hr />
                         <asp:Label ID="lblStatus" runat="server" CssClass="WebControls" ForeColor="Red" Height="20px"></asp:Label>
                     </td>
       </tr> 
 </table>
     </owd:Window>         
            
     <asp:LinkButton Visible="false" ID="Lnk_SelectAllDepartment" runat="server" Text="Select All" CssClass="WebControls"
                                            OnClientClick="return SelectAll(this);"></asp:LinkButton>
                                        &nbsp;&nbsp;
                                        <asp:LinkButton Visible="false" ID="Lnk_DeSelectAllDepartment" runat="server" Text="Deselect All"
                                            CssClass="WebControls" OnClientClick="return DeSelectAll(this);"></asp:LinkButton>
                                                                 <asp:LinkButton Visible="false"  ID="Lnk_SelectAllCompany" runat="server"  Text="Select All"  CssClass="WebControls"  OnClientClick="return SelectAll(this);" ></asp:LinkButton> &nbsp;&nbsp;
                     <asp:LinkButton Visible="false" ID="Lnk_DeSelectAllCompany" runat="server" Text="Deselect All" CssClass="WebControls" OnClientClick="return DeSelectAll(this);"></asp:LinkButton>

        &nbsp;</div>
        
       
    </form>
</body>
</html>

<script type="text/javascript">

        // SET DESIGNATION AND EMPLOYEETYPE COMBOBOX SET POSITION
        
		 document.getElementById("ob_drp_EmployeeDesignationContainer").style.zIndex="99999";
		   document.getElementById("ob_drp_EmployeeTypeContainer").style.zIndex="99999";
		   
		   
		   //  FILTER EMPLOYEE CHECK CHANGED
		   
    	   function chk_FilterEmployee_CheckedChanged()   
		   {
		   
		   var CheckStatus=document.getElementById("<%=chk_FilterEmployee.ClientID %>").checked;
		   
		   if (CheckStatus)
		   {
		    document.getElementById("<%=txt_EmployeeCode.ClientID %>").disabled=false;
		    document.getElementById("<%=txt_EmployeeName.ClientID %>").disabled=false;
		    document.getElementById("<%=chk_Exact.ClientID %>").disabled=false;
		    document.getElementById("<%=drp_EmployeeCategory.ClientID %>").disabled=false;
		    document.getElementById("<%=drp_EmployeeDesignation.ClientID %>").disabled=false;
		    document.getElementById("<%=drp_EmployeeType.ClientID %>").disabled=false;
		     document.getElementById("<%=drp_EmployeeLocation.ClientID %>").disabled=false;
		   }
		   
		   else
		   {
		    document.getElementById("<%=txt_EmployeeCode.ClientID %>").disabled=true;
		    document.getElementById("<%=txt_EmployeeName.ClientID %>").disabled=true;
		     document.getElementById("<%=chk_Exact.ClientID %>").disabled=true;
		    document.getElementById("<%=drp_EmployeeCategory.ClientID %>").disabled=true;
		    document.getElementById("<%=drp_EmployeeDesignation.ClientID %>").disabled=true;
		      document.getElementById("<%=drp_EmployeeType.ClientID %>").disabled=true;
		       document.getElementById("<%=drp_EmployeeLocation.ClientID %>").disabled=true;
		   }
        }
        
        
        //  FILTER  COMPANY  CHECK CHANGED
         
         
        function chk_FilterCompany_CheckChanged() 
        
        {
        var checkStatus=document.getElementById("<%=chk_FilterCompany.ClientId %>").checked;
        var ListViewObject=document.getElementById("<%=Lst_FilterCompany.ClientID %>");
		            for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=true;
		                }
        if (checkStatus)
        {
        document.getElementById("<%=Lst_FilterCompany.ClientId %>").disabled=true;
//        document.getElementById("<%=Lnk_SelectAllCompany.ClientId %>").disabled=false;
//        document.getElementById("<%=Lnk_DeSelectAllCompany.ClientId %>").disabled=false;
        document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled=false;
        document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").checked=true;
        document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled=false;
        }
        else
        {
         document.getElementById("<%=Lst_FilterCompany.ClientId %>").disabled=true;
//        document.getElementById("<%=Lnk_SelectAllCompany.ClientId %>").disabled=true;
//        document.getElementById("<%=Lnk_DeSelectAllCompany.ClientId %>").disabled=true;
        document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled=true;
         document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").checked=true;
        document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled=true;

        }
        }
        
        //  FILTER  DEPARTMENT  CHECK CHANGED
        
        function chk_FilterDepartment_CheckChanged()
        {
        var checkStatus=document.getElementById("<%=chk_FilterDepartment.ClientId %>").checked;
         var ListViewObject=document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
		            for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=true;
		                }
        
        if (checkStatus)
        {
        document.getElementById("<%=Lst_FilterDepartment.ClientId %>").disabled=true;
//        document.getElementById("<%=Lnk_SelectAllDepartment.ClientId %>").disabled=false;
//        document.getElementById("<%=Lnk_DeSelectAllDepartment.ClientId %>").disabled=false;
        document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled=false;
         document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").checked=true;
        document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled=false;
        }
        else
        {
         document.getElementById("<%=Lst_FilterDepartment.ClientId %>").disabled=true;
//        document.getElementById("<%=Lnk_SelectAllDepartment.ClientId %>").disabled=true;
//        document.getElementById("<%=Lnk_DeSelectAllDepartment.ClientId %>").disabled=true;
        document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled=true;
         document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").checked=true;
        document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled=true;

        }
        }
        
        
        
        // SELECT ALL
        
         function SelectAll(Sender)
        {
     
         var FieldName=Sender.getAttribute("id");
       
	             if (FieldName=='ReportProtoType_Lnk_SelectAllCompany')
	            {
	            var ListViewObject=document.getElementById("<%=Lst_FilterCompany.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=true;
		                }
		                return false;
	            }
	            
	             else if (FieldName=='ReportProtoType_Lnk_SelectAllDepartment')
	            {
	            var ListViewObject=document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=true;
		                }
		                return false;
	            }
	            }
	            
	            // DESELECT ALL
	            
        function DeSelectAll(Sender)
        {
   
         var FieldName=Sender.getAttribute("id");
       
	             if (FieldName=='ReportProtoType_Lnk_DeSelectAllCompany')
	            {
	            var ListViewObject=document.getElementById("<%=Lst_FilterCompany.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=false;
		                }
		                return false;
	            }
	            
	             else if (FieldName=='ReportProtoType_Lnk_DeSelectAllDepartment')
	            {
	            var ListViewObject=document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=false;
		                }
		                return false;
	            }
	            }
	            
	            
	             function chk_CompanySelectDeselectAll_Changed() 
        {
              var checkStatus=document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").checked;
              if (checkStatus)
              {
              
                    var ListViewObject=document.getElementById("<%=Lst_FilterCompany.ClientID %>");
		            for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=true;
		                }
                    document.getElementById("<%=Lst_FilterCompany.ClientId %>").disabled=true;
//                    document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled=true;
//                    document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled=false;


              }
              else
              {
        
                    document.getElementById("<%=Lst_FilterCompany.ClientId %>").disabled=false;
//                    document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled=false;
//                    document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled=true;
                    var ListViewObject=document.getElementById("<%=Lst_FilterCompany.ClientID %>");
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
                         var ListViewObject=document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
		                 for(var j=0;j<ListViewObject.options.length;j++)
		                 {
		                      ListViewObject.options[j].selected=true;
		                 }
                        document.getElementById("<%=Lst_FilterDepartment.ClientId %>").disabled=true;
//                        document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled=true;
//                        document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled=false;

                }
                else
                {
        
                        document.getElementById("<%=Lst_FilterDepartment.ClientId %>").disabled=false;
//                        document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled=false;
//                        document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled=true;
                        var ListViewObject=document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
		                for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=false;
		                }
                }
        }
        
        </script>
