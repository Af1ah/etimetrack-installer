<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeesShifts, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
		    document.getElementById("<%=hdn_EmployeeShiftId.ClientID %>").value = record.EmployeeShiftId;
	        if(confirm("Are you sure you want to delete? "))
	            return true;
	        else
	            return false;
	    }
	
	function OnDelete(record) 
	{
	    alert(record.Error);
	}
	
	function OnInsert(record) 
	{
		document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = record.Error;
	}
	
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
                    <td  style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;padding:5px; color: white;">
                        Employee Shifts
                    </td>
                    
                </tr>
                
                 <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                
                <tr>
                    <td colspan="2" >
                    <obout:Grid id="Dg_EmployeeShifts" runat="server" AllowFiltering="true" CallbackMode="true" EnableRecordHover="true" KeepSelectedRecords="true"  Serialize="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                 OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete" OnClientDelete="OnDelete"/>
			<TemplateSettings NewRecord_TemplateId="tplAddBtn" />
			
			
			<Columns>
				<obout:Column ID="Column0" DataField="EmployeeShiftId" Visible="false" Width="100" HeaderText="EmployeeShiftId" runat="server" />
				<obout:Column ID="Column1" Visible="true" DataField="FromDate" DataFormatString="{0:dd-MMM-yyyy}"  Width="90" HeaderText="From Date" runat="server"/>
                <obout:Column ID="Column2" Visible="true" DataField="ToDate" DataFormatString="{0:dd-MMM-yyyy}"    Width="90" HeaderText="To Date" runat="server"/> 
                <obout:Column ID="Column3" DataField="EmployeeCode" Visible="true" Width="95" HeaderText="Emp Code" runat="server" />
                <obout:Column ID="Column4" DataField="EmployeeName" Visible="true" Width="100" HeaderText="Emp Name" runat="server" />
                <obout:Column ID="Column5" DataField="ShiftSName" Visible="true" Width="87" HeaderText="Shift" runat="server" />
                <obout:Column ID="Column6" DataField="ShiftType" Visible="true" Width="95" HeaderText="Shift Type" runat="server" />
                <obout:Column ID="Column7" DataField="CompanySName" Visible="true" Width="105" HeaderText="Company" runat="server" />
                <obout:Column ID="Column8" DataField="DepartmentSName" Visible="true" Width="105" HeaderText="Department" runat="server" />
                <obout:Column ID="Column9" DataField="Designation" Visible="false" Width="100" HeaderText="Designation" runat="server" />
                <obout:Column ID="Column10" DataField="CategorySName" Visible="false" Width="80" HeaderText="Category" runat="server" />
                <obout:Column ID="Column11" DataField="EmployeesStatus" Visible="false" Width="75" HeaderText="Status" runat="server" />
                <obout:Column ID="Column12" DataField="EmployementType" Visible="false" Width="80" HeaderText="Emp Type" runat="server" />
                <obout:Column ID="Column13" DataField="ShiftId" Visible="false" Width="80" HeaderText="Emp Type" runat="server" />
                <obout:Column ID="Column14" DataField="EmployeeId" Visible="false" Width="80" HeaderText="Emp Type" runat="server" />
                <obout:Column ID="Column15" DataField="LastModifiedBy" HeaderText="Modified By" Visible="true" Width="98"  runat="server" />
                <obout:Column ID="Column16" Visible="false"  Width="90"  HeaderText="From Date" runat="server"> <TemplateSettings TemplateId="TP_FromDateFormat" /></obout:Column>
                <obout:Column ID="Column17" Visible="false" Width="90"   HeaderText="To Date" runat="server"> <TemplateSettings TemplateId="TP_ToDateFormat" /></obout:Column>
                <obout:Column  Width="70" AllowEdit="false" HeaderText="Edit" AllowDelete="false" Visible="true" ><TemplateSettings TemplateId="tplEditActualLeavesBtn" /></obout:Column>
                <obout:Column HeaderText="Delete" Width="70" AllowEdit="false" AllowDelete="true" Visible="true" />
			</Columns>					
			<Templates>
			<obout:GridTemplate runat="server" ID="TP_FromDateFormat">
			                    <Template>
			                        <%#ParseDateTime(Container.DataItem.Item("FromDate"))%>
			                    </Template>
			                </obout:GridTemplate>
			                
			                 <obout:GridTemplate runat="server" ID="TP_ToDateFormat">
			                    <Template>
			                        <%#ParseDateTime(Container.DataItem.Item("ToDate"))%>
			                    </Template>
			                </obout:GridTemplate>
			     <obout:GridTemplate runat="server" ID="tplEditActualLeavesBtn">
			        <Template>
			            <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')" class="ob_gAL"><%#CheckPermissionsEdit("Edit")%></a>
			        </Template>
			    </obout:GridTemplate>
			    
			     <obout:GridTemplate runat="server" ID="tplAddBtn">
			        <Template>
			            <asp:Hyperlink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissions("Assign Employees Shift")%>'  NavigateUrl='<%# "~/manage/AssignEmployeeShift.aspx"%>' ID="AA1" />
			        </Template>
			    </obout:GridTemplate>
			    
			    
			</Templates>
		</obout:Grid>
	
	</td>
                </tr>
            </table>	
            
            <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
		    <table class="rowEditTable">
                    <tr>
                        <td >
                            <fieldset>
                                <legend>Update Employee Shift</legend>
                                <table>
                                    <tr>
                                        <td>
                                            Employee Name</td>
                                        <td >
                                            <asp:TextBox ID="txt_EmployeeName" runat="server" Width="279px" Enabled="false"   ></asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td align="right">
                                            From Date&nbsp;</td>
                                        <td >
                                            <select ID="drp_FromDateday"  runat="server"  Width="46px">
                                            </select>&nbsp;&nbsp;<select ID="drp_FromDatemonth" runat="server" 
                                                EnableViewState="true" Width="48px">
                                            </select>&nbsp;&nbsp;<select ID="drp_FromDateYear" runat="server" 
                                                EnableViewState="true" Width="69px">
                                            </select>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td align="right">
                                            To Date&nbsp;</td>
                                        <td >
                                            <select ID="drp_ToDateday"  runat="server"  Width="46px">
                                            </select>&nbsp;&nbsp;<select ID="drp_ToDatemonth" runat="server" 
                                                EnableViewState="true" Width="48px">
                                            </select>&nbsp;&nbsp;<select ID="drp_ToDateYear" runat="server" 
                                                EnableViewState="true" Width="69px">
                                            </select>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            </td>
                                        <td >
                                            
                                            <asp:RadioButtonList ID="rbtn_ShiftOrShiftCalender" runat="server" RepeatDirection="Horizontal"> 
                                            <asp:ListItem Selected="True" onclick="LoadShiftOrShiftCalndar();">Shift</asp:ListItem>
                                            <asp:ListItem onclick="LoadShiftOrShiftCalndar();">Shift Calendar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td align="right">
                                    Shift&nbsp;
                                    </td>
                                    <td>
                                        <select id="drp_Shift" runat="server"> </select>
                                    </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" foreColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                            <input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;<input
                                id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                                <asp:HiddenField ID="hdn_EmployeeShiftId" runat="server" />
                                <asp:HiddenField ID="hdn_ShifttsIds" runat="server" />
                        <asp:HiddenField ID="hdn_Shiftts" runat="server" />
                        <asp:HiddenField ID="hdn_ShifttCalendarIds" runat="server" />
                        <asp:HiddenField ID="hdn_ShifttCalendar" runat="server" />
                        <asp:HiddenField ID="hdn_EmployeeId" runat="server" />
                        
                                    
                        </td>
                    </tr>
                </table>
			</obout:Flyout>
			
    </div>
    </form>
    
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddEmployeeShifts") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
          Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditEmployeeShifts") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function ParseDateTime(ByVal DateValue As Date) As String
            Return DateValue.ToString("yyyy-MM-dd")
        End Function
    </script>
    
    <script type="text/javascript">
            
		    function attachFlyoutToLink(oLink,Action)
		     {	
		     try 
		     {	
		        ClearFlyout();
		       <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
		       <%=Flyout1.getClientID()%>.Open();
		       populateEditControls(oLink.id.toString().replace("grid_link_", ""));
              }
            catch(ex){}
		    }
		    
		    function ClearFlyout()
		    {
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = '';
	            document.getElementById("<%=hdn_EmployeeId.ClientID %>").value = '0';
	            
		    }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout1.getClientID()%>.Close();
		    }
		    
		    function populateEditControls(iRecordIndex) 
		    {	
		        SetValueInDropDown(document.getElementById("<%=drp_FromDateday.ClientID %>"),document.getElementById("<%=drp_FromDatemonth.ClientID %>"),document.getElementById("<%=drp_FromDateYear.ClientID %>"),Dg_EmployeeShifts.Rows[iRecordIndex].Cells[16].Value)
		        SetValueInDropDown(document.getElementById("<%=drp_ToDateday.ClientID %>"),document.getElementById("<%=drp_ToDatemonth.ClientID %>"),document.getElementById("<%=drp_ToDateYear.ClientID %>"),Dg_EmployeeShifts.Rows[iRecordIndex].Cells[17].Value)
	            document.getElementById( "<%=txt_EmployeeName.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells[4].Value;
	            var ShiftType=Dg_EmployeeShifts.Rows[iRecordIndex].Cells[6].Value;
    	        
                if(ShiftType=='Shift')
                document.getElementById("Flyout1_rbtn_ShiftOrShiftCalender_0").checked=true;
                else
                document.getElementById("Flyout1_rbtn_ShiftOrShiftCalender_1").checked=true;
                LoadShiftOrShiftCalndar();
	            document.getElementById("<%=drp_Shift.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells[13].Value;
	            document.getElementById("<%=hdn_EmployeeShiftId.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells[0].Value;
	            document.getElementById("<%=hdn_EmployeeId.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells[14].Value;
	            
	            
	            
		    }
		    
		   
		    
		     function SetValueInDropDown(ddobject,mmobject,yyobject,value)
		    {
		        var Day=value.split('-')[2].replace(/^\s+|\s+$/g,"");
	            var Month=value.split('-')[1].replace(/^\s+|\s+$/g,"");
	            var Year=value.split('-')[0].replace(/^\s+|\s+$/g,"");
		        
                ddobject.value=Day;
                mmobject.value=Month;
                yyobject.value=Year;
		    }
		    
		   
		      
		     function btn_Save_onclick()
		     {
		        var oRecord = new Object();
                if(document.getElementById("Flyout1_rbtn_ShiftOrShiftCalender_0").checked)
                oRecord.ShiftType='Shift';
                else
		        oRecord.ShiftType='ShiftCalendar';
		        
		        oRecord.ShiftId=document.getElementById("<%=drp_Shift.ClientID %>").value;
		        oRecord.Error='';
		        Dg_EmployeeShifts.executeInsert(oRecord);
		        
		     }
		     
		     function LoadShiftOrShiftCalndar()
		    {
		        var ShiftIds=document.getElementById("<%=hdn_ShifttsIds.ClientID %>").value;
		        var Shift=document.getElementById("<%=hdn_Shiftts.ClientID %>").value;
		        var ShiftCalendarIds=document.getElementById("<%=hdn_ShifttCalendarIds.ClientID %>").value;
		        var ShiftCalendars=document.getElementById("<%=hdn_ShifttCalendar.ClientID %>").value;
		        
		       
                       if(document.getElementById("Flyout1_rbtn_ShiftOrShiftCalender_0").checked)
                       {
                        LoadShifts(ShiftIds,Shift)
                       }
                       else
                       {
                       LoadShiftCalendar(ShiftCalendarIds,ShiftCalendars)
                       }
		    }
		    
		    function LoadShifts(ShiftIds,Shifts)
		    {
		        document.getElementById("<%=drp_Shift.ClientID %>").options.length = 0;
		        var ShiftId=new Array();
		        ShiftId=ShiftIds.split(',');
		        var Shift=new Array();
		        Shift=Shifts.split(',');
		        for(var i=0;i<ShiftId.length;i++)
		        {
		            var Options=document.createElement("OPTION");
		            Options.text = Shift[i];
                    Options.value = ShiftId[i];
                    document.getElementById("<%=drp_Shift.ClientID %>").options.add(Options);
		        }
		    }
		    
		    function LoadShiftCalendar(ShiftCalendarIds,ShiftCalendars)
		    {
                document.getElementById("<%=drp_Shift.ClientID %>").options.length = 0;
		        var ShiftCalendarId=new Array();
		        ShiftCalendarId=ShiftCalendarIds.split(',');
		        var ShiftCalendar=new Array();
		        ShiftCalendar=ShiftCalendars.split(',');
		        for(var i=0;i<ShiftCalendarId.length;i++)
		        {
		            var Options=document.createElement("OPTION");
		            Options.text = ShiftCalendar[i];
                    Options.value = ShiftCalendarId[i];
                    document.getElementById("<%=drp_Shift.ClientID %>").options.add(Options);

		        }
		    }
		    
            
		
    </script>
    
</body>
</html>
