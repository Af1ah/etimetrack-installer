<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeeLeaves, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">	
	// Client-Side Events for Delete
	
	
	function OnInsert(record) 
	{
		document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = record.Error;
	}
	
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <uctrl:header ID="MyHeader" runat="server" />
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td style="font-weight: bold;">
                        Employee Leaves&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="lbl_EmpName" style="font-family:Verdana; font-size: 13px; color: #0c416f; font-weight:normal;"></asp:Label>
                    </td>
                    <td align="right">
                    Year&nbsp;&nbsp;<asp:DropDownList ID="drp_Year" runat="server" AutoPostBack="true">
                    </asp:DropDownList>&nbsp;&nbsp;
                    </td>
                </tr>
                
                <tr style="padding-right: 5px; padding-left: 1px; padding-bottom: 1px; padding-top: 1px; background-color: lightsteelblue;">
                    <td colspan="2" >
                    <hr />
    <obout:Grid id="Dg_EmployeeLeaves" runat="server" CallbackMode="true" EnableRecordHover="true" KeepSelectedRecords="true"  Serialize="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                 OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  AllowFiltering="true" >
                 <ClientSideEvents OnClientInsert="OnInsert"/>
			<TemplateSettings NewRecord_TemplateId="tplAddBtn" />
			
			<Columns>
				<obout:Column ID="Column0" DataField="LeaveTypeId" Visible="false" Width="300" HeaderText="LeaveTypeId" runat="server" />
				<obout:Column ID="Column1" DataField="LeaveTypeSName" SortOrder="Asc" Visible="true" Width="120" HeaderText="LeaveType" runat="server" />
                <obout:Column ID="Column2" DataField="Year" Visible="true" Width="80" HeaderText="Year" runat="server" />
                <obout:Column ID="Column3" DataField="YearlyLimit" Visible="true" Width="170" HeaderText="Allowed Leaves(Std.)" runat="server" />
                <obout:Column ID="Column4" DataField="ActualLeaves" Visible="true" Width="180" HeaderText="Allowed Leaves(Actual)" runat="server" />
                <obout:Column ID="Column5" DataField="LeaveTaken" Visible="true" Width="120" HeaderText="Leave Taken" runat="server" />
                <obout:Column  Width="135" AllowEdit="false" AllowDelete="false" Visible="true" ><TemplateSettings TemplateId="tplEditActualLeavesBtn" /></obout:Column>
			</Columns>					
			<Templates>
			
			     <obout:GridTemplate runat="server" ID="tplEditActualLeavesBtn">
			        <Template>
			            <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')" class="ob_gAL">Edit Actual Leaves</a>
			        </Template>
			    </obout:GridTemplate>
			    
			</Templates>
		</obout:Grid>
	
	</td>
                </tr>
                
                <tr>
                
                                <td colspan="2" style=" background-color: lightsteelblue;padding-bottom: 5px;">
                    <hr />
                                
                                &nbsp;&nbsp;<a  style="font-family:Verdana; font-size: 13px; color: #0c416f;" href="Employees.aspx">« Go to Employees</a>
                                </td>
                                </tr>
                                
            </table>	
            
            <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
		    <table class="rowEditTable">
                    <tr>
                        <td >
                            <fieldset>
                                <legend>Update Employee Leave Details</legend>
                                <table>
                                    <tr>
                                        <td>
                                            Actual Leave</td>
                                        <td >
                                            <asp:TextBox ID="txt_actualleave" runat="server" Width="279px"   ></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" foreColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;<input
                                id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" /><asp:HiddenField ID="hdn_LeaveTypeId" runat="server" />
                                    
                        </td>
                    </tr>
                </table>
			</obout:Flyout>
			
    </div>
    </form>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("Edit Shift Calendars") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
    </script>
    <script type="text/javascript">
           
            
		    function attachFlyoutToLink(oLink,Action)
		     {	
		     try 
		     {	
		       <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
		       <%=Flyout1.getClientID()%>.Open();
		       clearFlyout();
		       if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
            catch(ex){}
		    }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout1.getClientID()%>.Close();
		    }
		    
		    function populateEditControls(iRecordIndex) 
		    {	
		        document.getElementById("<%=txt_actualleave.ClientID %>").value = Dg_EmployeeLeaves.Rows[iRecordIndex].Cells[4].Value;
	            document.getElementById("<%=hdn_LeaveTypeId.ClientID %>").value = Dg_EmployeeLeaves.Rows[iRecordIndex].Cells[0].Value;
		    }
		   
		      
		     function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.actualleave =document.getElementById("<%=txt_actualleave.ClientID %>").value ;
		        oRecord.Error='';
		        Dg_EmployeeLeaves.executeInsert(oRecord);
		     }
		    
            function clearFlyout() 
            {
                document.getElementById("<%=txt_actualleave.ClientID %>").value = '';
	            document.getElementById("<%=hdn_LeaveTypeId.ClientID %>").value = '0';
                document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		    }
		
    </script>
</body>
</html>
