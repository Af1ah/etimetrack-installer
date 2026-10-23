<%@ page language="VB" autoeventwireup="false" inherits="Reports_Recalculate, App_Web_z1ac55br" enableeventvalidation="false" %>

<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body onload="chk_CompanySelectDeselectAll_Changed();chk_DepartmentSelectDeselectAll_Changed();">
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
        <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="ReportProtoType" runat="server" IsModal="true" Height="320" Width="518"
            StyleFolder="~/Styles/mainwindow/blue" Title="Calculate Attendance" VisibleOnLoad="true"
            ShowCloseButton="true" Left="80" Top="45" ShowStatusBar="False">
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                </tr>
                <tr>
                    <td>
                        &nbsp;From Date&nbsp;&nbsp;
                    </td>
                    <td style="width: 173px">
                        <asp:DropDownList ID="Drp_FromDateDD" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_FromDateMM" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_FromDateYYYY" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;To Date&nbsp;&nbsp;
                    </td>
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
                        &nbsp;Select Companies&nbsp;&nbsp;
                    </td>
                    <td colspan="2" align="left">
                        &nbsp;Select Departments&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Panel ID="pnlCompany" runat="server">
                            <asp:ListBox ID="Lst_Company" runat="server" Height="135px" Width="145px" CssClass="WebControls"
                                BorderStyle="Solid" BorderWidth="1px" SelectionMode="Multiple"></asp:ListBox>
                        </asp:Panel>
                    </td>
                    <td colspan="2" align="left">
                        <asp:ListBox ID="Lst_Department" runat="server" Height="135px" Width="145px" CssClass="WebControls"
                            BorderStyle="Solid" BorderWidth="1px" SelectionMode="Multiple"></asp:ListBox>
                    </td>
                </tr>
                <tr>
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
                    <td colspan="4" align="right">
                        <asp:Timer ID="ProcessTimer" Enabled="false" Interval="100" runat="server">
                        </asp:Timer>
                        <asp:Button ID="btn_Calculate" runat="server" CssClass="WebControls" Text="Calculate"
                            OnClientClick="javascript:document.getElementById('ReportProtoType_lblStatus').innerHTML='';" />&nbsp;&nbsp;<input
                                id="Button1" type="button" value="Close" onclick="ReportProtoType.Close();" class="WebControls" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <hr />
                        <input id="btnDisplayError" runat="server" type="button" style="font-size: 12px;
                            color: Red; display: none; border: 0px; background-color: #EEEEEE; text-decoration: underline;"
                            value="Display Error" onclick="return attachFlyoutToLink(this);" />
                        <%-- <asp:LinkButton ID="lnk_DisplayError" runat="server" Enabled="False" OnClientClick="return attachFlyoutToLink(this);"></asp:LinkButton>--%>
                        <asp:Label ID="lblStatus" runat="server" CssClass="WebControls" ForeColor="Red" Height="20px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                    </td>
                </tr>
            </table>
        </owd:Window>
        <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_right" CloseEvent="NONE"
            OpenEvent="NONE" DelayTime="500" AttachTo="btnDisplayError" zIndex="100000">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <asp:TextBox runat="server" ReadOnly="true" BorderStyle="None" Wrap="true" Width="400px"
                            CssClass="WebControls" BackColor="#EEEEEE" Height="150px" TextMode="MultiLine"
                            BorderWidth="0" ID="lbl_DisplayError"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input id="Button2" type="button" value="Close" class="WebControls" onclick="javascript:closeFlyout();" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
        <asp:LinkButton ID="Lnk_SelectAllCompany" Visible="false" runat="server" OnClientClick="return SelectAllComany();">Select All</asp:LinkButton>
        <asp:LinkButton ID="Lnk_DeSelectAllCompany" Visible="false" runat="server" OnClientClick="return DeSelectAllComany();">DeSelect All</asp:LinkButton>
        <asp:LinkButton ID="Lnk_SelectAllDepartment" Visible="false" runat="server" OnClientClick="return SelectAllDepartment();">Select All</asp:LinkButton>
        <asp:LinkButton ID="Lnk_DeSelectAllDepartment" Visible="false" runat="server" OnClientClick="return DeSelectAllDepartment();">DeSelect All</asp:LinkButton>
        <asp:HiddenField ID="hdn_AllCompany" runat="server" />
        <asp:HiddenField ID="hdn_AllDepartment" runat="server" />
        <asp:HiddenField ID="hdn_SelectedCompany" runat="server" />
        <asp:HiddenField ID="hdn_SelectedDepartment" runat="server" />
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    </form>
</body>
</html>
<script type="text/javascript">
    function GetCompanyValues() {
        var values = "";
        var listBox = document.getElementById("<%= Lst_Company.ClientID%>");
        for (var i = listBox.options.length - 1; i >= 0; i--) {
            if (listBox.options[i].selected) {
                values += listBox.options[i].value + ",";
            }
        }
        document.getElementById("<%=hdn_SelectedCompany.ClientId %>").value = values
        return false;
    }
</script>

<script type="text/javascript">

function attachFlyoutToLink(oLink)
		        {	
		            if(oLink.disabled==false)
		            {
	                    <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	                    <%=Flyout1.getClientID()%>.Open();
	                }
	                return false;
		        }
		    
		     function closeFlyout() 
		        {
		            <%=Flyout1.getClientID()%>.Close();
		        }

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
        
        
        
//        function SelectAll(Sender)
//        {
//     alert('in function');
//         var FieldName=Sender.getAttribute("id");
//         alert(FieldName);
//        
//             if (FieldName=='ReportProtoType_Lnk_SelectAllCompany')
//	            {
//	            var ListViewObject=document.getElementById("<%=Lst_Company.ClientID %>");
//		         for(var j=0;j<ListViewObject.options.length;j++)
//		                {
//		                        ListViewObject.options[j].selected=true;
//		                }
//		                return false;
//	            }
//	            
//	             else if (FieldName=='ReportProtoType_Lnk_SelectAllDepartment')
//	            {
//	            var ListViewObject=document.getElementById("<%=Lst_Department.ClientID %>");
//		         for(var j=0;j<ListViewObject.options.length;j++)
//		                {
//		                        ListViewObject.options[j].selected=true;
//		                }
//		                return false;
//	            }
//	            
//        }
	            
        

        
        // DESELECT ALL
        
//        function DeSelectAll(Sender)
//        {
//     
//         var FieldName=Sender.getAttribute("id");
//       
//	         
//	            
//	             if (FieldName=='ReportProtoType_Lnk_DeSelectAllCompany')
//	            {
//	            var ListViewObject=document.getElementById("<%=Lst_Company.ClientID %>");
//		         for(var j=0;j<ListViewObject.options.length;j++)
//		                {
//		                        ListViewObject.options[j].selected=false;
//		                }
//		                return false;
//	            }
//	            
//	             else if (FieldName=='ReportProtoType_Lnk_DeSelectAllDepartment')
//	            {
//	            var ListViewObject=document.getElementById("<%=Lst_Department.ClientID %>");
//		         for(var j=0;j<ListViewObject.options.length;j++)
//		                {
//		                        ListViewObject.options[j].selected=false;
//		                }
//		                return false;
//	            }
//	            
//        }


</script>
