<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeesLeaveEntries, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        record.Error = '';
        document.getElementById("<%=hdn_EmployeeLeaveEntryId.ClientID %>").value = record.LeaveEntryId;
        if (confirm("Are you sure you want to delete? "))
            return true;
        else
            return false;
    }

    function OnDelete(record) {
        alert(record.Error);
    }

    function OnInsert(record) {
        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = record.Error;
    }
	
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body onload="IsApproved_CheckedChange();IsApprovedBulk_CheckedChange();">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style=" background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; ">
                <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Employee Leave Entries
                </td>
                <td align="right"  style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">
                    Approval Status&nbsp;
                    <asp:DropDownList ID="drp_ApprovedStatus" runat="server">
                        <asp:ListItem Selected="True">All</asp:ListItem>
                        <asp:ListItem>Approved</asp:ListItem>
                        <asp:ListItem>Not Approved</asp:ListItem>
                    </asp:DropDownList>
                     <asp:Button ID="btnUpdate"  runat="server" Text="Refresh" OnClientClick="SetSource(this.id)"/>
                          <asp:HiddenField ID="hidSourceID" runat="server" />

                         <script type="text/javascript">
                             function SetSource(SourceID) {
                                 var hidSourceID = document.getElementById("<%=hidSourceID.ClientID%>");
                                 hidSourceID.value = SourceID;
                             }
                  </script>
                </td>
            </tr>
            <tr style="background-color: lightsteelblue;">
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="div_Employees">
                        <obout:Grid ID="Dg_EmployeeLeaveEntries" runat="server" CallbackMode="true" EnableRecordHover="true"
                            AllowFiltering="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                            FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                            OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column ID="Column0" DataField="LeaveEntryId" Visible="False" Width="100" HeaderText="LeaveEntryId"
                                    ConvertEmptyStringToNull="False" Index="0" />
                                <obout:Column ID="Column1" DataField="FromDate" DataFormatString="{0:dd-MMM-yyyy}"
                                    Width="90" HeaderText="From Date" ConvertEmptyStringToNull="False" DataFormatString_GroupHeader="{0:dd-MMM-yyyy}"
                                    Index="1" />
                                <obout:Column ID="Column2" DataField="ToDate" DataFormatString="{0:dd-MMM-yyyy}"
                                    Width="90" HeaderText="To Date" ConvertEmptyStringToNull="False" DataFormatString_GroupHeader="{0:dd-MMM-yyyy}"
                                    Index="2" />
                                <obout:Column ID="Column3" DataField="EmployeeCode" Width="90" HeaderText="Emp Code"
                                    ConvertEmptyStringToNull="False" Index="3" />
                                <obout:Column ID="Column4" DataField="EmployeeName" Width="100" HeaderText="Emp Name"
                                    ConvertEmptyStringToNull="False" Index="4" />
                                <obout:Column ID="Column5" DataField="LeaveTypeSName" Width="70" HeaderText="Type"
                                    ConvertEmptyStringToNull="False" Index="5" />
                                <obout:Column ID="Column6" DataField="LeaveStatus" Width="105" HeaderText="Leave Status"
                                    ConvertEmptyStringToNull="False" Index="6" />
                                <obout:Column ID="Column7" DataField="CompanySName" Width="105" HeaderText="Company"
                                    ConvertEmptyStringToNull="False" Index="7" />
                                <obout:Column ID="Column8" DataField="DepartmentSName" Width="100" HeaderText="Department"
                                    ConvertEmptyStringToNull="False" Index="8" />
                                <obout:Column ID="Column9" DataField="Designation" Visible="False" Width="110" HeaderText="Designation"
                                    ConvertEmptyStringToNull="False" Index="9" />
                                <obout:Column ID="Column10" DataField="CategorySName" Width="90" HeaderText="Category"
                                    ConvertEmptyStringToNull="False" Index="10" />
                                <obout:Column ID="Column11" DataField="EmployeesStatus" Visible="False" Width="80"
                                    HeaderText="Status" ConvertEmptyStringToNull="False" Index="11" />
                                <obout:Column ID="Column12" DataField="EmployementType" Visible="False" Width="80"
                                    HeaderText="Emp Type" ConvertEmptyStringToNull="False" Index="12" />
                                <obout:Column ID="Column13" DataField="IsApproved" Visible="False" Width="80" HeaderText="IsApproved"
                                    ConvertEmptyStringToNull="False" Index="13" />
                                <obout:Column ID="Column14" DataField="ApprovedBy" Visible="False" Width="80" HeaderText="ApprovedBy"
                                    ConvertEmptyStringToNull="False" Index="14" />
                                <obout:Column ID="Column15" DataField="Remarks" Visible="False" Width="80" HeaderText="Remarks"
                                    ConvertEmptyStringToNull="False" Index="15" />
                                <obout:Column ID="Column16" DataField="LeaveTypeId" Visible="False" Width="80" HeaderText="LeaveTypeId"
                                    ConvertEmptyStringToNull="False" Index="16" />
                                <obout:Column ID="Column17" DataField="EmployeeId" Visible="False" Width="80" HeaderText="Emp Type"
                                    ConvertEmptyStringToNull="False" Index="17" />
                                <obout:Column ID="Column18" Width="125" SortOrder="Desc" HeaderText="Approval Status"
                                    ConvertEmptyStringToNull="False" Index="18" TemplateId="tplApprovalStatus">
                                    <TemplateSettings TemplateId="tplApprovalStatus" />
                                </obout:Column>
                                <obout:Column ID="Column19" DataField="LastModifiedBy" HeaderText="Modified By" Width="98"
                                    ConvertEmptyStringToNull="False" Index="19" />
                                <obout:Column ID="Column20" Visible="False" Width="90" HeaderText="From Date" ConvertEmptyStringToNull="False"
                                    Index="20" TemplateId="TP_FromDateFormat">
                                    <TemplateSettings TemplateId="TP_FromDateFormat" />
                                </obout:Column>
                                <obout:Column ID="Column21" Visible="False" Width="90" HeaderText="To Date" ConvertEmptyStringToNull="False"
                                    Index="21" TemplateId="TP_ToDateFormat">
                                    <TemplateSettings TemplateId="TP_ToDateFormat" />
                                </obout:Column>
                                <obout:Column ID="Column22" DataField="CreatedDate" DataFormatString="{0:dd-MMM-yyyy HH:mm:ss}"
                                    Width="90" Visible="false" HeaderText="Created Date" ConvertEmptyStringToNull="False"
                                    DataFormatString_GroupHeader="{0:dd-MMM-yyyy HH:mm:ss}" Index="22" />
                                <obout:Column ID="Column23" DataField="LastModifiedDate" DataFormatString="{0:dd-MMM-yyyy HH:mm:ss}"
                                    Width="90" Visible="false" HeaderText="Modified Date" ConvertEmptyStringToNull="False"
                                    DataFormatString_GroupHeader="{0:dd-MMM-yyyy HH:mm:ss}" Index="23" />
                                <obout:Column ConvertEmptyStringToNull="False" Width="70" HeaderText="Edit" Index="24"
                                    AllowEdit="true" AllowDelete="true">
                                    <TemplateSettings TemplateId="tplEditeLeaveEntriesBtn" />
                                </obout:Column>
                                <obout:Column Width="90" HeaderText="Delete" AllowDelete="True" ConvertEmptyStringToNull="False"
                                    Index="25">
                                </obout:Column>
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
                                <obout:GridTemplate runat="server" ID="tplEditeLeaveEntriesBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                            class="ob_gAL">
                                            <%#CheckPermissionsEdit("Edit")%>
                                        </a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplAddBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissions("Assign Leave Entries")%>'
                                            NavigateUrl='<%# "~/manage/AssignEmployeesLeaveEntries.aspx"%>' ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplApprovalStatus">
                                    <Template>
                                        <%#ParseApprovalStatus(Container.DataItem.Item("IsApproved"), Container.DataItem.Item("ApprovedBy"))%>
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </div>
                </td>
            </tr>
        </table>
        <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE"
            OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Update Employee Leave Entries</legend>
                            <table>
                                <tr>
                                    <td style="width: 528px">
                                        Employee Name&nbsp;
                                        <asp:TextBox ID="txt_EmployeeName" runat="server" Width="422px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:RadioButtonList ID="rbtn_LeaveDays" runat="server" RepeatDirection="Horizontal"
                                                        Enabled="false">
                                                        <asp:ListItem Value="FullDay" Selected="True" onclick="AssignLeaveDays_onClick();">Full Day</asp:ListItem>
                                                        <asp:ListItem Value="3/4Day" onclick="AssignLeaveDays_onClick();">3/4 Day</asp:ListItem>
                                                        <asp:ListItem Value="HalfDay" onclick="AssignLeaveDays_onClick();">1/2 Day</asp:ListItem>
                                                        <asp:ListItem Value="QuarterDay" onclick="AssignLeaveDays_onClick();">1/4 Day</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="chk_IsApproved" runat="server" Text="Is Approved" onclick="IsApproved_CheckedChange();" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 528px">
                                        From Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <select id="drp_FromDateday" runat="server" style="width: 46px;">
                                        </select>
                                        &nbsp;&nbsp;<select id="drp_FromDatemonth" runat="server" style="width: 48px;"></select>
                                        &nbsp;&nbsp;<select id="drp_FromDateYear" runat="server" style="width: 69px;">
                                        </select>&nbsp;Approved By&nbsp;<asp:TextBox ID="txt_ApprovedBy" runat="server" Width="150px"
                                            Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 528px">
                                        To Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <select id="drp_ToDateday" runat="server">
                                        </select>
                                        &nbsp;&nbsp;<select id="drp_ToDatemonth" runat="server"></select>
                                        &nbsp;&nbsp;<select id="drp_ToDateYear" runat="server">
                                        </select>&nbsp;Leave Type&nbsp;&nbsp;&nbsp;<select id="drp_LeaveType" runat="server"
                                            style="width: 155px">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 528px">
                                        Remarks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox
                                            ID="txt_Remarks" runat="server" TextMode="MultiLine" Width="421px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 528px">
                                        Created Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txt_CreatedDate" ReadOnly="true" Width="145px" runat="server"></asp:TextBox>
                                        &nbsp;Last Modified Date&nbsp;
                                        <asp:TextBox ID="txt_ModifiedDate" ReadOnly="true" Width="145px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                        <input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;<input
                            id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        <asp:HiddenField ID="hdn_EmployeeLeaveEntryId" runat="server" />
                        <asp:HiddenField ID="hdn_EmployeeId" runat="server" />
                        <asp:HiddenField ID="hdn_LoginEmpName" runat="server" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
        <oem:EasyMenu ID="EasyMenu1" runat="server" StyleFolder="~/styles/EasyMenu/Styles/vsnet"
            IconsFolder="MenuIcons" Width="210" UseIcons="true" AttachTo="div_Employees"
            ShowEvent="ContextMenu" Align="Cursor">
            <Components>
                <oem:MenuItem ID="menuItem1" InnerHtml="Update Leave Status" OnClientClick="LoadWindow()">
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator1" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
            </Components>
        </oem:EasyMenu>
        <owd:Window ID="Wnd_UpdateWhcichEmpDetails" runat="server" IsModal="true" Height="200"
            Width="440" StyleFolder="~/Styles/mainwindow/blue" Title="Update Employee Details"
            VisibleOnLoad="false" ShowCloseButton="false" ShowStatusBar="False" Left="350"
            Top="155">
            <table class="rowEditTable" width="100%">
                <tr>
                    <td>
                        <fieldset>
                            <legend id="UpdateEmpDetails">Update Entry Status</legend>
                            <table>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chk_IsApproved_Bulk" runat="server" Text="Is Approved" onclick="IsApprovedBulk_CheckedChange();"/>
                                    </td>
                                </tr>
                                <tr >
                                    <td align="left">
                                        Approved&nbsp;By<br />
                                        <asp:TextBox  ID="txt_ApprovedBy_Bulk" ReadOnly="true" runat="server" Width="150px" CssClass="aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        Remarks<br />
                                        <asp:TextBox ID="txt_Remarks_Bulk" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:HiddenField ID="hdn_BulkActionValue" runat="server" />
                         <asp:HiddenField ID="hdn_Remarks" runat="server" />
                        <asp:HiddenField ID="hdn_ApprovedBy" runat="server" />
                        <asp:Label runat="server" ForeColor="Red" EnableViewState="False" ID="lbl_UpdateEmpDetailsError"></asp:Label>
                        <asp:Button ID="btn_UpdateSave1" runat="server" CssClass="WebControl" Text="Update"
                            OnClientClick="btn_UpdateSave();" />
                        &nbsp;<input id="btn_UpdateClose1" type="button" class="WebControl" value="Close"
                            onclick="Wnd_UpdateWhcichEmpDetails.Close();" />
                    </td>
                </tr>
            </table>
        </owd:Window>
    </div>
    </form>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddLeaveEntries") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditLeaveEntries") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
         
        Function ParseApprovalStatus(ByVal IsApproved As String, ByVal ApprovedBy As String)
            If IsApproved = "-1" Then
                Return "Approved(" + ApprovedBy + ")"
            Else
                Return "Not Approved"
            End If
           
            
        End Function
        
        Function ParseDateTime(ByVal DateValue As Date) As String
            Return DateValue.ToString("yyyy-MM-dd")
        End Function
         
    </script>
    <script type="text/javascript">
    
    function myFunction() {
    alert("I am an alert box!");
}
    
        function AssignLeaveDays_onClick1()
            {
                 if(document.getElementById("Flyout1_rbtn_LeaveDays_0").checked)
                   {
                       document.getElementById('<%=drp_ToDateday.ClientID %>').disabled=false;
                       document.getElementById('<%=drp_ToDatemonth.ClientID %>').disabled=false;
                       document.getElementById('<%=drp_ToDateYear.ClientID %>').disabled=false;
                   }
                   
                   else if(document.getElementById("Flyout1_rbtn_LeaveDays_1").checked || document.getElementById("Flyout1_rbtn_LeaveDays_2").checked || document.getElementById("Flyout1_rbtn_LeaveDays_3").checked)
                   {
                       document.getElementById('<%=drp_ToDateday.ClientID %>').disabled=true;
                       document.getElementById('<%=drp_ToDatemonth.ClientID %>').disabled=true;
                       document.getElementById('<%=drp_ToDateYear.ClientID %>').disabled=true;
                   }
            }
            
            function AssignLeaveDays_onClick()
            {
                 
            }
            
		    function attachFlyoutToLink(oLink,Action)
		     {	
		       ClearFlyout();
		       <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
		       <%=Flyout1.getClientID()%>.Open();
		       populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		    }
		    
		    function ClearFlyout()
		    {
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = '';
	            document.getElementById("<%=hdn_EmployeeLeaveEntryId.ClientID %>").value = '0';
	            document.getElementById("<%=hdn_EmployeeId.ClientID %>").value = '0';
                    document.getElementById( "<%=txt_Remarks.ClientID %>").value='';
	            
		    }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout1.getClientID()%>.Close();
		    }
		    
		    function populateEditControls(iRecordIndex) 
		    {	

		            var FromDate=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[20].Value;
		            var ToDate=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[21].Value;
		            var EmployeeName=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[4].Value;
		            var LeaveTypeId=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[16].Value;
		            var LeaveTypeId=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[16].Value;
		            var ApprovedBy=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[14].Value;
		            var IsApproved=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[13].Value;
		            var Remarks=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[15].Value.replace(/<BR>/gi,'\n');
		            var LeaveStatus=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[6].Value;
                    var CreatedDate=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[22].Value;
                    var ModifiedDate=Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[23].Value;
		            
	                SetValueInDropDown(document.getElementById("<%=drp_FromDateday.ClientID %>"),document.getElementById("<%=drp_FromDatemonth.ClientID %>"),document.getElementById("<%=drp_FromDateYear.ClientID %>"),FromDate);
	                SetValueInDropDown(document.getElementById("<%=drp_ToDateday.ClientID %>"),document.getElementById("<%=drp_ToDatemonth.ClientID %>"),document.getElementById("<%=drp_ToDateYear.ClientID %>"),ToDate);
                    document.getElementById( "<%=txt_EmployeeName.ClientID %>").value =EmployeeName;
                    if(IsApproved=='-1')
                        document.getElementById( "<%=chk_IsApproved.ClientID %>").checked=true;
                    else
                        document.getElementById( "<%=chk_IsApproved.ClientID %>").checked=false;
                    document.getElementById( "<%=txt_ApprovedBy.ClientID %>").value=ApprovedBy;
                    document.getElementById( "<%=txt_Remarks.ClientID %>").value=Remarks;
                    document.getElementById( "<%=drp_LeaveType.ClientID %>").value=LeaveTypeId;
                
                  if(LeaveStatus=='FullDay')
                  document.getElementById("Flyout1_rbtn_LeaveDays_0").checked=true;
                  
                  else if(LeaveStatus=='3/4Day')
                  document.getElementById("Flyout1_rbtn_LeaveDays_1").checked=true;
                  
                  else if(LeaveStatus=='HalfDay')
                  document.getElementById("Flyout1_rbtn_LeaveDays_2").checked=true;
                  
                  else if(LeaveStatus=='QuarterDay')
                  document.getElementById("Flyout1_rbtn_LeaveDays_3").checked=true;
                
                  document.getElementById("<%=hdn_EmployeeLeaveEntryId.ClientID %>").value = Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[0].Value;
	              document.getElementById("<%=hdn_EmployeeId.ClientID %>").value = Dg_EmployeeLeaveEntries.Rows[iRecordIndex].Cells[17].Value;

                  if(CreatedDate.includes('1900'))
                  {
                   document.getElementById( "<%=txt_CreatedDate.ClientID %>").value='';
                  }
                  else
                  {
                   document.getElementById( "<%=txt_CreatedDate.ClientID %>").value=CreatedDate;
                  }

                   if(CreatedDate.includes('1900'))
                  {
                   document.getElementById( "<%=txt_ModifiedDate.ClientID %>").value='';
                  }
                  else
                  {
                   document.getElementById( "<%=txt_ModifiedDate.ClientID %>").value=ModifiedDate;
                  }
                  
                  

                  AssignLeaveDays_onClick();
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
		        
                  if(document.getElementById("Flyout1_rbtn_LeaveDays_0").checked)
                  oRecord.LeaveStatus='Full Day';
                  
                  else if(document.getElementById("Flyout1_rbtn_LeaveDays_1").checked)
                  oRecord.LeaveStatus='3/4 Day';
                  
                  else if(document.getElementById("Flyout1_rbtn_LeaveDays_2").checked)
                  oRecord.LeaveStatus='1/2 Day';
                  
                  else if(document.getElementById("Flyout1_rbtn_LeaveDays_3").checked)
                  oRecord.LeaveStatus='Quarter Day';
                  
                  oRecord.Error='';
		          Dg_EmployeeLeaveEntries.executeInsert(oRecord);
		     }
		     
		     function IsApproved_CheckedChange()
                {
                    var object=document.getElementById('<%=chk_IsApproved.ClientID %>');
                    if(object.checked)
                    {
                        document.getElementById('<%=txt_ApprovedBy.ClientID %>').value=document.getElementById('<%=hdn_LoginEmpName.ClientID %>').value;
                    }    
                    else
                    {
                        document.getElementById('<%=txt_ApprovedBy.ClientID %>').disabled=true;
                        document.getElementById('<%=txt_ApprovedBy.ClientID %>').value='';
                     }   
                }
		     
		     
               function IsApprovedBulk_CheckedChange()
                {
                    var object=document.getElementById('<%=chk_IsApproved_Bulk.ClientID %>');
                    if(object.checked)
                    {
                        document.getElementById('<%=txt_ApprovedBy_Bulk.ClientID %>').value=document.getElementById('<%=hdn_LoginEmpName.ClientID %>').value;
                    }    
                    else
                    {
                        document.getElementById('<%=txt_ApprovedBy_Bulk.ClientID %>').disabled=true;
                        document.getElementById('<%=txt_ApprovedBy_Bulk.ClientID %>').value='';
                     }   
                }
		    
            
		
    </script>
    <script type="text/javascript">

        function btn_UpdateSave() {
            document.getElementById("<%=hdn_Remarks.ClientID %>").value = document.getElementById("<%=txt_Remarks_Bulk.ClientID %>").value;
            document.getElementById("<%=hdn_ApprovedBy.ClientID %>").value = document.getElementById("<%=txt_ApprovedBy_Bulk.ClientID %>").value;
            if (document.getElementById("<%=txt_ApprovedBy_Bulk.ClientID %>").value = '') {
                alert("Enter Approved By");
                return false;
            }
            if (document.getElementById("<%=txt_Remarks_Bulk.ClientID %>").value = '') {
                alert("Enter Remarks");
                return false;
            }

            return true;
        }

        function LoadWindow() {

            if (Dg_EmployeeLeaveEntries.SelectedRecords.length > 0) {
                var SelectedStatus = "";
                for (var i = 0; i < Dg_EmployeeLeaveEntries.SelectedRecords.length; i++) {
                    var record = Dg_EmployeeLeaveEntries.SelectedRecords[i];
                    SelectedStatus = SelectedStatus + "," + record.IsApproved;
                }

                if (SelectedStatus.includes("0")) {
                    if (SelectedStatus.includes("-1")) {
                        alert("Select similar leave entry status to update bulk data at one time.");
                        return false;
                    }
                }

                if (SelectedStatus.includes("0")) {
                    document.getElementById("<%=chk_IsApproved_Bulk.ClientID %>").checked = false;
                }
                else if (SelectedStatus.includes("-1")) {
                    document.getElementById("<%=chk_IsApproved_Bulk.ClientID %>").checked = true;
                }
                IsApprovedBulk_CheckedChange();
                document.getElementById("<%=hdn_BulkActionValue.ClientID %>").value = "Leave";
                Wnd_UpdateWhcichEmpDetails.Open();
            }
            else {

                alert("Select rows to update status.Use control keyword to select multiple rows.");

            }
        }


    </script>
</body>
</html>
