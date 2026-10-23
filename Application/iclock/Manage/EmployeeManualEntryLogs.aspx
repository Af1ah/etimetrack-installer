<%@ page language="VB" autoeventwireup="false" enableeventvalidation="false" inherits="Manage_EmployeeManualEntryLogs, App_Web_kgq5n2bg" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        if (record.DeviceId > 2) {

            if (record.DeviceSName = 'Mobile') {
            }
            else {
                alert("Only Manual Entry can be delete.");
                return false;
            }
        }


        record.Error = '';
        document.getElementById("<%=hdn_EmployeeManulEntryId.ClientID %>").value = record.DeviceLogId;
        document.getElementById("<%=hdn_LogTableName.ClientID %>").value = record.TableName;

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


    function OpenLocationPopUpWindow(Longitude, Latitude) {

        var wide = '800';
        var high = '500';

        //this gets the total available width and height of the users screen
        screen_height = window.screen.availHeight;
        screen_width = window.screen.availWidth;

        //this gets the left and top point by saying total width of the screen divided by 2 (center), minus the width of your window divided by 2, which make its center point the middle of the screen. Same for the top
        left_point = parseInt(screen_width / 2) - (wide / 2);
        top_point = parseInt(screen_height / 2) - (high / 2);

        //just doing a simple popup window here, but plugging your info into it, and setting the top and left corners to be our calculated points that will center your window.
        win = window.open('ViewMobileLocationInMaps.aspx?Longitude=' + Longitude + '&Latitude=' + Latitude + '', 'myPopup', 'width=' + wide + ',height=' + high + ',left=' + left_point + ',top=' + top_point + ',toolbar=no,location=no,scrollbars=no,status=no,resizable=no,fullscreen=no');     //make sure your window is in the front 
        win.focus();
    }

    function OpenPhotoPopUpWindow(DeviceLogId, DeviceId,TableName) {
       
       
        var wide = '270';
        var high = '270';

        //this gets the total available width and height of the users screen
        screen_height = window.screen.availHeight;
        screen_width = window.screen.availWidth;

        //this gets the left and top point by saying total width of the screen divided by 2 (center), minus the width of your window divided by 2, which make its center point the middle of the screen. Same for the top
        left_point = parseInt(screen_width / 2) - (wide / 2);
        top_point = parseInt(screen_height / 2) - (high / 2);

        //just doing a simple popup window here, but plugging your info into it, and setting the top and left corners to be our calculated points that will center your window.
        win = window.open('ViewMobileCapturedPhoto.aspx?DeviceLogId=' + DeviceLogId + '&DeviceId=' + DeviceId + '&TableName=' + TableName + '', 'myPopup', 'width=' + wide + ',height=' + high + ',left=' + left_point + ',top=' + top_point + ',toolbar=no,location=no,scrollbars=no,status=no,resizable=no,fullscreen=no');     //make sure your window is in the front 
        win.focus();
    }
	
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px;">
                <td  style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white; height: 27px;">
                    Employee Manual Entries
                </td>
                <td align="right" style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">
                     <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="lblError"></asp:Label>
                    
                    Device
                    <asp:DropDownList ID="drp_FilterDevice" runat="server">
                    </asp:DropDownList>
                    Month
                    <asp:DropDownList ID="drp_SelectMonth" runat="server" Width="48px">
                        <asp:ListItem Value="01">1</asp:ListItem>
                    <asp:ListItem Value="02">2</asp:ListItem>
                    <asp:ListItem Value="03">3</asp:ListItem>
                    <asp:ListItem  Value="04">4</asp:ListItem>
                    <asp:ListItem Value="05">5</asp:ListItem>
                    <asp:ListItem Value="06">6</asp:ListItem>
                    <asp:ListItem Value="07">7</asp:ListItem>
                    <asp:ListItem Value="08">8</asp:ListItem>
                    <asp:ListItem Value="09">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                    </asp:DropDownList>
                   Year
                   
                   <asp:DropDownList ID="ddlYear" runat="server" Width="55px">
                </asp:DropDownList>
                    <asp:DropDownList ID="drp_ApprovedStatus" runat="server">
                        <asp:ListItem Selected="True">All</asp:ListItem>
                        <asp:ListItem>Approved</asp:ListItem>
                        <asp:ListItem>Not Approved</asp:ListItem>
                    </asp:DropDownList>
                   
                    <input type="button" class="tdText" value="Refresh" onclick="Dg_EmployeeLogRecords.refresh()"
                        id="btn_Refresh" />
                </td>
            </tr>
            <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
            
            <tr>
                <td colspan="2">
                <div id="div_Employees">
                    <obout:Grid ID="Dg_EmployeeLogRecords" runat="server" ShowLoadingMessage="true" EnableRecordHover="true"
                        KeepSelectedRecords="true" Serialize="false" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                        AllowAddingRecords="true" OnRebind="RebindGrid" OnInsertCommand="InsertRecord"
                        AllowFiltering="true" OnDeleteCommand="DeleteRecord">
                        <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                            OnClientDelete="OnDelete" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column ID="Column0" DataField="DeviceLogId" Visible="False" Width="100" HeaderText="DeviceLogId"
                                ConvertEmptyStringToNull="False" Index="0" />
                            <obout:Column ID="Column1" SortOrder="Desc" Width="125" HeaderText="Log Date" DataField="LogDate"
                                DataFormatString="{0:dd-MMM-yyyy HH:mm}" ConvertEmptyStringToNull="False" DataFormatString_GroupHeader="{0:dd-MMM-yyyy HH:mm}"
                                Index="1" />
                            <obout:Column ID="Column2" DataField="DeviceSName" Width="100" HeaderText="Device"
                                ConvertEmptyStringToNull="False" Index="2" />
                            <obout:Column ID="Column3" DataField="DeviceId" Visible="False" Width="80" HeaderText="DeviceId"
                                ConvertEmptyStringToNull="False" Index="3" />
                            <obout:Column ID="Column4" DataField="Direction" Width="95" HeaderText="Direction"
                                ConvertEmptyStringToNull="False" Index="4" />
                            <obout:Column ID="Column5" DataField="WorkCode" Width="105" HeaderText="Work Code"
                                ConvertEmptyStringToNull="False" Index="5" />
                            <obout:Column ID="Column6" DataField="EmployeeCode" Width="105" HeaderText="Emp Code"
                                ConvertEmptyStringToNull="False" Index="6" />
                            <obout:Column ID="Column7" DataField="EmployeeName" Width="130" HeaderText="Emp Name"
                                ConvertEmptyStringToNull="False" Index="7" />
                            <obout:Column ID="Column8" DataField="CompanySName" Width="130" HeaderText="Company"
                                ConvertEmptyStringToNull="False" Index="8" />
                            <obout:Column ID="Column9" DataField="DepartmentSName" Width="130" HeaderText="Department"
                                ConvertEmptyStringToNull="False" Index="9" />
                            <obout:Column ID="Column10" DataField="Designation" Visible="False" Width="100" HeaderText="Designation"
                                ConvertEmptyStringToNull="False" Index="10" />
                            <obout:Column ID="Column11" DataField="CategorySName" Visible="False" Width="100"
                                HeaderText="Category" ConvertEmptyStringToNull="False" Index="11" />
                            <obout:Column ID="Column12" DataField="EmployeesStatus" Visible="False" Width="80"
                                HeaderText="Status" ConvertEmptyStringToNull="False" Index="12" />
                            <obout:Column ID="Column13" DataField="EmployementType" Visible="False" Width="85"
                                HeaderText="Emp Type" ConvertEmptyStringToNull="False" Index="13" />
                            <obout:Column ID="Column14" Visible="False" Width="155" HeaderText="Log Date" ConvertEmptyStringToNull="False"
                                Index="14" TemplateId="TP_LogDateFormat">
                                <TemplateSettings TemplateId="TP_LogDateFormat" />
                            </obout:Column>
                            <obout:Column ID="Column20" Index="15" Visible="true" Width="125" SortOrder="Desc"
                                HeaderText="Approval Status" TemplateId="tplApprovalStatus">
                                <TemplateSettings TemplateId="tplApprovalStatus" />
                            </obout:Column>
                            <obout:Column Width="80" ConvertEmptyStringToNull="False" HeaderText="GPS" Index="16"
                                TemplateId="tplViewMaps">
                                <TemplateSettings TemplateId="tplViewMaps" />
                            </obout:Column>
                            <obout:Column Width="80" ConvertEmptyStringToNull="False" Index="17" HeaderText="Att Photo"
                                TemplateId="tplViewImage">
                                <TemplateSettings TemplateId="tplViewImage" />
                            </obout:Column>
                            <obout:Column Width="65" HeaderText="Edit" ConvertEmptyStringToNull="False" Index="18"
                                TemplateId="tplEditActualLeavesBtn">
                                <TemplateSettings TemplateId="tplEditActualLeavesBtn" />
                            </obout:Column>
                            <obout:Column Width="70" AllowDelete="True" HeaderText="Delete" ConvertEmptyStringToNull="False"
                                Index="19" />
                            <obout:Column ConvertEmptyStringToNull="False" DataField="C2" HeaderText="ApprovedBy"
                                Visible="False" Index="20">
                            </obout:Column>
                            <obout:Column ConvertEmptyStringToNull="False" DataField="C3" HeaderText="Status"
                                Visible="False" Index="21">
                            </obout:Column>
                            <obout:Column ConvertEmptyStringToNull="False" DataField="TableName" HeaderText="TableName"
                                Visible="False" Index="22">
                            </obout:Column>
                            <obout:Column ConvertEmptyStringToNull="False" DataField="UserId" HeaderText="UserId"
                                Visible="False" Index="23">
                            </obout:Column>
                            <obout:Column ID="Column15" DataField="IsApproved" Visible="false" Width="100" HeaderText="IsApproved"
                                runat="server" Index="24" />
                            <obout:Column ID="Column16" Visible="false" Width="90" HeaderText="Log Time" runat="server" Index="25">
                                <TemplateSettings TemplateId="TP_DateTimeFormat"  />
                            </obout:Column>
                            <obout:Column ID="Column24" Visible="false" DataField="CreatedDate" DataFormatString="{0:dd-MMM-yyyy HH:mm:ss}"
                                Width="90" HeaderText="CreatedDate" runat="server" Index="26" />
                            <obout:Column ID="Column25" Visible="false" DataField="LastModifiedDate" DataFormatString="{0:dd-MMM-yyyy HH:mm:ss}"
                                Width="90" HeaderText="LastModifiedDate" runat="server" Index="27" />
                            <obout:Column ID="Longitude" DataField="Longitude" Visible="false" Width="160" HeaderText="Longitude"
                                ConvertEmptyStringToNull="False" Index="28" />
                            <obout:Column ID="Latitude" DataField="Latitude" Width="160" Visible="false" HeaderText="Latitude"
                                ConvertEmptyStringToNull="False" Index="29">
                            </obout:Column>
                            <obout:Column ConvertEmptyStringToNull="False" DataField="FileName" HeaderText="FileName"
                                Visible="False" Index="30">
                            </obout:Column>
                          
                        </Columns>
                        <Templates>
                            <obout:GridTemplate runat="server" ID="TP_LogDateFormat" ControlID="" ControlPropertyName="">
                                <Template>
                                    <%#ParseDateTime(Container.DataItem.Item("LogDate"))%></Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplEditActualLeavesBtn" ControlID="" ControlPropertyName="">
                                <Template>
                                    <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                        class="ob_gAL">
                                        <%#CheckPermissionsEdit("Edit", Container.DataItem("DeviceId"),Container.DataItem("DeviceSName"))%>
                                    </a>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplAddBtn" ControlID="" ControlPropertyName="">
                                <Template>
                                    <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissions("Assign Manual Entries")%>'
                                        NavigateUrl='<%# "~/manage/AssignEmployeeDeviceLogs.aspx"%>' ID="AA1" />
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplApprovalStatus">
                                <Template>
                                    <%#ParseApprovalStatus(Container.DataItem("IsApproved"), Container.DataItem("C2"))%>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="TP_DateTimeFormat" ControlID="" ControlPropertyName="">
                                <Template>
                                    <%#ParseDateTime1(Container.DataItem.Item("LogDate"))%></Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplViewMaps">
                                <Template>
                                    <a href="Javascript:void(0);" onclick="OpenLocationPopUpWindow('<%#Container.DataItem.Item("Longitude")%>','<%#Container.DataItem.Item("Latitude")%>')">
                                         <%#ShowGPSColumn(Container.DataItem.Item("Longitude"),Container.DataItem.Item("Latitude"))%> </a>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplViewImage">
                                <Template>
                                    <a href="Javascript:void(0);" onclick="OpenPhotoPopUpWindow('<%#Container.DataItem.Item("DeviceLogId")%>','<%#Container.DataItem.Item("DeviceId")%>','<%#Container.DataItem.Item("TableName")%>')">
                                          <%#ShowPhotoColumn(Container.DataItem.Item("FileName"))%> </a>
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
                            <legend>Update Employee Log Entry</legend>
                            <table>
                                <tr>
                                    <td>
                                        Employee Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_EmployeeName" runat="server" Width="150px" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td>
                                        Employee Code
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_EmployeeCode" runat="server" Width="130px" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Work Code
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_WorkCode" runat="server">
                                            <asp:ListItem>999</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        Device
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_DeviceName" runat="server" Width="140px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        &nbsp;DateTime&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="drp_Day"
                                            runat="server"></select><select id="drp_Month" runat="server"></select><select id="drp_Year"
                                                runat="server"></select><asp:DropDownList ID="drp_Hour" runat="server" Width="48px">
                                                </asp:DropDownList>
                                        <asp:DropDownList ID="drp_Minuts" runat="server" Width="49px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;Direction&nbsp;
                                        <select id="drp_Direcion" runat="server" width="69px" enableviewstate="true">
                                            <option selected="selected" value="in">In</option>
                                            <option value="out">out</option>
                                            <option value="breakin">Break In</option>
                                            <option value="breakout">Break out</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:CheckBox ID="chk_IsApproved" Width="100px" runat="server" Text="Is Approved"
                                            onclick="IsApproved_CheckedChange();" />
                                        &nbsp;&nbsp;Approved&nbsp;By
                                        <asp:TextBox ID="txtApprovedBy" Enabled="false" Width="127px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <table>
                                            <tr>
                                                <td >
                                                    &nbsp;Status&nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtStatus" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <table>
                                            <tr>
                                                <td colspan="2">
                                                    Created Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="txt_CreatedDate" ReadOnly="true" Width="145px" runat="server"></asp:TextBox>
                                                    &nbsp;Last Modified Date&nbsp;
                                                    <asp:TextBox ID="txt_ModifiedDate" ReadOnly="true" Width="145px" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input
                            id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                                id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        <asp:HiddenField ID="hdn_EmployeeManulEntryId" runat="server" />
                        <asp:HiddenField ID="hdn_LogTableName" runat="server" />
                        <asp:HiddenField ID="hdn_UserId" runat="server" />
                        <asp:HiddenField ID="hdn_LoginEmpName" runat="server" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>

             <oem:EasyMenu ID="EasyMenu1" runat="server" StyleFolder="~/styles/EasyMenu/Styles/vsnet"
            IconsFolder="MenuIcons" Width="210" UseIcons="true" AttachTo="div_Employees"
            ShowEvent="ContextMenu" Align="Cursor">
            <Components>
                <oem:MenuItem ID="menuItem1" InnerHtml="Update Manual Entry Status" OnClientClick="LoadWindow()">
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
                                        <asp:CheckBox ID="chk_IsApproved_Bulk" runat="server" Text="Is Approved" onclick="IsApprovedBulk_CheckedChange();" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        Approved&nbsp;By<br />
                                        <asp:TextBox ID="txt_ApprovedBy_Bulk" ReadOnly="true" runat="server" Width="150px" CssClass="aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled"></asp:TextBox>
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
     <asp:HiddenField ID="hdn_TableName" runat="server" />
    </form>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddLogRecords") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
         
        Function CheckPermissionsEdit(ByVal Action As String, ByVal DeviceId As String, ByVal DeviceSName As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditLogRecords") And (DeviceId = "1" Or DeviceId = "2") Then
                    Return Action
                ElseIf CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditLogRecords") And (DeviceSName = "Mobile") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function ParseDateTime(ByVal DateValue As Date) As String
            Return DateValue.ToString("yyyy-MM-dd")
        End Function
        
        Function ParseDateTime1(ByVal DateValue As Date) As String
            Return DateValue.ToString("HH:mm:ss")
        End Function
        
        Function ParseApprovalStatus(ByVal IsApproved As String, ByVal ApprovedBy As String) As String
           
            'If IsApproved = "-1" Then
            '    Return "Approved(" + ApprovedBy + ")"
            'Else
            '    Return "Not Approved"
            'End If
           
        End Function
        
        Function ShowGPSColumn(ByVal Longitude As String, ByVal Latitude As String)
            Try
                If Not String.IsNullOrEmpty(Longitude) Then
                    If Not String.IsNullOrEmpty(Latitude) Then
                        If Not Longitude = 0 Then
                            If Not Latitude = 0 Then
                                Return "View"
                            End If
                        End If
                    End If
                End If
            Catch ex As Exception
                Return ""
            End Try
        End Function
        
        Function ShowPhotoColumn(ByVal FileName As String)
            Try
                If Not String.IsNullOrEmpty(FileName) Then
                    Return "View"
                Else
                    Return ""
                End If
              
            Catch ex As Exception
                Return ""
            End Try
            
        End Function
        
    </script>
    <script type="text/javascript">
            
	    function attachFlyoutToLink(oLink,Action)
	     {	
        
	       <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	       <%=Flyout1.getClientID()%>.Open();
	       populateEditControls(oLink.id.toString().replace("grid_link_", ""));
         }
		    
		function closeFlyout() 
		    {
		        <%=Flyout1.getClientID()%>.Close();
		    }
		    
	    function populateEditControls(iRecordIndex) 
	    {	
           
           
	        var LogDate=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[14].Value;
	        var DeviceId=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[3].Value;
	        var Direction=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[4].Value.toLowerCase(); 
	        var EmployeeName=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[7].Value;
	        var EmployeeCode=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[6].Value;
	        var ApprovedBy=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[20].Value;
	        var Status=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[21].Value;
	        var UserId=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[23].Value;
            var IsApproved=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[24].Value;
            var LogDateTime=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[25].Value;
            var CreatedDate=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[26].Value;
            var ModifiedDate=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[27].Value;

            document.getElementById( "<%=txt_EmployeeName.ClientID %>").value =EmployeeName;
            document.getElementById( "<%=txt_EmployeeCode.ClientID %>").value=EmployeeCode;
            document.getElementById( "<%=drp_DeviceName.ClientID %>").value=DeviceId;
           
            if(Direction=='')
            {
                document.getElementById( "<%=drp_Direcion.ClientID %>").value='in';
            }
            else
            {
             document.getElementById( "<%=drp_Direcion.ClientID %>").value=Direction;   
            }
            
           
            document.getElementById( "<%=Lbl_InvalidError.ClientID %>").innerHTML='';
            SetValueInDropDownForDate(document.getElementById("<%=drp_Day.ClientID %>"),document.getElementById("<%=drp_Month.ClientID %>"),document.getElementById("<%=drp_Year.ClientID %>"),LogDate);
            SetValueInDropDownForDateForTime(document.getElementById("<%=drp_Hour.ClientID%>"),document.getElementById("<%=drp_Minuts.ClientID%>"),LogDateTime);
            document.getElementById("<%=hdn_EmployeeManulEntryId.ClientID %>").value = Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[0].Value;
            document.getElementById("<%=hdn_LogTableName.ClientID %>").value = Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[22].Value;
            document.getElementById("<%=drp_WorkCode.ClientID %>").value = Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[5].Value;
            document.getElementById( "<%=txtApprovedBy.ClientID %>").value =ApprovedBy;
            document.getElementById( "<%=txtStatus.ClientID %>").value =Status;
            document.getElementById("<%=hdn_UserId.ClientID %>").value = Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[23].Value;

             if(IsApproved=='-1')
                    document.getElementById( "<%=chk_IsApproved.ClientID %>").checked=true;
                else
                    document.getElementById( "<%=chk_IsApproved.ClientID %>").checked=false;
                document.getElementById( "<%=txtApprovedBy.ClientID %>").value=ApprovedBy;
                document.getElementById( "<%=txtStatus.ClientID %>").value=Status;

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

	    }
	    
        function SetValueInDropDownForDate(ddobject,mmobject,yyobject,value)
		    {

               
		        var Day=value.split('-')[2].replace(/^\s+|\s+$/g,"");
                var Month=value.split('-')[1].replace(/^\s+|\s+$/g,"");
                var Year=value.split('-')[0].replace(/^\s+|\s+$/g,"");
               
               
                ddobject.value=Day.trim();
                mmobject.value=Month.trim();
                yyobject.value=Year.trim();

                

		    }
	        
             function SetValueInDropDownForDateForTime(HHobject,mmobject,Value)
		        {
		            var Hours=Value.split(':')[0];
		            var Minutes=Value.split(':')[1];

		            HHobject.value=Hours.trim();
		            mmobject.value=Minutes.trim();
                     
                     
		        }
	    
 function SetValueInDropDown(ddobject,mmobject,yyobject,HHobject,MMobject,value)
		    {
                alert(value.split(' ')[0]);
                var Day=value.split(' ')[0].split('-')[2];
	            var Month=value.split(' ')[0].split('-')[1];
	            var Year=value.split(' ')[0].split('-')[0];
		        var Hour=value.split(' ')[1].split(':')[0];
		        var Minute=value.split(' ')[1].split(':')[1];
              
		        
		        yyobject.value=Year;
		        mmobject.value=Month;
		        ddobject.value=Day;
		        HHobject.value=Hour;
		        MMobject.value=Minute;
		        
		    }
	      
	     function btn_Save_onclick()
	     {
	          var oRecord = new Object();
              oRecord.Id=document.getElementById("<%=hdn_EmployeeManulEntryId.ClientID %>").value 
              oRecord.Error='';
	          Dg_EmployeeLogRecords.executeInsert(oRecord);
	     }
	     
	    function RefreshDataGrid()
        {
            Dg_EmployeeLogRecords.refresh();
            window.setTimeout('RefreshDataGrid()', 60000);
        }

        function IsApproved_CheckedChange()
                {
                    var object=document.getElementById('<%=chk_IsApproved.ClientID %>');
                    if(object.checked)
                    {
                        document.getElementById('<%=txtApprovedBy.ClientID %>').value=document.getElementById('<%=hdn_LoginEmpName.ClientID %>').value;
                    }    
                    else
                    {
                        document.getElementById('<%=txtApprovedBy.ClientID %>').disabled=true;
                        document.getElementById('<%=txtApprovedBy.ClientID %>').value='';
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
		     

            //window.setTimeout('RefreshDataGrid()', 60000);
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

              if (Dg_EmployeeLogRecords.SelectedRecords.length > 0) {
                  var SelectedStatus = "";
                  for (var i = 0; i < Dg_EmployeeLogRecords.SelectedRecords.length; i++) {
                      var record = Dg_EmployeeLogRecords.SelectedRecords[i];
                      SelectedStatus = SelectedStatus + "," + record.IsApproved;
                  }

                  if (SelectedStatus.includes("0")) {
                      if (SelectedStatus.includes("-1")) {
                          alert("Select similar manual entry status to update bulk data at one time.");
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
                  document.getElementById("<%=hdn_BulkActionValue.ClientID %>").value = "ManualLog";
                  Wnd_UpdateWhcichEmpDetails.Open();
              }
              else {

                  alert("Select rows to update status.Use control keyword to select multiple rows.");

              }
          }


    </script>


</body>
</html>
