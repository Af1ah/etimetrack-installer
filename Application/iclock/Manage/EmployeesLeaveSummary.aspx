<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeesLeaveSummary, App_Web_kgq5n2bg" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <link display="all" href="../styles/grid/styles/premiere_blue/style.css" rel="stylesheet"
        type="text/css" />
    <link display="all" href="../styles/grid/styles/premiere_blue/interface/OboutTextBox/style.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px;">
                    <td style="font-weight: bold; font-size: 16px;color: white; height: 60px;">
                        Employees Leave Summary
                    </td>
                    <td style="height: 60px">
                    <table>
                    <tr>
                    <td>
                    Show:
                    </td>
                    <td>
                        &nbsp;<asp:RadioButtonList ID="rbtn_Leaves" runat="server" RepeatDirection="Horizontal" BorderStyle="Solid" BorderWidth="1px" BorderColor="#0c416f" AutoPostBack="True">
                        <asp:ListItem Selected="True">Leaves taken</asp:ListItem>
                        <asp:ListItem>Leaves Current Balance</asp:ListItem>
                        <asp:ListItem>Leaves Balance at Year begin</asp:ListItem>
                        </asp:RadioButtonList></td>
                    <td>
                    <asp:Button ID="btn_Export" runat="server" Text="Export" />
                    </td>
                    <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;Year&nbsp;<asp:DropDownList ID="drp_year" runat="server" AutoPostBack="True"></asp:DropDownList>
                        
                    </td>
                    </tr>
                    
                    </table>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <obout:Grid ID="Dg_LeaveSummary" runat="server" AllowFiltering="true" CallbackMode="true"
                            EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true"
                            FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false">
                            
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column DataField="EmployeeId" Visible="false" ReadOnly="true" HeaderText="EmployeeId " />
                                <obout:Column ID="Column2" DataField="EmployeeCode" Visible="true" Width="100"
                                    HeaderText="Emp Code" runat="server" />
                                <obout:Column ID="Column4" DataField="EmployeeName" Visible="true" Width="160" HeaderText="Emp Name"
                                    runat="server" />
                                <obout:Column ID="Column3" DataField="CompanySName" Visible="true" Width="160" HeaderText="Company"
                                    runat="server" />
                                <obout:Column ID="Column5" DataField="DepartmentSName" Visible="true" Width="160" HeaderText="Department"
                                    runat="server" />
                            </Columns>
                            <Templates>
                                <obout:GridTemplate runat="server" ID="tplEditBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                            class="ob_gAL">Edit</a>
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
            
            <obout:Flyout runat="server" ID="Flyout_UpdateLeaveStartYear" Align="left" Position="BOTTOM_left"
                CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Update Leave at start year</legend>
                                <table>
                                    <tr>
                                        <td   style="font-weight: bold;">
                                            Actual Leave
                                        </td>
                                        <td >
                                            <asp:TextBox ID="txt_ActualLeave" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" foreColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input
                                id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                            <asp:HiddenField ID="Hdn_EmployeeId" runat="server" />
                        </td>
                    </tr>
                </table>
            </obout:Flyout>
        </div>
    </form>
    <script type="text/javascript">
		   
		    function attachFlyoutToLink(oLink,Action)
		     {	
		       <%=Flyout_UpdateLeaveStartYear.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_UpdateLeaveStartYear.getClientID()%>.Open();
		        clearFlyout();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout_UpdateLeaveStartYear.getClientID()%>.Close();
		    }
		    

	  function populateEditControls(iRecordIndex) 
		   {	
		        document.getElementById("<%=txt_ActualLeave.ClientID%>").value = Dg_LeaveSummary.Rows[iRecordIndex].Cells[1].Value;
                document.getElementById("<%=Hdn_EmployeeId.ClientID %>").value = Dg_LeaveSummary.Rows[iRecordIndex].Cells[0].Value;  
		   }
		   
       function btn_Save_onclick()
         {
            var oRecord = new Object();
            oRecord.ActualLeave =document.getElementById("<%=txt_ActualLeave.ClientID %>").value;
            oRecord.Error='';
            Dg_LeaveSummary.executeInsert(oRecord);
         }
		    
        function clearFlyout() 
        {
            document.getElementById("<%=txt_ActualLeave.ClientID %>").value = '';
            document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
	    }
	    
	    function ExpoetToExcel()
	    {
		    grid1.exportToExcel(sFileName, true, true, bAppendTimeStamp, bOffice2007, bHiddenColumns, sColumnsForExport)
	    }
	    
    </script>
    
</body>
</html>
