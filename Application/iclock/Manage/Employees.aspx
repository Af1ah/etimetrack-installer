<%@ page language="VB" autoeventwireup="false" inherits="Manage_Employees, App_Web_kgq5n2bg" enableeventvalidation="false" validaterequest="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="fup" Namespace="OboutInc.FileUpload" Assembly="obout_FileUpload" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        record.Error = '';
        document.getElementById("<%=Hdn_EmployeeId.ClientID %>").value = record.EmployeeId;
        document.getElementById("<%=Hdn_EmployeeCode.ClientID %>").value = record.EmployeeCode;
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
        document.getElementById("<%=Lbl_InvalidError1.ClientID %>").innerHTML = record.Error;

    }
	
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body onload="drp_JobStatus_OnChange();LoadMultipleEmployeeViewState();chk_ExpiryRule_CheckedChange();">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style=" background-color: lightsteelblue;">
                <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Employees List
                </td>
                 <td align="right" style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">
                    &nbsp;&nbsp; Company &nbsp;<asp:DropDownList ID="drp_FilterCompany" Width="96px"
                        runat="server">
                    </asp:DropDownList>
                    &nbsp;&nbsp; Designation
                    <asp:DropDownList ID="drp_FilterDesignation" Width="96px" runat="server">
                    </asp:DropDownList>
                    &nbsp;&nbsp; Status
                    <asp:DropDownList ID="drp_FilterStatus" Width="96px" runat="server">
                    </asp:DropDownList>
                    &nbsp;&nbsp; Employment&nbsp;Type
                    <asp:DropDownList ID="drp_FilterEmployementType" Width="96px" runat="server">
                    </asp:DropDownList>
                    &nbsp;&nbsp;
                    

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
                        <obout:Grid ID="Dg_Employee" runat="server" EnableRecordHover="true" KeepSelectedRecords="true"
                            Serialize="false" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                            AllowAddingRecords="true" ShowLoadingMessage="true" OnRebind="RebindGrid" OnInsertCommand="InsertRecord"
                            AllowFiltering="true" OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column ID="Column0" Align="left" DataField="EmployeeId" Visible="false" Width="300"
                                    HeaderText="ShiftId" runat="server" />
                                <obout:Column ID="Column1" DataField="EmployeeCode" SortOrder="Asc" Visible="true"
                                    Width="88" HeaderText="Emp Code" runat="server" />
                                <obout:Column ID="Column2" DataField="EmployeeName" Visible="true" Width="95" HeaderText="Emp Name"
                                    runat="server" />
                                <obout:Column ID="Column3" DataField="CompanySName" Visible="true" Width="90" HeaderText="Company"
                                    runat="server" />
                                <obout:Column ID="Column4" DataField="DepartmentSName" Visible="true" Width="100"
                                    HeaderText="Department" runat="server" />
                                <obout:Column ID="Column5" DataField="Designation" Visible="true" Width="100" HeaderText="Designation"
                                    runat="server" />
                                <obout:Column ID="Column6" DataField="Location" HeaderText="Location" Visible="true"
                                    Width="85" runat="server" />
                                <obout:Column ID="Column7" DataField="CategorySName" Visible="true" Width="95" HeaderText="Category"
                                    runat="server" />
                                <obout:Column ID="Column8" DataField="EmployeesStatus" Visible="false" Width="80"
                                    HeaderText="Status" runat="server" />
                                <obout:Column ID="Column9" DataField="EmployementType" Visible="false" Width="95"
                                    HeaderText="Emp Type" runat="server" />
                                <obout:Column ID="Column10" DataField="CompanyId" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column11" DataField="DepartmentId" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column12" DataField="CategoryId" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column13" Visible="false" Width="120" runat="server">
                                    <TemplateSettings TemplateId="TP_DOBFormat" />
                                </obout:Column>
                                <obout:Column ID="Column14" DataField="FatherName" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column15" DataField="MotherName" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column16" DataField="ResidentialAddress" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column17" DataField="ContactNo" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column18" DataField="Email" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column19" DataField="PlaceOfBirth" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column20" DataField="Nomenee1" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column21" DataField="Nomenee2" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column22" DataField="PermanentAddress" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column23" DataField="Remarks" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column24" DataField="EmployeeCodeInDevice" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column25" DataField="Gender" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column26" Visible="false" Width="120" runat="server">
                                    <TemplateSettings TemplateId="TP_DOJFormat" />
                                </obout:Column>
                                <obout:Column ID="Column27" Visible="false" Width="120" runat="server">
                                    <TemplateSettings TemplateId="TP_DOCFormat" />
                                </obout:Column>
                                <obout:Column ID="Column28" Visible="false" Width="120" runat="server">
                                    <TemplateSettings TemplateId="TP_DORFormat" />
                                </obout:Column>
                                <obout:Column ID="Column29" DataField="BloodGroup" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column30" DataField="Grade" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column31" DataField="Team" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column32" DataField="HolidayGroup" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column33" DataField="ShiftGroupId" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column34" DataField="ShiftRosterId" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column39" DataField="AadhaarNumber" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column35" DataField="LastModifiedBy" HeaderText="Modified By" Visible="false"
                                    Width="98" runat="server" />
                                <obout:Column Width="190" HeaderText="Edit" AllowEdit="false" AllowDelete="false"
                                    Visible="false">
                                    <TemplateSettings TemplateId="tplLoginAndDepartmentAccessBtn" />
                                </obout:Column>
                                <obout:Column Width="110" HeaderText="Edit" AllowEdit="false" AllowDelete="false"
                                    Visible="true">
                                    <TemplateSettings TemplateId="tplLeaveSummaryBtn" />
                                </obout:Column>
                                <obout:Column Width="85" HeaderText="Edit" AllowEdit="false" AllowDelete="false"
                                    Visible="true">
                                    <TemplateSettings TemplateId="tplShiftDetailsBtn" />
                                </obout:Column>
                                <obout:Column Width="90" HeaderText="Edit" AllowEdit="false" AllowDelete="false"
                                    Visible="true">
                                    <TemplateSettings TemplateId="tplOtherDetailsBtn" />
                                </obout:Column>
                                <obout:Column Width="90" HeaderText="Edit" AllowEdit="false" AllowDelete="false"
                                    Visible="true">
                                    <TemplateSettings TemplateId="tplPayDetailsBtn" />
                                </obout:Column>
                                <obout:Column Width="50" HeaderText="" AllowEdit="false" AllowDelete="false" Visible="true">
                                    <TemplateSettings TemplateId="tplEmployeePhoto" />
                                </obout:Column>
                                <obout:Column Width="57" HeaderText="Delete" AllowEdit="false" AllowDelete="true"
                                    Visible="true" />
                                <obout:Column Width="40" HeaderText="Edit" AllowEdit="true" AllowDelete="true">
                                    <TemplateSettings TemplateId="tplEditBtn" />
                                </obout:Column>
                                <obout:Column ID="Column36" DataField="EmployeeRFIDNumber" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column37" DataField="EmployeeDeviceGroup" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column38" DataField="DevicePassword" Visible="false" Width="120"
                                    runat="server" />
                                <obout:Column ID="Column40" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column41" Visible="false" Width="120" runat="server" />
                                <obout:Column Width="131" HeaderText="Register" AllowEdit="false" AllowDelete="false"
                                    Visible="true">
                                    <TemplateSettings TemplateId="tplFPRegisterBtn" />
                                </obout:Column>
                                <obout:Column Width="60" Visible="false" HeaderText="EditMenu" AllowEdit="true" AllowDelete="true">
                                    <TemplateSettings TemplateId="tplEditMenuBtn" />
                                </obout:Column>
                                <obout:Column ID="Column42" DataField="DeviceExpiryRule" Visible="false" Width="120"
                                    HeaderText="DeviceExpiryRule" runat="server" />
                                <obout:Column ID="Column43" DataField="DeviceExpiryStartDate" Visible="false" Width="120"
                                    HeaderText="DeviceExpiryStartDate" runat="server" />
                                <obout:Column ID="Column44" DataField="DeviceExpiryEndDate" Visible="false" Width="120"
                                    HeaderText="DeviceExpiryEndDate" runat="server" />
                                <obout:Column ID="Column45" Visible="false" Width="120" runat="server">
                                    <TemplateSettings TemplateId="TP_ExpiryStartDateFormat" />
                                </obout:Column>
                                <obout:Column ID="Column46" Visible="false" Width="120" runat="server">
                                    <TemplateSettings TemplateId="TP_ExpiryEndDateFormat" />
                                </obout:Column>
                                <obout:Column ID="Column47" DataField="GeofenceId" Visible="false" Width="120" runat="server" />

                                <obout:Column ID="Column48" DataField="MaritalStatus" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column49" DataField="Nationality" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column50" DataField="PassportNumber" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column51" DataField="OverallExperience" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column52" DataField="Qualifications" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column53" DataField="ReferenceDetail" Visible="false" Width="120" runat="server" />
                                <obout:Column ID="Column54" DataField="EmergencyContact" Visible="false" Width="120" runat="server" />
                                 <obout:Column ID="Column55" DataField="SubDepartment" Visible="false" Width="120" runat="server" />
                                  <obout:Column ID="Column56" DataField="Division" Visible="false" Width="120" runat="server" />
                                    <obout:Column ID="Column57" DataField="VerificationType" Visible="false" Width="120" runat="server" />

                                  
                            </Columns>
                            <Templates>
                                <obout:GridTemplate runat="server" ID="tplEditBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyout_DetailsToLink(this,'Update')"
                                            class="ob_gAL">
                                            <%#CheckPermissionsEdit("Edit")%>
                                        </a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplEditMenuBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissionsEdit("Edit")%>'
                                            NavigateUrl='<%# "~/manage/EmployeeEditMenu.aspx?EmployeeId=" + GetDataItemValue("EmployeeId", Container)+"&EmployeeCode="+GetDataItemValue("EmployeeCode", Container)+"&EmployeeName="+GetDataItemValue("EmployeeName", Container)+"&Gender="+GetDataItemValue("Gender", Container)+"&CompanyId="+GetDataItemValue("CompanyId", Container)+"&DepartmentId="+GetDataItemValue("DepartmentId", Container)%>'
                                            ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplAddBtn">
                                    <Template>
                                        <a href="javascript: //" id="btAdd" onclick="attachFlyout_DetailsToLink(this,'Add')"
                                            class="ob_gAL">
                                            <%#CheckPermissions("Add")%>
                                        </a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplBioDetailsBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" class="ob_gAL">
                                            Bio Details</a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplShiftDetailsBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissionsEdit("Shift Details")%>'
                                            NavigateUrl='<%# "~/manage/EmployeeShiftCalendarShedular.aspx?EmployeeId=" + GetDataItemValue("EmployeeId", Container)+"&CompanyId="+GetDataItemValue("CompanyId", Container)+"&DepartmentId="+GetDataItemValue("DepartmentId", Container)+"&EmployeeName="+GetDataItemValue("EmployeeName", Container)%>'
                                            ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplLeaveSummaryBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissionsEdit("Leave Summary")%>'
                                            NavigateUrl='<%# "~/manage/employeeleaves.aspx?EmployeeId=" + GetDataItemValue("EmployeeId", Container)+"&EmployeeCode="+GetDataItemValue("EmployeeCode", Container)+"&EmployeeName="+GetDataItemValue("EmployeeName", Container)+"&Gender="+GetDataItemValue("Gender", Container)%>'
                                            ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplLoginAndDepartmentAccessBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissionsEdit("Login And Department Access")%>'
                                            NavigateUrl='<%# "~/manage/LoginAndDepartmentAccessDetails.aspx?EmployeeId=" + GetDataItemValue("EmployeeId", Container)+"&EmployeeCode="+GetDataItemValue("EmployeeCode", Container)+"&EmployeeName="+GetDataItemValue("EmployeeName", Container)+"&Gender="+GetDataItemValue("Gender", Container)%>'
                                            ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="TP_DOJFormat">
                                    <Template>
                                        <%#ParseDateTime(Container.DataItem.Item("DOJ"))%>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="TP_DOCFormat">
                                    <Template>
                                        <%#ParseDateTime(Container.DataItem.Item("DOC"))%>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="TP_DORFormat">
                                    <Template>
                                        <%#ParseDateTime(Container.DataItem.Item("DOR"))%>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="TP_DOBFormat">
                                    <Template>
                                        <%#ParseDateTime(Container.DataItem.Item("DOB"))%>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplPayDetailsBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Style="cursor: hand;" Text="Pay Details"
                                            NavigateUrl='<%# "~/PayRoll/EmployeePayDetails.aspx?EmployeeId=" + GetDataItemValue("EmployeeId", Container)+"&EmployeeCode="+GetDataItemValue("EmployeeCode", Container)+"&EmployeeName="+GetDataItemValue("EmployeeName", Container)+"&Gender="+GetDataItemValue("Gender", Container)%>'
                                            ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplOtherDetailsBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" class="ob_gAL"
                                            onclick="attachFlyout_OtherDetailsToLink(this,'Update')">
                                            <%#CheckPermissionsEdit("Other Details")%>
                                        </a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplEmployeePhoto">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissionsEdit("Photo")%>'
                                            NavigateUrl='<%# "~/manage/UpdateEmployeeProfilePhoto.aspx?EmployeeId=" + GetDataItemValue("EmployeeId", Container)+"&EmployeeName=" + GetDataItemValue("EmployeeName", Container) + "&EmployeeCode=" + GetDataItemValue("EmployeeCode", Container) + ""%>'
                                            ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplFPRegisterBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text="Finger" NavigateUrl='<%# "~/manage/RegisterEmployeeFinger.aspx?EmployeeId=" + GetDataItemValue("EmployeeId", Container)+"&EmployeeName="+GetDataItemValue("EmployeeName", Container)%>'
                                            ID="AA1" />|
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text="BioPhoto" NavigateUrl='<%# "~/manage/UpdateEmployeeBioPhoto.aspx?EmployeeId=" + GetDataItemValue("EmployeeId", Container)+"&EmployeeName=" + GetDataItemValue("EmployeeName", Container) + "&EmployeeCode=" + GetDataItemValue("EmployeeCode", Container) + ""%>'
                                            ID="AA12" />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="TP_ExpiryStartDateFormat">
                                    <Template>
                                        <%#ParseDeviceExpiryDateTime(Container.DataItem.Item("DeviceExpiryStartDate"))%>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="TP_ExpiryEndDateFormat">
                                    <Template>
                                        <%#ParseDeviceExpiryDateTime(Container.DataItem.Item("DeviceExpiryEndDate"))%>
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </div>
                    <oem:EasyMenu ID="EasyMenu1" runat="server" StyleFolder="~/styles/EasyMenu/Styles/vsnet"
                        IconsFolder="MenuIcons" Width="210" UseIcons="true" AttachTo="div_Employees"
                        ShowEvent="ContextMenu" Align="Cursor">
                        <Components>
                            <oem:MenuItem ID="menuItem1" InnerHtml="Update Department" OnClientClick="LoadValueInDrp('Update Department')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator1" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem4" InnerHtml="Update Category" OnClientClick="LoadValueInDrp('Update Category')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator2" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem5" InnerHtml="Update Company" OnClientClick="LoadValueInDrp('Update Company')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator3" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <%-- <oem:MenuItem ID="menuItem12" InnerHtml="Update Category" OnClientClick="LoadValueInDrp('Update ShiftGroup')">
                                </oem:MenuItem>
                                <oem:MenuSeparator ID="menuSeparator12" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                                </oem:MenuSeparator>
                                <oem:MenuItem ID="menuItem13" InnerHtml="Update Category" OnClientClick="LoadValueInDrp('Update HolidayGroup')">
                                </oem:MenuItem>
                                <oem:MenuSeparator ID="menuSeparator13" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                                </oem:MenuSeparator>--%>
                            <oem:MenuItem ID="menuItem6" InnerHtml="Update Status" OnClientClick="LoadValueInDrp('Update Status')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator4" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem7" InnerHtml="Update Designation" OnClientClick="LoadValueInCombo('Update Designation')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator5" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem2" InnerHtml="Update Employment Type" OnClientClick="LoadValueInCombo('Update EmployementType')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator6" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem3" InnerHtml="Update Location" OnClientClick="LoadValueInCombo('Update Location')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator7" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem8" InnerHtml="Update Grade" OnClientClick="LoadValueInCombo('Update Grade')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator8" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem9" InnerHtml="Update Team" OnClientClick="LoadValueInCombo('Update Team')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator9" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem10" InnerHtml="Update Holiday Group" OnClientClick="LoadValueInDrp('Update HolidayGroup')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator10" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem11" InnerHtml="Update Shift Group" OnClientClick="LoadValueInDrp('Update ShiftGroup')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator11" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem12" InnerHtml="Delete Employees" OnClientClick="LoadValueInDrp('Delete Employees')">
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator12" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                        </Components>
                    </oem:EasyMenu>
                </td>
            </tr>
        </table>
        <obout:Flyout runat="server" ID="Flyout_Details" Position="BOTTOM_CENTER"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Employee Details</legend>
                            <table>
                                <tr>
                                    <td align="right" style="font-weight: bold;">
                                        Employee Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_employeeName" runat="server" CssClass="WebControls" Width="175px"></asp:TextBox>
                                    </td>
                                    <td align="right" style="font-weight: bold;">
                                        Employee Code
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Employeecode" runat="server" CssClass="WebControls" Width="175px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="font-weight: bold;">
                                        Device Code
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_DeviceCode" runat="server" CssClass="WebControls" Width="175px"></asp:TextBox>
                                    </td>
                                    <td align="right" style="font-weight: bold;">
                                        Company
                                    </td>
                                    <td>
                                        <select id="drp_company" runat="server" class="WebControls" style="width: 175px;">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="font-weight: bold;">
                                        Department
                                    </td>
                                    <td style="height: 24px">
                                        <select id="drp_department" runat="server" class="WebControls" style="width: 175px;">
                                        </select>
                                    </td>
                                    <td align="right">
                                        Designation
                                    </td>
                                    <td>
                                        <obout:Combobox Validate="false" ID="drp_Designation" CssClass="WebControls" runat="server"
                                            Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                </tr>
                                   <tr>
                                    <td align="right" >
                                        Sub&nbsp;Department
                                    </td>
                                    <td style="height: 24px">
                                       <obout:Combobox Validate="false" ID="drp_SubDepartment" CssClass="WebControls" runat="server"
                                            Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                    <td align="right">
                                        Division
                                    </td>
                                    <td>
                                        <obout:Combobox Validate="false" ID="drp_Division" CssClass="WebControls" runat="server"
                                            Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Grade
                                    </td>
                                    <td style="height: 24px">
                                        <obout:Combobox Validate="false" ID="drp_Grade" CssClass="WebControls" runat="server"
                                            Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                    <td align="right">
                                        Team
                                    </td>
                                    <td>
                                        <obout:Combobox Validate="false" ID="drp_Team" CssClass="WebControls" runat="server"
                                            Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="font-weight: bold;">
                                        Location
                                    </td>
                                    <td>
                                        <obout:Combobox Validate="false" ID="drp_Location" runat="server" CssClass="WebControls"
                                            Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                    <td align="right" style="font-weight: bold;">
                                        Employment Type
                                    </td>
                                    <td>
                                        <obout:Combobox Validate="false" ID="drp_EmploymentType" CssClass="WebControls" runat="server"
                                            Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="font-weight: bold;">
                                        Category
                                    </td>
                                    <td>
                                        <select id="drp_category" runat="server" class="WebControls" style="width: 175px;">
                                        </select>
                                    </td>
                                    <td align="right" style="font-weight: bold;">
                                        Holiday Group
                                    </td>
                                    <td>
                                        <select id="drp_HolidayGroup" runat="server" class="WebControls" style="width: 175px;">
                                            <option value="-1">None</option>
                                            <option value="0">Holiday Group 1</option>
                                            <option value="1">Holiday Group 2</option>
                                            <option value="2">Holiday Group 3</option>
                                            <option value="3">Holiday Group 4</option>
                                            <option value="4">Holiday Group 5</option>
                                            <option value="5">Holiday Group 6</option>
                                            <option value="6">Holiday Group 7</option>
                                            <option value="7">Holiday Group 8</option>
                                            <option value="8">Holiday Group 9</option>
                                            <option value="9">Holiday Group 10</option>
                                            <option value="10">Holiday Group 11</option>
                                            <option value="11">Holiday Group 12</option>
                                            <option value="12">Holiday Group 13</option>
                                            <option value="13">Holiday Group 14</option>
                                            <option value="14">Holiday Group 15</option>
                                            <option value="15">Holiday Group 16</option>
                                            <option value="16">Holiday Group 17</option>
                                            <option value="17">Holiday Group 18</option>
                                            <option value="18">Holiday Group 19</option>
                                            <option value="19">Holiday Group 20</option>
                                            <option value="20">Holiday Group 21</option>
                                            <option value="21">Holiday Group 22</option>
                                            <option value="22">Holiday Group 23</option>
                                            <option value="23">Holiday Group 24</option>
                                            <option value="24">Holiday Group 25</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="font-weight: bold;">
                                        Shift Group
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_ShiftGroup" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="right" style="font-weight: bold;">
                                        Shift Roster
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_ShiftRoster" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Date of joining
                                    </td>
                                    <td>
                                        <select id="drp_DOJday" class="WebControls" runat="server" width="46px">
                                        </select>
                                        &nbsp;&nbsp;<select id="drp_DOJmonth" class="WebControls" runat="server" enableviewstate="true"
                                            width="48px">
                                        </select>&nbsp;&nbsp;<select id="drp_DOJYear" class="WebControls" runat="server"
                                            enableviewstate="true" width="69px">
                                        </select>
                                    </td>
                                    <td align="right">
                                        Date of Confirmation
                                    </td>
                                    <td>
                                        <select id="drp_DOCday" runat="server" class="WebControls" enableviewstate="true"
                                            width="46px">
                                        </select>
                                        &nbsp;&nbsp;<select id="drp_DOCmonth" class="WebControls" runat="server" enableviewstate="true"
                                            width="48px">
                                        </select>&nbsp;&nbsp;<select class="WebControls" id="drp_DOCYear" runat="server"
                                            enableviewstate="true" width="69px">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="font-weight: bold;">
                                        Status
                                    </td>
                                    <td>
                                        <select id="drp_Status" class="WebControls" runat="server" width="204px" onchange="drp_JobStatus_OnChange();">
                                        </select>
                                    </td>
                                    <td align="right">
                                        Last Working Day
                                    </td>
                                    <td>
                                        <select id="drp_DORday" class="WebControls" runat="server" enableviewstate="true"
                                            width="43px">
                                        </select>
                                        &nbsp;&nbsp;<select id="drp_DORmonth" class="WebControls" runat="server" enableviewstate="true"
                                            width="48px">
                                        </select>&nbsp;&nbsp;<select id="drp_DORYear" class="WebControls" runat="server"
                                            enableviewstate="true" width="75px">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Sex
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbtn_Sex" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True">Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td align="right">
                                        Aadhaar&nbsp;Number
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_AadhaarNumber" runat="server" CssClass="WebControls" Width="175px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Card Number
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_RFIDCardNumber" runat="server" CssClass="WebControls" Width="175px"></asp:TextBox>
                                    </td>
                                    <td align="right" style="font-weight: normal;">
                                        Geofence
                                    </td>
                                    <td style="height: 24px">
                                        <select id="drp_Geofence" runat="server" class="WebControls" style="width: 175px;">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="font-weight: normal;">
                                    </td>
                                    <td  align="left" style="font-weight: normal;">
                                        <asp:CheckBox ID="chk_DeviceExpiryRule" Text="Is Device Expiry Rule Applicable" runat="server"
                                            onclick="chk_ExpiryRule_CheckedChange();" />
                                    </td>

                                     <td align="right" style="font-weight: bold;">
                                    Verification Type
                                </td>
                                <td>
                                    <asp:DropDownList ID="drp_VerificationType" runat="server" Width="175px">
                                        <asp:ListItem Value="0" Selected Text="Finger or Face or Card or Password"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Finger"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="User ID"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Password"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="Card"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="Finger or Password"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="Finger or Card"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="Card or Password"></asp:ListItem>
                                        <asp:ListItem Value="8" Text="User ID and Finger"></asp:ListItem>
                                        <asp:ListItem Value="9" Text="Finger and Password"></asp:ListItem>
                                        <asp:ListItem Value="10" Text="Card and Finger"></asp:ListItem>
                                        <asp:ListItem Value="11" Text="Card and Password"></asp:ListItem>
                                        <asp:ListItem Value="12" Text="Finger and Card and Password"></asp:ListItem>
                                        <asp:ListItem Value="13" Text="User ID and Finger and Password"></asp:ListItem>
                                        <asp:ListItem Value="14" Text="User ID and Finger or Card and Finger"></asp:ListItem>
                                        <asp:ListItem Value="15" Text="Face"></asp:ListItem>
                                        <asp:ListItem Value="16" Text="Face and Finger"></asp:ListItem>
                                        <asp:ListItem Value="17" Text="Face and Password"></asp:ListItem>
                                        <asp:ListItem Value="18" Text="Face and Card"></asp:ListItem>
                                        <asp:ListItem Value="19" Text="Face and Finger and Card"></asp:ListItem>
                                        <asp:ListItem Value="20" Text="Face and Finger and Password"></asp:ListItem>
                                        <asp:ListItem Value="25" Text="Palm"></asp:ListItem>
                                        <asp:ListItem Value="26" Text="Palm and Card"></asp:ListItem>
                                        <asp:ListItem Value="27" Text="Palm and Face"></asp:ListItem>
                                        <asp:ListItem Value="28" Text="Palm and Finger"></asp:ListItem>
                                        <asp:ListItem Value="29" Text="Palm and Finger and Face"></asp:ListItem>
                                        <asp:ListItem Value="200" Text="Other"></asp:ListItem>
                                        <asp:ListItem Value="-1" Text="Apply Group Mode"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                                </tr>
                                <tr>
                                    <td align="right" style="font-weight: normal;">
                                        Expiry Start Date
                                    </td>
                                    <td>
                                        <select id="drp_Startday" class="WebControls" runat="server" width="46px">
                                        </select>
                                        &nbsp;&nbsp;<select id="drp_Startmonth" class="WebControls" runat="server" enableviewstate="true"
                                            width="48px">
                                        </select>&nbsp;&nbsp;<select id="drp_StartYear" class="WebControls" runat="server"
                                            enableviewstate="true" width="69px">
                                        </select>
                                    </td>
                                    <td align="right" style="font-weight: normal;">
                                        Expiry End Date
                                    </td>
                                    <td>
                                        <select id="drp_Endday" class="WebControls" runat="server" width="46px">
                                        </select>
                                        &nbsp;&nbsp;<select id="drp_EndMonth" class="WebControls" runat="server" enableviewstate="true"
                                            width="48px">
                                        </select>&nbsp;&nbsp;<select id="drp_EndYear" class="WebControls" runat="server"
                                            enableviewstate="true" width="69px">
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <input id="btn_AddToDevice" type="button" style="font-size: 10px;" value="Add To All Devices"
                            onclick="javascript:btn_Save_onclick('AddToDevice');" />
                        &nbsp;
                        <input id="btn_DeleteFromDevice" type="button" style="font-size: 10px;" value="Delete From All Devices"
                            onclick="javascript:btn_Save_onclick('DeleteFromDevice');" />
                        <a href="#" runat="server" id="lnk_EmpDepartmentAndLoginAccessDetails" onserverclick="lnk_EmpDepartmentAndLoginAccessDetails_onserverclick">
                            Update Employee Login And Department Access Details</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick('Save');" />&nbsp;&nbsp;<input
                            id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout_Details();" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:HiddenField ID="Hdn_EmployeeId" runat="server" />
                        <asp:HiddenField ID="Hdn_EmployeeCode" runat="server" />
                        <asp:HiddenField ID="hdn_WhichDetails" runat="server" />
                        <asp:HiddenField ID="hdn_TypeOfSaveOperation" runat="server" />
                        <asp:HiddenField ID="hdn_EmployeePasword" runat="server" />
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" Text="&nbsp;&nbsp;&nbsp;&nbsp;"
                            ID="Lbl_InvalidError"></asp:Label>
                    </td>
                </tr>
            </table>
        </obout:Flyout>
        <obout:Flyout runat="server" ID="Flyout_OtherDetails" Align="left" Position="BOTTOM_left"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Employee Other Details</legend>
                            <table>
                                <tr>
                                    <td align="center" colspan="4">
                                        Employee Name:&nbsp;&nbsp;<asp:Label ID="lbl_EmpOtherName" runat="server" ForeColor="blue"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Fathers's Name
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_fatherName" runat="server" Width="175px"></asp:TextBox>
                                    </td>
                                    <td>
                                        Mothers's Name
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_MotherName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Contact No.
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_ContactNo" runat="server" Width="173px"></asp:TextBox>
                                    </td>
                                    <td>
                                        Blood Group
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_BloodGroup" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email Id
                                    </td>
                                    <td colspan="3" align="left">
                                        <asp:TextBox ID="txt_EmailId" Width="460px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Date&nbsp;of&nbsp;Birth
                                    </td>
                                    <td>
                                        <select id="drp_DOBDay" enabled="false" runat="server" enableviewstate="true" width="46px">
                                        </select>
                                        &nbsp;&nbsp;<select id="drp_DOBMonth" runat="server" enabled="false" enableviewstate="true"
                                            width="48px">
                                        </select>&nbsp;&nbsp;<select id="drp_DOBYear" runat="server" enabled="false" enableviewstate="true"
                                            width="69px">
                                        </select>
                                    </td>
                                    <td>
                                        Place of Birth
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_placeofBirth" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td>
                                        Nominee1
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_nominee1" runat="server" Width="173px"></asp:TextBox>
                                    </td>
                                    <td>
                                        Nominee2
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_nominee2" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Residence&nbsp;Address
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_ResidentailAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        Permanent&nbsp;Address
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_PermanentAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td>
                                        Marital&nbsp;Status
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_MaritalStatus" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Nationality
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_Nationality" runat="server"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        Overall&nbsp;Experience
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_OverallExperience" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Qualifications
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_Qualifications" runat="server" ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Reference&nbsp;Detail
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_ReferenceDetail" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Emergency&nbsp;Contact
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_EmergencyContact" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Remarks
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_Remarks" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        Passport&nbsp;No.
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_PassportNumber" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="lbl_InvalidError1"></asp:Label><input
                            id="btn_OtherUpdate" type="button" value="Update" onclick="javascript:btn_Save_onclick('Save');" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                                id="btn_OtherClose" type="button" value="Close" onclick="javascript:closeFlyout_OtherDetails();" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
        <obout:Flyout runat="server" ID="Flyout_BioDetails" Align="left" Position="BOTTOM_left"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Employee Biometrics Details</legend>
                            <table>
                                <tr style="border-bottom: black thin solid;">
                                    <td style="font-weight: bold;">
                                        Employee Code:<asp:Label ID="lbl_EmpCode" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee
                                            Name:<asp:Label ID="lbl_EmpName" runat="server"></asp:Label></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <fieldset>
                                            <legend>Employee Fingerprint, Face && RFID Card Details</legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        FP1
                                                    </td>
                                                    <td>
                                                        FP2
                                                    </td>
                                                    <td>
                                                        FP3
                                                    </td>
                                                    <td>
                                                        FP4
                                                    </td>
                                                    <td>
                                                        FP5
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_1" runat="server" Width="70" Height="70" />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_2" runat="server" Width="70" Height="70" />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_3" runat="server" Width="70" Height="70" />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_4" runat="server" Width="70" Height="70" />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_5" runat="server" Width="70" Height="70" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        FP6
                                                    </td>
                                                    <td>
                                                        FP7
                                                    </td>
                                                    <td>
                                                        FP8
                                                    </td>
                                                    <td>
                                                        FP9
                                                    </td>
                                                    <td>
                                                        FP10
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_6" runat="server" Width="70" Height="70" />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_7" runat="server" Width="70" Height="70" />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_8" runat="server" Width="70" Height="70" />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_9" runat="server" Width="70" Height="70" />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="pcbx_FID_10" runat="server" Width="70" Height="70" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        RFID Card #
                                                    </td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="txt_CardNo" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td colspan="2">
                                                        Group&nbsp;&nbsp;<select id="drp_Group" runat="server" width="43px"></select>&nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="btn_BioClear" runat="server" Text="Clear Fingerprint" />&nbsp;&nbsp;&nbsp;<asp:Button
                            ID="btn_BioSave" runat="server" Text="Save" />&nbsp;&nbsp;&nbsp;<input id="btn_BioClose"
                                type="button" value="Close" onclick="javascript:closeFlyout();" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
        <owd:Window ID="Wnd_UpdateWhcichEmpDetails" runat="server" IsModal="true" Height="120"
            Width="350" StyleFolder="~/Styles/mainwindow/blue" Title="Update Employee Details"
            VisibleOnLoad="false" ShowCloseButton="false" ShowStatusBar="False" Left="350"
            Top="155">
            <table class="rowEditTable" width="100%" height="100%">
                <tr>
                    <td>
                        <fieldset>
                            <legend id="UpdateEmpDetails">Employee Other Details</legend>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_UpdateDetailName" runat="server"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="drp_UpdateEmpDetails" runat="server" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:HiddenField ID="hdn_Departments" runat="server" />
                        <asp:HiddenField ID="hdn_Categories" runat="server" />
                        <asp:HiddenField ID="hdn_Grade" runat="server" />
                        <asp:HiddenField ID="hdn_Team" runat="server" />
                        <asp:HiddenField ID="hdn_Companies" runat="server" />
                        <asp:HiddenField ID="hdn_ShiftGroup" runat="server" />
                        <asp:HiddenField ID="hdn_Status" runat="server" />
                        <asp:HiddenField ID="hdn_Designation" runat="server" />
                        <asp:HiddenField ID="hdn_EmploymentType" runat="server" />
                        <asp:HiddenField ID="hdn_Locations" runat="server" />
                        <asp:HiddenField ID="hdn_DepartmentsIds" runat="server" />
                        <asp:HiddenField ID="hdn_CategoriesIds" runat="server" />
                        <asp:HiddenField ID="hdn_HolidayGroupsIds" runat="server" Value="-1,0,1,2,3,4,5" />
                        <asp:HiddenField ID="hdn_HolidayGroups" runat="server" Value="None,Holiday Group 1,Holiday Group 2,Holiday Group 3,Holiday Group 4,Holiday Group 5,Holiday Group 6" />
                        <asp:HiddenField ID="hdn_CompaniesIds" runat="server" />
                        <asp:HiddenField ID="hdn_ShiftGroupIds" runat="server" />
                        <asp:HiddenField ID="hdn_StatusIds" runat="server" />
                        <asp:HiddenField ID="hdn_DesignationIds" runat="server" />
                        <asp:HiddenField ID="hdn_EmploymentTypeIds" runat="server" />
                        <asp:HiddenField ID="hdn_LocationsIds" runat="server" />
                        <asp:HiddenField ID="Hdn_Action" runat="server" />
                        <asp:HiddenField ID="Hdn_ActionValue" runat="server" />
                        <asp:HiddenField ID="hdn_GeofencesIds" runat="server" />
                        <asp:HiddenField ID="hdn_Geofences" runat="server" />
                        <asp:HiddenField ID="hdn_SubDepartments" runat="server" />
                        <asp:HiddenField ID="hdn_SubDepartmentIds" runat="server" />
                        <asp:HiddenField ID="hdn_Divisions" runat="server" />
                        <asp:HiddenField ID="hdn_DivisionIds" runat="server" />

                        <asp:Label runat="server" ForeColor="Red" EnableViewState="False" ID="lbl_UpdateEmpDetailsError"></asp:Label>
                        <asp:Button ID="btn_UpdateSave1" runat="server" CssClass="WebControl" Text="Update"
                            OnClientClick="btn_UpdateSave();" />
                        &nbsp;<input id="btn_UpdateClose1" type="button" class="WebControl" value="Close"
                            onclick="Wnd_UpdateWhcichEmpDetails.Close();" />
                    </td>
                </tr>
            </table>
        </owd:Window>
        <owd:Window ID="Wnd_UpdateDetails" runat="server" IsModal="true" Height="120" Width="355"
            StyleFolder="~/Styles/mainwindow/blue" Title="Update Employee Details" VisibleOnLoad="false"
            ShowCloseButton="false" ShowStatusBar="False" Left="350" Top="155">
            <table class="rowEditTable" width="100%" height="100%">
                <tr>
                    <td>
                        <fieldset>
                            <legend id="Legend1">Employee Other Details</legend>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_UpdateEmpDetailName" runat="server" Text=""></asp:Label>
                                    </td>
                                    <td align="left">
                                        <obout:Combobox Validate="false" ID="cmb_UpdateDetailValue" CssClass="WebControls"
                                            runat="server" Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label runat="server" ForeColor="Red" EnableViewState="False" ID="lbl_UpdateDetails"></asp:Label>
                        <asp:Button ID="btn_UpdateSaveCombo" runat="server" Text="Update" OnClientClick="btn_UpdateSaveCombo();" />
                        &nbsp;&nbsp;<input id="btn_UpdateClose" type="button" value="Close" onclick="Wnd_UpdateDetails.Close();" />
                    </td>
                </tr>
            </table>
        </owd:Window>
        <owd:Window ID="Wnd_DeleteEmployees" runat="server" IsModal="true" Height="120" Width="355"
            StyleFolder="~/Styles/mainwindow/blue" Title="Delete Employees" VisibleOnLoad="false"
            ShowCloseButton="false" ShowStatusBar="False" Left="350" Top="155">
            <table class="rowEditTable" width="100%" height="100%">
                <tr>
                    <td>
                        <fieldset>
                            <legend id="Legend2">Delete Employees</legend>
                            <table>
                                <tr>
                                    <td align="left">
                                        Are you sure you want to delete selected employees?
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label runat="server" ForeColor="Red" EnableViewState="False" ID="lbl_DeleteEmployees"></asp:Label>
                        <asp:Button ID="btn_DeleteEmployees" runat="server" Text="Delete" />
                        &nbsp;&nbsp;<input id="btn_CloseDeleteEmployees" type="button" value="Close" onclick="Wnd_DeleteEmployees.Close();" />
                    </td>
                </tr>
            </table>
        </owd:Window>
        <owd:Window ID="wnd_LoginAndDepartmentAccesDeatils" runat="server" Height="330" StyleFolder="~/Styles/mainwindow/blue"
            Title="Employee Login And Department Access Details" Visible="false" Width="600"
            IsResizable="true" ShowStatusBar="false" Left="350" Top="155">
            <table width="100%" height="100%" cellpadding="1" class="rowEditTable" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td align="center">
                        <asp:Label ID="lbl_EmpDetails" Font-Bold="True" runat="server" Text="essl:essl"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td style="font-weight: bold;" align="right">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login Name
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_LoginName" runat="server" Width="195px"></asp:TextBox>
                                </td>
                                <td style="font-weight: bold;">
                                    Password
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Password" TextMode="Password" runat="server" Width="195px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" align="right" style="font-weight: bold;">
                                    <asp:CheckBox ID="chk_ReceiveNotification" runat="server" Text="Receive Notification" />&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Department Access
                                </td>
                                <td>
                                    <asp:ListBox ID="lst_AvailableField" runat="server" CssClass="WebControls" BorderStyle="Solid"
                                        BorderWidth="1px" SelectionMode="Multiple" Width="200px" Height="131px"></asp:ListBox>
                                </td>
                                <td>
                                    <table cellpadding="1">
                                        <tr>
                                            <td align="center">
                                                <input type="button" id="btn_next" runat="server" value=">" style="font-size: 11px;
                                                    font-family: Verdana; height: 20px; width: 50px" onclick="btn_next_onclick();" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <input type="button" id="btn_NextAll" runat="server" value=">>" style="font-size: 11px;
                                                    font-family: Verdana; height: 20px; width: 50px" onclick="NextAll();" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <input type="button" id="btn_Previous" runat="server" value="<" style="font-size: 11px;
                                                    font-family: Verdana; height: 20px; width: 50px" onclick="btn_previous_onclick();" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <input type="button" id="btn_PreviousAll" runat="server" value="<<" style="font-size: 11px;
                                                    font-family: Verdana; height: 20px; width: 50px" onclick="PreviousAll();" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <asp:ListBox ID="lst_exportToCsv" runat="server" CssClass="WebControls" BorderStyle="Solid"
                                        BorderWidth="1px" SelectionMode="Multiple" Width="200px" Height="131px"></asp:ListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btn_OK" runat="server" Text="Update" OnClientClick="GetSelectedItem();"
                            CssClass="WebControls" />&nbsp;&nbsp;
                        <input id="Button1" type="button" value="Close" onclick="wnd_LoginAndDepartmentAccesDeatils.Close();"
                            class="WebControls" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_LoginAndAccessError" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                            runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <asp:HiddenField ID="Hdn_ExportName" runat="server" />
                <asp:HiddenField ID="Hdn_SourceExportName" runat="server" />
                <asp:HiddenField ID="Hdn_ExportValueName" runat="server" />
                <asp:HiddenField ID="Hdn_SourceExportValueName" runat="server" />
            </table>
        </owd:Window>
    </div>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddEmployees") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditEmployees") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function GetDataItemValue(ByVal fieldname As String, ByVal Container As Obout.Grid.TemplateContainer) As String
            If Container.DataItem(fieldname) Is Nothing Then
                Return Container.DataItem(fieldname.ToUpper)
            End If
            Return Container.DataItem(fieldname)
        End Function
        
        Function ParseDateTime(ByVal DateValue As Date) As String
            Return DateValue.ToString("yyyy-MM-dd")
            
        End Function
        
        Function ParseDeviceExpiryDateTime(ByVal DateValue As String) As String
            Try
                If DateValue <> "" Then
                    Return CDate(DateValue).ToString("yyyy-MM-dd")
                Else
                    Return ""
                End If
               
            Catch ex As Exception
                Return ""
            End Try
            
        End Function
        
        Function ConvertToBase64string(ByVal pic As Byte()) As String
            Try
                Return System.Convert.ToBase64String(pic)
            Catch ex As Exception

            End Try
            Return ""
        End Function
        
    </script>
    <script type="text/javascript">
        document.getElementById("ob_cmb_UpdateDetailValueContainer").style.zIndex = "99999";
        document.getElementById("ob_drp_DesignationContainer").style.zIndex = "99999";
        document.getElementById("ob_drp_LocationContainer").style.zIndex = "99999";
        document.getElementById("ob_drp_EmploymentTypeContainer").style.zIndex = "99999";
        document.getElementById("ob_drp_GradeContainer").style.zIndex = "99999";
        document.getElementById("ob_drp_TeamContainer").style.zIndex = "99999";
        document.getElementById("ob_drp_SubDepartmentContainer").style.zIndex = "99999";
        document.getElementById("ob_drp_DivisionContainer").style.zIndex = "99999";
        
        
    </script>
    <script type="text/javascript">
    
    function LoadMultipleEmployeeViewState()
    {
         var Action=document.getElementById("<%=Hdn_Action.ClientID %>").value;
         if (Action=='Delete Employees')
         {
     
         }
         else
         {
            if(Action=='Update Department' || Action=='Update Category'  || Action=='Update Company'  || Action=='Update Status'   || Action=='Update HolidayGroup' || Action=='Update ShiftGroup' )
            {
            LoadValueForMultipleEmployeeUpdate();
            }
            else
            {
            LoadValueForMultipleEmployeeDesignationOrLocationOrEmploymentTypeUpdate();
            }
         }
    }
    
    function LoadValueForMultipleEmployeeUpdate()
    {
                var StrValue;
		        var StrIds;
		        var Action=document.getElementById("<%=Hdn_Action.ClientID %>").value;
		        document.getElementById("<%=drp_UpdateEmpDetails.ClientID %>").options.length = 0;
		        if(Action=='Update Department')
		        {
		            StrValue=document.getElementById("<%=hdn_Departments.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_DepartmentsIds.ClientID %>").value;
		            document.getElementById("UpdateEmpDetails").innerHTML='Update Employee Department';
		            document.getElementById("<%=lbl_UpdateDetailName.ClientID %>").innerHTML='Department Name';
		        }
		        else if(Action=='Update Category')
		        {
		            StrValue=document.getElementById("<%=hdn_Categories.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_CategoriesIds.ClientID %>").value;
		            document.getElementById("UpdateEmpDetails").innerHTML='Update Employee Category';
		            document.getElementById("<%=lbl_UpdateDetailName.ClientID %>").innerHTML='Category Name';
		        }
		        else if(Action=='Update Company')
		        {
		            StrValue=document.getElementById("<%=hdn_Companies.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_CompaniesIds.ClientID %>").value;
		            document.getElementById("UpdateEmpDetails").innerHTML='Update Employee Company';
		            document.getElementById("<%=lbl_UpdateDetailName.ClientID %>").innerHTML='Company Name';
		        }
		        
		        else if(Action=='Update ShiftGroup')
		        {
		            StrValue=document.getElementById("<%=hdn_ShiftGroup.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_ShiftGroupIds.ClientID %>").value;
		            document.getElementById("UpdateEmpDetails").innerHTML='Update Employee ShiftGroup';
		            document.getElementById("<%=lbl_UpdateDetailName.ClientID %>").innerHTML='ShiftGroup';
		        }
		        
		        else if(Action=='Update HolidayGroup')
		        {
		            StrValue=document.getElementById("<%=hdn_HolidayGroups.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_HolidayGroupsIds.ClientID %>").value;
		            document.getElementById("UpdateEmpDetails").innerHTML='Update Employee HolidayGroup';
		            document.getElementById("<%=lbl_UpdateDetailName.ClientID %>").innerHTML='HolidayGroup Name';
		        }
		        
		        
		        else if(Action=='Update Status')
		        {
		            StrValue=document.getElementById("<%=hdn_Status.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_Status.ClientID %>").value;
		            document.getElementById("UpdateEmpDetails").innerHTML='Update Employee Status';
		            document.getElementById("<%=lbl_UpdateDetailName.ClientID %>").innerHTML='Status Name';
		        }
		        
		        else if(Action=='Update HolidayGroup')
		        {
		            StrValue=document.getElementById("<%=hdn_HolidayGroups.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_HolidayGroupsIds.ClientID %>").value;
		            document.getElementById("UpdateEmpDetails").innerHTML='Update Employee HolidayGroup';
		            document.getElementById("<%=lbl_UpdateDetailName.ClientID %>").innerHTML='HolidayGroup';
		        }
		        
		        else if(Action=='Update ShiftGroup')
		        {
		            StrValue=document.getElementById("<%=hdn_ShiftGroup.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_ShiftGroupIds.ClientID %>").value;
		            document.getElementById("UpdateEmpDetails").innerHTML='Update Employee ShiftGroup';
		            document.getElementById("<%=lbl_UpdateDetailName.ClientID %>").innerHTML='ShiftGroup';
		        }
		        		        
		        
		        var ValueArray=new Array();
		        ValueArray=StrValue.split(',');
		        var IdArray=new Array();
		        IdArray=StrIds.split(',');
		        for(var i=0;i<IdArray.length;i++)
		        {
		            var Options=document.createElement("OPTION");
		            Options.text = ValueArray[i];
                    Options.value = IdArray[i];
                    document.getElementById("<%=drp_UpdateEmpDetails.ClientID %>").options.add(Options);
		        }
		        if(document.getElementById("<%=Hdn_ActionValue.ClientID %>").value!="")
		        {
		        document.getElementById("<%=drp_UpdateEmpDetails.ClientID %>").value=document.getElementById("<%=Hdn_ActionValue.ClientID %>").value;
		        }
		        document.getElementById("<%=Hdn_ActionValue.ClientID %>").value='';
    }
		    function LoadValueInDrp(Action)
		    {
              if (Action=='Delete Employees')
              {
                Wnd_DeleteEmployees.Open();
              }
              else
              {
		        document.getElementById("ob_cmb_UpdateDetailValueTextbox").value='';
		        document.getElementById("<%=lbl_UpdateEmpDetailsError.ClientID %>").innerHTML='';
		        document.getElementById("<%=lbl_UpdateDetails.ClientID %>").innerHTML='';
		        document.getElementById("<%=Hdn_Action.ClientID %>").value=Action;
		        LoadValueForMultipleEmployeeUpdate();
		        Wnd_UpdateWhcichEmpDetails.Open();
              }
		    }
		    
		    function LoadValueInCombo(Action)
		    {
		        document.getElementById("ob_cmb_UpdateDetailValueTextbox").value='';
		        document.getElementById("<%=lbl_UpdateEmpDetailsError.ClientID %>").innerHTML='';
		        document.getElementById("<%=lbl_UpdateDetails.ClientID %>").innerHTML='';
		        document.getElementById("<%=Hdn_Action.ClientID %>").value=Action;
		        LoadValueForMultipleEmployeeDesignationOrLocationOrEmploymentTypeUpdate();
		        Wnd_UpdateDetails.Open();
		    }
		    
		    function LoadValueForMultipleEmployeeDesignationOrLocationOrEmploymentTypeUpdate()
		    {
		        var StrValue;
		        var StrIds;
		        var Action=document.getElementById("<%=Hdn_Action.ClientID %>").value;
		        cmb_UpdateDetailValue.clearOptions();
		        
		        if(Action=='Update Designation')
		        {
		            StrValue=document.getElementById("<%=hdn_Designation.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_Designation.ClientID %>").value;
		            document.getElementById("Legend1").innerHTML='Update Employee Designation';
		            document.getElementById("<%=lbl_UpdateEmpDetailName.ClientID %>").innerHTML='Designation Name';
		            
		            
		        }
		        else if(Action=='Update Location')
		        {
		            StrValue=document.getElementById("<%=hdn_Locations.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_Locations.ClientID %>").value;
		            document.getElementById("Legend1").innerHTML='Update Employee Location';
		            document.getElementById("<%=lbl_UpdateEmpDetailName.ClientID %>").innerHTML='Location Name';
		            
		            
		        }
		        else if(Action=='Update EmployementType')
		        {
		            StrValue=document.getElementById("<%=hdn_EmploymentType.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_EmploymentType.ClientID %>").value;
		            document.getElementById("Legend1").innerHTML='Update Employee EmploymentType';
		            document.getElementById("<%=lbl_UpdateEmpDetailName.ClientID %>").innerHTML='EmploymentType';
		        }
		        
		        
		        else if(Action=='Update Grade')
		        {
		            StrValue=document.getElementById("<%=hdn_Grade.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_Grade.ClientID %>").value;
		            document.getElementById("Legend1").innerHTML='Update Employee Grade';
		            document.getElementById("<%=lbl_UpdateEmpDetailName.ClientID %>").innerHTML='Grade';
		        }
		        
		        else if(Action=='Update Team')
		        {
		            StrValue=document.getElementById("<%=hdn_Team.ClientID %>").value;
		            StrIds=document.getElementById("<%=hdn_Team.ClientID %>").value;
		            document.getElementById("Legend1").innerHTML='Update Employee Team';
		            document.getElementById("<%=lbl_UpdateEmpDetailName.ClientID %>").innerHTML='Team';
		        }
		        
		        
                var ValueArray=new Array();
		        ValueArray=StrValue.split(',');
		        for(var i=0;i<ValueArray.length;i++)
		            {
		                    cmb_UpdateDetailValue.addOption(ValueArray[i], ValueArray[i]);   
		            }
		    }
		    
		    function chk_ExpiryRule_CheckedChange()
		    {
		        var Sender=document.getElementById("<%=chk_DeviceExpiryRule.ClientID%>");
		        if(Sender.checked)
		            {
		                document.getElementById("<%=drp_Startday.ClientID%>").disabled = false;
                        document.getElementById("<%=drp_Startmonth.ClientID%>").disabled = false;
                        document.getElementById("<%=drp_StartYear.ClientID%>").disabled = false;
                        document.getElementById("<%=drp_Endday.ClientID%>").disabled = false;
                        document.getElementById("<%=drp_EndMonth.ClientID%>").disabled = false;
                        document.getElementById("<%=drp_EndYear.ClientID%>").disabled = false;
		            }
		        else
		            {
		                  document.getElementById("<%=drp_Startday.ClientID%>").disabled = true;
                          document.getElementById("<%=drp_Startmonth.ClientID%>").disabled = true;
                          document.getElementById("<%=drp_StartYear.ClientID%>").disabled = true;
                          document.getElementById("<%=drp_Endday.ClientID%>").disabled = true;
                          document.getElementById("<%=drp_EndMonth.ClientID%>").disabled = true;
                          document.getElementById("<%=drp_EndYear.ClientID%>").disabled = true;
		            }    
		    }
		    
		     function btn_UpdateSave()
		        {
		            document.getElementById("<%=Hdn_ActionValue.ClientID %>").value=document.getElementById("<%=drp_UpdateEmpDetails.ClientID %>").value ;
		        }
		        
		        function btn_UpdateSaveCombo()
		        {
		            document.getElementById("<%=Hdn_ActionValue.ClientID %>").value=document.getElementById("ob_cmb_UpdateDetailValueTextbox").value;
		        }
    
		    
		    function populateEditControls(iRecordIndex) 
		    {	
		        document.getElementById("<%=lnk_EmpDepartmentAndLoginAccessDetails.ClientID %>").style.display='Inline';
		        document.getElementById("btn_AddToDevice").style.display='Inline';
		        document.getElementById("btn_DeleteFromDevice").style.display='Inline';
		        document.getElementById( "<%=lbl_EmpOtherName.ClientID %>").innerHTML = Dg_Employee.Rows[iRecordIndex].Cells[2].Value+' : '+Dg_Employee.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=Hdn_EmployeeId.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[0].Value;
		        document.getElementById("<%=txt_Employeecode.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=txt_employeeName.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[2].Value;
		        document.getElementById("<%=drp_company.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[10].Value;
		        document.getElementById("<%=drp_ShiftGroup.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[33].Value;
		        document.getElementById("<%=drp_ShiftRoster.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[34].Value;
		        document.getElementById("<%=drp_department.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[11].Value;
		        document.getElementById("ob_drp_EmploymentTypeTextbox").value=Dg_Employee.Rows[iRecordIndex].Cells[9].Value;
		        document.getElementById("ob_drp_DesignationTextbox").value=Dg_Employee.Rows[iRecordIndex].Cells[5].Value;
		        document.getElementById("ob_drp_LocationTextbox").value=Dg_Employee.Rows[iRecordIndex].Cells[6].Value;
		        document.getElementById("ob_drp_GradeTextbox").value=Dg_Employee.Rows[iRecordIndex].Cells[30].Value;
		        document.getElementById("ob_drp_TeamTextbox").value=Dg_Employee.Rows[iRecordIndex].Cells[31].Value;
		        document.getElementById("<%=drp_HolidayGroup.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[32].Value;
		        document.getElementById("<%=drp_department.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[11].Value;
		        document.getElementById("<%=drp_status.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[8].Value;
		        document.getElementById("<%=drp_category.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[12].Value;
		        document.getElementById( "<%=txt_DeviceCode.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[24].Value;
		        document.getElementById( "<%=txt_AadhaarNumber.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[35].Value;
                document.getElementById("<%=txt_RFIDCardnumber.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[45].Value;
                document.getElementById("<%=drp_Geofence.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[57].Value;
                document.getElementById("<%=drp_VerificationType.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[67].Value;

                document.getElementById("ob_drp_SubDepartmentTextbox").value=Dg_Employee.Rows[iRecordIndex].Cells[65].Value;
                document.getElementById("ob_drp_DivisionTextbox").value=Dg_Employee.Rows[iRecordIndex].Cells[66].Value;

                SetValueInDropDown(document.getElementById('<%=drp_DOJDay.ClientID %>'),document.getElementById('<%=drp_DOJmonth.ClientID %>'),document.getElementById('<%=drp_DOJYear.ClientID %>'),Dg_Employee.Rows[iRecordIndex].Cells[26].Value);
                SetValueInDropDown(document.getElementById('<%=drp_DOCDay.ClientID %>'),document.getElementById('<%=drp_DOCmonth.ClientID %>'),document.getElementById('<%=drp_DOCYear.ClientID %>'),Dg_Employee.Rows[iRecordIndex].Cells[27].Value);
                SetValueInDropDown(document.getElementById('<%=drp_DORDay.ClientID %>'),document.getElementById('<%=drp_DORmonth.ClientID %>'),document.getElementById('<%=drp_DORYear.ClientID %>'),Dg_Employee.Rows[iRecordIndex].Cells[28].Value);
                SetValueInDropDown(document.getElementById('<%=drp_DOBDay.ClientID %>'),document.getElementById('<%=drp_DOBmonth.ClientID %>'),document.getElementById('<%=drp_DOBYear.ClientID %>'),Dg_Employee.Rows[iRecordIndex].Cells[13].Value);
		        drp_JobStatus_OnChange();
		        //Other Details
		        
		        document.getElementById("<%=txt_fatherName.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[14].Value;
		        document.getElementById("<%=txt_MotherName.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[15].Value;
		        document.getElementById("<%=txt_ContactNo.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[17].Value;
		        document.getElementById("<%=txt_EmailId.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[18].Value;
		        document.getElementById("<%=txt_placeofBirth.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[19].Value;
		        document.getElementById("<%=txt_nominee1.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[20].Value;
		        document.getElementById("<%=txt_nominee2.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[21].Value;
		        document.getElementById("<%=txt_ResidentailAddress.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[16].Value.replace(/<BR>/gi,'\n');;
		        document.getElementById("<%=txt_PermanentAddress.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[22].Value.replace(/<BR>/gi,'\n');;
		        document.getElementById("<%=txt_BloodGroup.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[29].Value;
		        document.getElementById("<%=txt_Remarks.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[23].Value.replace(/<BR>/gi,'\n');

                document.getElementById("<%=txt_MaritalStatus.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[58].Value;
                document.getElementById("<%=txt_Nationality.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[59].Value;
                document.getElementById("<%=txt_PassportNumber.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[60].Value;
                document.getElementById("<%=txt_OverallExperience.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[61].Value;
                document.getElementById("<%=txt_Qualifications.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[62].Value;
                document.getElementById("<%=txt_ReferenceDetail.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[63].Value;
                document.getElementById("<%=txt_EmergencyContact.ClientID %>").value = Dg_Employee.Rows[iRecordIndex].Cells[64].Value;

		        
		        var Gender=Dg_Employee.Rows[iRecordIndex].Cells[25].Value;
		        if(Gender.toLowerCase()=='male')
		        document.getElementById("Flyout_Details_rbtn_Sex_0").checked=true;
		        else
		        document.getElementById("Flyout_Details_rbtn_Sex_1").checked=true;

                var ExpiryValue= Dg_Employee.Rows[iRecordIndex].Cells[52].Value;
                if (ExpiryValue=="1")
                {

                 document.getElementById("<%=chk_DeviceExpiryRule.ClientID%>").checked=true;
                 chk_ExpiryRule_CheckedChange();

                 SetValueInDropDown(document.getElementById("<%=drp_Startday.ClientID%>"),document.getElementById("<%=drp_Startmonth.ClientID%>"),document.getElementById("<%=drp_StartYear.ClientID%>"),Dg_Employee.Rows[iRecordIndex].Cells[55].Value); 
                 SetValueInDropDown(document.getElementById("<%=drp_Endday.ClientID%>"),document.getElementById("<%=drp_EndMonth.ClientID%>"),document.getElementById("<%=drp_EndYear.ClientID%>"),Dg_Employee.Rows[iRecordIndex].Cells[56].Value); 
                }
                else
                {
                  document.getElementById("<%=chk_DeviceExpiryRule.ClientID%>").checked=false;
                  chk_ExpiryRule_CheckedChange();
                }

		   }
		   
		   
		     function btn_Save_onclick(OperationType)
		     {
		        document.getElementById("<%=hdn_TypeOfSaveOperation.ClientID %>").value=OperationType;
		        var oRecord = new Object();
		        oRecord.EmployeeId =document.getElementById("<%=Hdn_EmployeeId.ClientID %>").value ;
		        oRecord.EmploymentType=document.getElementById("ob_drp_EmploymentTypeTextbox").value;
		        oRecord.Designation=document.getElementById("ob_drp_DesignationTextbox").value;
		        oRecord.Location=document.getElementById("ob_drp_LocationTextbox").value;
		        oRecord.Grade=document.getElementById("ob_drp_GradeTextbox").value;
		        oRecord.Team=document.getElementById("ob_drp_TeamTextbox").value;
                oRecord.SubDepartment=document.getElementById("ob_drp_SubDepartmentTextbox").value;
                oRecord.Division=document.getElementById("ob_drp_DivisionTextbox").value;
		        if(document.getElementById("Flyout_Details_rbtn_Sex_0").checked)
		        oRecord.Gender='Male';
		        else
		        oRecord.Gender='Female';
		        oRecord.Error='';
		        
		        Dg_Employee.executeInsert(oRecord);
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
		    
		    
		    
		    
            function clearFlyout_Details() 
            {
		        document.getElementById("<%=lnk_EmpDepartmentAndLoginAccessDetails.ClientID %>").style.display='None';
		        document.getElementById("btn_AddToDevice").style.display='None';
		        document.getElementById("btn_DeleteFromDevice").style.display='None';
                document.getElementById("<%=Hdn_EmployeeId.ClientID %>").value = '0';
		        document.getElementById("<%=txt_Employeecode.ClientID %>").value = '';
		        document.getElementById("<%=txt_employeeName.ClientID %>").value = '';
		        document.getElementById("<%=drp_company.ClientID %>").selectedIndex = 0;
		        document.getElementById("<%=drp_ShiftGroup.ClientID %>").selectedIndex = 0;
		        document.getElementById("<%=drp_department.ClientID %>").selectedIndex = 0;
		        document.getElementById("ob_drp_EmploymentTypeTextbox").value='';
		        document.getElementById("ob_drp_DesignationTextbox").value='';
		        document.getElementById("ob_drp_LocationTextbox").value='';
		        document.getElementById("ob_drp_GradeTextbox").value='';
		        document.getElementById("ob_drp_TeamTextbox").value='';
		        document.getElementById("<%=drp_status.ClientID %>").selectedIndex = 0;
		        drp_JobStatus_OnChange();
		        document.getElementById("<%=drp_category.ClientID %>").selectedIndex = 0;
		        document.getElementById( "<%=txt_DeviceCode.ClientID %>").value = '';
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		        document.getElementById( "<%=txt_AadhaarNumber.ClientID %>").value = '';
                 document.getElementById("<%=txt_RFIDCardnumber.ClientID %>").value='';
                 document.getElementById("<%=drp_Geofence.ClientID %>").selectedIndex = 0;
                 document.getElementById("<%=drp_VerificationType.ClientID %>").selectedIndex = 0;

                  document.getElementById("ob_drp_SubDepartmentTextbox").value='';
                   document.getElementById("ob_drp_DivisionTextbox").value='';
              

                 var lenn;
		        var now=new Date();
                var NowDay=now.getDate();
                lenn=NowDay.toString().length;
                 if(lenn==1)
                 {
                  NowDay='0' + NowDay;
                 }
		         var NowMonth=now.getMonth()+1;
                 lenn=NowMonth.toString().length;
                 if(lenn==1)
                 {
                  NowMonth='0' + NowMonth;
                 }
		        var NowYear=now.getFullYear();
		        var value=NowYear+'-'+NowMonth + "-" + NowDay;
		       
                SetValueInDropDown(document.getElementById('<%=drp_DOJDay.ClientID %>'),document.getElementById('<%=drp_DOJmonth.ClientID %>'),document.getElementById('<%=drp_DOJYear.ClientID %>'),value);
                SetValueInDropDown(document.getElementById('<%=drp_DOCDay.ClientID %>'),document.getElementById('<%=drp_DOCmonth.ClientID %>'),document.getElementById('<%=drp_DOCYear.ClientID %>'),value);
                SetValueInDropDown(document.getElementById('<%=drp_DORDay.ClientID %>'),document.getElementById('<%=drp_DORmonth.ClientID %>'),document.getElementById('<%=drp_DORYear.ClientID %>'),value);


                var value1='2000'+'-'+'01' + "-" + '01';
                var value2='2025'+'-'+'01' + "-" + '01';
                SetValueInDropDown(document.getElementById("<%=drp_Startday.ClientID%>"),document.getElementById("<%=drp_Startmonth.ClientID%>"),document.getElementById("<%=drp_StartYear.ClientID%>"),value1); 
                SetValueInDropDown(document.getElementById("<%=drp_Endday.ClientID%>"),document.getElementById("<%=drp_EndMonth.ClientID%>"),document.getElementById("<%=drp_EndYear.ClientID%>"),value2); 
		    }
		    
		    function clearFlyout_OtherDetails() 
            {
                document.getElementById("<%=txt_fatherName.ClientID %>").value = '';
		        document.getElementById("<%=txt_MotherName.ClientID %>").value = '';
		        document.getElementById("<%=txt_ContactNo.ClientID %>").value = '';
		        document.getElementById("<%=txt_EmailId.ClientID %>").value = '';
		        document.getElementById("<%=txt_placeofBirth.ClientID %>").value = '';
		        document.getElementById("<%=txt_nominee1.ClientID %>").value = '';
		        document.getElementById("<%=txt_nominee2.ClientID %>").value = '';
		        document.getElementById("<%=txt_ResidentailAddress.ClientID %>").value = '';
		        document.getElementById("<%=txt_PermanentAddress.ClientID %>").value = '';
		        document.getElementById("<%=txt_Remarks.ClientID %>").value = '';
		        document.getElementById("<%=Lbl_InvalidError1.ClientID %>").innerHTML ='';
		        document.getElementById("<%=drp_HolidayGroup.ClientID %>").value = '-1';
                 document.getElementById( "<%=txt_MaritalStatus.ClientID %>").value = '';
                 document.getElementById( "<%=txt_Nationality.ClientID %>").value = '';
                 document.getElementById( "<%=txt_OverallExperience.ClientID %>").value = '';
                 document.getElementById( "<%=txt_Qualifications.ClientID %>").value = '';
                 document.getElementById( "<%=txt_ReferenceDetail.ClientID %>").value = '';
                 document.getElementById( "<%=txt_EmergencyContact.ClientID %>").value = '';
                 document.getElementById( "<%=txt_PassportNumber.ClientID %>").value = '';
		        var now=new Date();
                var NowDay=now.getDate();
		        var NowMonth=now.getMonth()+1;
		        var NowYear=now.getFullYear();
		        var Date1=NowYear+'-'+NowMonth + "-" + NowDay;
                SetValueInDropDown(document.getElementById('<%=drp_DOBDay.ClientID %>'),document.getElementById('<%=drp_DOBmonth.ClientID %>'),document.getElementById('<%=drp_DOBYear.ClientID %>'),Date1);
		    }
		    
		    
		     function attachFlyout_DetailsToLink(oLink,Action)
		     {	
		     try 
		     {
		        closeFlyout_Details();
		        closeFlyout_OtherDetails();	
               document.getElementById("<%=hdn_WhichDetails.ClientID %>").value = 'Details';
		       <%=Flyout_Details.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_Details.getClientID()%>.Open();
		        clearFlyout_Details();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
            catch(ex){}
		    }
		    
		     function attachFlyout_OtherDetailsToLink(oLink,Action)
		     {	
		        closeFlyout_Details();
		        closeFlyout_OtherDetails();
                document.getElementById("<%=hdn_WhichDetails.ClientID %>").value = 'OtherDetails';
		       <%=Flyout_OtherDetails.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_OtherDetails.getClientID()%>.Open();
		        clearFlyout_OtherDetails();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
             }
		    
		function closeFlyout_Details() 
		    {
		        <%=Flyout_Details.getClientID()%>.Close();
		    }
		    
		    function closeFlyout_OtherDetails() 
		    {
		        <%=Flyout_OtherDetails.getClientID()%>.Close();
		    }
		    
		    
		     function drp_JobStatus_OnChange()
		     {
                                    
		            var JobStatus=document.getElementById("<%=drp_status.ClientId %>").value;
		                if(JobStatus=='Working')
		                    {
		                        document.getElementById('<%=drp_DORYear.ClientID %>').disabled=true; 
		                        document.getElementById('<%=drp_DORmonth.ClientID %>').disabled=true; 
		                        document.getElementById('<%=drp_DORDay.ClientID %>').disabled=true; 
		                    }
		                else
		                    {
		                       document.getElementById('<%=drp_DORYear.ClientID %>').disabled=false; 
		                       document.getElementById('<%=drp_DORmonth.ClientID %>').disabled=false; 
		                       document.getElementById('<%=drp_DORDay.ClientID %>').disabled=false; 
		                       
		                       var now=new Date();
		                       var year=now.getFullYear();
		                       var month=now.getMonth()+1;
		                       var day=now.getDate();
		                       var Date1=month+'/'+day+'/'+year;
		                    }    
		    }
		    
    </script>
    <script type="text/javascript">

        // ONLY NEXT BUTTON ON CLICK 

        function btn_next_onclick() {

            var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");
            var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");
            var i = 0
            for (var j = 0; j < ListViewObject.options.length; j++) {
                if (ListViewObject.options[j].selected) {
                    var Options = document.createElement("OPTION");
                    ListExportObject.add(new Option(ListViewObject.options[j].text, ListViewObject.options[j].value));
                    i = i + 1
                }
            }
            removeOptionSelected(ListViewObject)
        }


        // NEXT ALL BUTTON ONCLICK      

        function NextAll() {

            var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");
            var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");

            for (var j = 0; j < ListViewObject.options.length; j++) {

                ListExportObject.add(new Option(ListViewObject.options[j].text, ListViewObject.options[j].value));
            }
            removeAllOption(ListViewObject);

        }

        function GetSelectedItem() {

            document.getElementById("<%=Hdn_ExportName.ClientID %>").value = '';
            document.getElementById("<%=Hdn_ExportValueName.ClientID %>").value = '';
            document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value = '';
            document.getElementById("<%=Hdn_SourceExportValueName.ClientID %>").value = '';

            var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");
            var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");



            for (var j = 0; j < ListExportObject.options.length; j++) {
                document.getElementById("<%=Hdn_ExportName.ClientID %>").value = document.getElementById("<%=Hdn_ExportName.ClientID %>").value + ListExportObject.options[j].text + ',';
                document.getElementById("<%=Hdn_ExportValueName.ClientID %>").value = document.getElementById("<%=Hdn_ExportValueName.ClientID %>").value + ListExportObject.options[j].value + ',';
            }

            for (var k = 0; k < ListViewObject.options.length; k++) {
                document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value = document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value + ListViewObject.options[k].text + ',';
                document.getElementById("<%=Hdn_SourceExportValueName.ClientID %>").value = document.getElementById("<%=Hdn_SourceExportValueName.ClientID %>").value + ListViewObject.options[k].value + ',';
            }

        }




        // REMOVE SELECTED OPTIONS         
        function removeOptionSelected(object) {
            var k;
            for (k = object.length - 1; k >= 0; k--) {
                if (object.options[k].selected) {
                    object.remove(k);
                }
            }
        }

        //REMOVE ALL OPTIONS           
        function removeAllOption(object) {
            var k;
            for (k = object.length - 1; k >= 0; k--) {
                object.remove(k);
            }
        }



        // PREVIOUS BUTTON ON CLICK


        function btn_previous_onclick() {

            var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");
            var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");
            var i = 0
            for (var j = 0; j < ListExportObject.options.length; j++) {
                if (ListExportObject.options[j].selected) {
                    ListViewObject.add(new Option(ListExportObject.options[j].text, ListExportObject.options[j].value));
                    i = i + 1
                }
            }
            removeOptionSelected(ListExportObject)

        }



        // PREVIOUS ALL BUTTON ONCLICK      

        function PreviousAll() {
            var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");
            var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");

            for (var j = 0; j < ListExportObject.options.length; j++) {
                ListViewObject.add(new Option(ListExportObject.options[j].text, ListExportObject.options[j].value));
            }
            removeAllOption(ListExportObject);
        }
            
    </script>
    </form>
</body>
</html>
