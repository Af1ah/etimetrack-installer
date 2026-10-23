<%@ page language="VB" autoeventwireup="false" inherits="Main, App_Web_wdniqpox" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Splitter2_Net" Namespace="OboutInc.Splitter2" TagPrefix="obspl" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>eTimeTrack Server Online</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        
    </script>
</head>
<body onload="javascript:SelectMenuItem('WorkerPage.aspx');" style="margin: 0; padding: 0;
    height: 100%; width: 100%; overflow: hidden;">
    <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0" style="">
        <tr style="font-size: 0;">
            <td style="width: 403px; height: 85px;">
                <img alt="Logo" src="images/logo.gif" border="0" />
            </td>
            <td align="right" width="100%">
                <img alt="Top Header Image" src="images/tophimg.gif" border="0" />

                <table style=" width:300px; position: absolute;  top: 57px;  right: 0px; color:Navy; font-size:15px; font-weight:bold; " >
                
                <tr style="width:100%; text-align:right;">
                
                <td >Login:&nbsp;<asp:Label ID="lblLogin" runat="server" Text=""></asp:Label>&nbsp;</td></tr></table>

            </td>
        </tr>
        <tr style="background-image: url(Images/mid.gif); background-repeat: repeat-x;">
            <td colspan="2">
                <oem:EasyMenu ID="EasymenuMain" IconsFolder="MenuIcons" UseIcons="true" runat="server"
                    ShowEvent="Always" StyleFolder="styles/EasyMenu/Styles/horizontal1" Position="Horizontal"
                    CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" IconsPosition="Left">
                    <CSSClassesCollection>
                        <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
                            ComponentContentCell="ParentItemContentCell" Component="ParentItem" ComponentSubMenuCell="ParentItemSubMenuCell"
                            ComponentIconCellOver="ParentItemIconCellOver" ComponentIconCell="ParentItemIconCell"
                            ComponentOver="ParentItemOver" ComponentContentCellOver="ParentItemContentCellOver">
                        </oem:CSSClasses>
                        <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver"
                            ComponentContentCell="ParentSeparatorContentCell" Component="ParentSeparator"
                            ComponentSubMenuCell="ParentSeparatorSubMenuCell" ComponentIconCellOver="ParentSeparatorIconCellOver"
                            ComponentIconCell="ParentSeparatorIconCell" ComponentOver="ParentSeparatorOver"
                            ComponentContentCellOver="ParentSeparatorContentCellOver"></oem:CSSClasses>
                    </CSSClassesCollection>
                    <Components>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator1">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('WorkerPage.aspx');" InnerHtml="&nbsp;Dashboard&nbsp;"
                            ID="MenuItem98">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator1">
                        </oem:MenuSeparator>
                        <oem:MenuItem InnerHtml="&nbsp;Masters&nbsp;" ID="Manage">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator2">
                        </oem:MenuSeparator>
                        <oem:MenuItem InnerHtml="&nbsp;Device Management&nbsp;" ID="DeviceManagement">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator27">
                        </oem:MenuSeparator>
                        <oem:MenuItem ID="Utilities" runat="server" InnerHtml="&nbsp;Utilities&nbsp;">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator4">
                        </oem:MenuSeparator>
                        <oem:MenuItem InnerHtml="&nbsp;Reports&nbsp;" ID="Reports">
                        </oem:MenuItem>
                                              
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator8">
                        </oem:MenuSeparator>
                        <oem:MenuItem runat="server" InnerHtml="&nbsp;Pay Roll&nbsp;" ID="PayRoll">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator26">
                        </oem:MenuSeparator>
                        <oem:MenuItem runat="server" InnerHtml="&nbsp;Canteen&nbsp;" ID="Canteen">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator5">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Admin/Users.aspx');" InnerHtml="&nbsp;System User&nbsp;"
                            ID="Admin_SystemUser">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator7">
                        </oem:MenuSeparator>
                        <oem:MenuItem InnerHtml="&nbsp;Audit Logs&nbsp;" ID="Admin_AuditLogs">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparatorDB2">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Admin/DatabaseSettings.aspx');"
                            InnerHtml="&nbsp;Database Settings&nbsp;" ID="MenuItemDB2">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator6">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Admin/ChangePassword.aspx');"
                            InnerHtml="&nbsp;Change Password&nbsp;" ID="Admin_ChangePassword">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator28">
                        </oem:MenuSeparator>
                        <oem:MenuItem InnerHtml="&nbsp;About&nbsp;" ID="About">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator2">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="window.parent.location.href='LogOut.aspx'" InnerHtml="&nbsp;Log Off&nbsp;&nbsp;&nbsp;"
                            ID="LogOff1">
                        </oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator3">
                        </oem:MenuSeparator>
                    </Components>
                </oem:EasyMenu>
                <!--// The menus //-->
                <oem:EasyMenu ID="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="Manage"
                    UseIcons="true" IconsFolder="MenuIcons" IconsPosition="Left" Align="Under" OffsetVertical="-2"
                    Width="210" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/Companies.aspx');"
                            Icon="a_c.gif" InnerHtml="Companies" ID="Manage_Companies">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/MasterSettings.aspx');"
                            InnerHtml="Master Settings" ID="Manage_MasterSettings" Icon="masterSettings.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/MaliSettings.aspx');"
                            InnerHtml="Mail Settings" ID="MenuItem24" Icon="email.png">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/SMSSettings.aspx');"
                            InnerHtml="SMS Settings" ID="MenuItem102" Icon="masterSettings.gif">
                        </oem:MenuItem>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('Manage/ShiftDetails.aspx');"
                            InnerHtml="Shift Details" ID="Manage_ShiftDetails" Icon="oJornal.gif">
                        </oem:MenuItem>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('Manage/ShiftCalenders.aspx');"
                            InnerHtml="Shift Calendar" ID="Manage_ShiftCalenders" Icon="oCalendar.gif">
                        </oem:MenuItem>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('Manage/ShiftRoster.aspx');"
                            InnerHtml="Shift Roster" ID="MenuItem87" Icon="oCalendar.gif">
                        </oem:MenuItem>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('Manage/ShiftGroups.aspx');"
                            InnerHtml="Shift Group" ID="MenuItem81" Icon="oJornal.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/LeaveTypes.aspx');"
                            InnerHtml="Leave Types" ID="Manage_LeaveTypes" Icon="b_g.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeeCategories.aspx');"
                            InnerHtml="Employees Categories" ID="Manage_EmployeeCategories" Icon="oTasks.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/PublicHolidays.aspx');"
                            InnerHtml="Public Holidays" ID="Manage_PublicHolidays" Icon="holiday.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/Departments.aspx');"
                            InnerHtml="Departments" ID="Manage_Departments" Icon="b_b.gif">
                        </oem:MenuItem>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('Manage/DepartmentsShifts.aspx');"
                            InnerHtml="Departments Shifts" ID="Manage_DepartmentsShifts" Icon="b_c.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/Employees.aspx');"
                            InnerHtml="Employees" ID="Manage_Employees" Icon="b_a.gif">
                        </oem:MenuItem>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('Manage/EmployeesShifts.aspx');"
                            InnerHtml="Employees Shifts" ID="Manage_EmployeesShifts" Icon="b_h.gif">
                        </oem:MenuItem>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('Manage/EmployeeShiftSchedule.aspx');"
                            InnerHtml="Employees Shift Schedule" ID="Manage_EmployeesShiftSchedule" Icon="b_h.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeesLeaveEntries.aspx');"
                            Icon="b_d.gif" InnerHtml="Employees Leave Entries" ID="Manage_EmployeesLeaveEntries">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeeOutDoorEntries.aspx');"
                            Icon="b_f.gif" InnerHtml="Employee OutDoor Entries" ID="Manage_EmployeeOutDoorEntries">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/AttendenceLog.aspx');"
                            Icon="BackupDataBase.gif" InnerHtml="Attendence Log" ID="Manage_AttendenceLog">
                        </oem:MenuItem>

                          <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeeOTRegister.aspx');"
                            Icon="BackupDataBase.gif" InnerHtml="Employee OT Register" ID="MenuItem29">
                        </oem:MenuItem>

                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/Geofences.aspx');"
                            Icon="email.png" InnerHtml="Geofences" ID="MenuItem123">
                        </oem:MenuItem>

                        <oem:MenuItem InnerHtml="Manage Work Code" ID="ManageWorkCode" runat="server" Icon="BackupDataBase.gif">
                        </oem:MenuItem>
                        <%-- <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeesLeaveSummary.aspx');"
                                InnerHtml="Employees Leave Summary" ID="Manage_EmployeesLeaveSummary">
                            </oem:MenuItem>--%>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu8" runat="server" ShowEvent="MouseOver" AttachTo="ManageWorkCode"
                    Align="Right" Width="210" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/WorkCode.aspx');"
                            InnerHtml="Work Code" ID="Manage_WorkCode">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=6');"
                            InnerHtml="Work Code Wise Daily Report" ID="MenuItem31">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=7');"
                            InnerHtml="Work Code Wise Summary Report" ID="MenuItem32">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=11');"
                            InnerHtml="Work Code Report(Daily)" ID="MenuItem103">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=12');"
                            InnerHtml="Work Code Report(Consolidated)" ID="MenuItem104">
                        </oem:MenuItem>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu4" runat="server" ShowEvent="MouseOver" AttachTo="DeviceManagement"
                    UseIcons="true" IconsFolder="MenuIcons" IconsPosition="Left" Align="Under" OffsetVertical="-2"
                    Width="245" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/Devices.aspx');" InnerHtml="Device List"
                            ID="MenuItem17" Icon="Device.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/DeviceLogList.aspx');"
                            InnerHtml="Device Log List" ID="MenuItem95" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeeManualEntryLogs.aspx');"
                            InnerHtml="Employee Manual Logs" ID="MenuItem19" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/DeviceCommands.aspx');"
                            InnerHtml="Device Commands" ID="MenuItem74" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/DeviceOperationLogs.aspx');"
                            InnerHtml="Device Operation Logs" ID="MenuItem75" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/DeviceErrorMessages.aspx');"
                            InnerHtml="Device Error Messages" ID="MenuItem93" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/UploadUsersToMultipleDevice.aspx');"
                            InnerHtml="Upload Users To Multiple Device" ID="MenuItem96" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/DeleteUsersFromMultipleDevice.aspx');"
                            InnerHtml="Delete Users From Multiple Device" ID="MenuItem97" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/FTPCustomFormat.aspx');"
                            InnerHtml="FTP Upload Settings" ID="MenuItem108" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                         <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/MasterSlaveDeviceList.aspx');"
                            InnerHtml="Master Slave Device List" ID="MenuItem76" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                         <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/BlacklistedLogList.aspx');"
                            InnerHtml="Blacklisted Logs" ID="MenuItem126" Icon="deviceOpLog.gif">
                        </oem:MenuItem>
                        <%--  
                         
                          <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeeDeviceLogs.aspx');"
                                InnerHtml="Employee Device Logs" ID="MenuItem19" Icon="logs.gif">
                            </oem:MenuItem>
                            
                            
                          
                            <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/DeviceLogList1.aspx');"
                                InnerHtml="Device Log List1" ID="MenuItem96" Icon="deviceOpLog.gif">
                            </oem:MenuItem>--%>
                        <%--<oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/DeviceGreetings.aspx');"
                                InnerHtml="Device Greetings" ID="MenuItem83" Icon="deviceOpLog.gif">
                            </oem:MenuItem>--%>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu5" runat="server" ShowEvent="MouseOver" AttachTo="Utilities"
                    UseIcons="true" IconsFolder="MenuIcons" IconsPosition="Left" Align="Under" OffsetVertical="-2"
                    Width="250" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ImportEmployeesDetails.aspx?Id=1');"
                            InnerHtml="Import Employees Details" ID="MenuItem20" Icon="import.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ImportEmployeesDetails.aspx?Id=2');"
                            InnerHtml="Import Employees Other Details" ID="MenuItem21" Icon="import.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ExportEmployeesDetails.aspx?Id=1');"
                            InnerHtml="Export Employees Details" ID="MenuItem22" Icon="export.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ExportEmployeesDetails.aspx?Id=2');"
                            InnerHtml="Export Employees Other Details" ID="MenuItem23" Icon="export.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ExportEmployeesLeaveSummary.aspx');"
                            InnerHtml="Export Employees Leave Summary" ID="MenuItem92" Icon="export.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ImportLeaveBalance.aspx');"
                            InnerHtml="Import Employees Leave Balance" ID="MenuItem291" Icon="import.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ImportEmployeeLeaves.aspx');"
                            InnerHtml="Import Employees Leaves" ID="MenuItem125" Icon="import.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ImportLogs.aspx');"
                            InnerHtml="Import Log Records" ID="MenuItem25" Icon="import.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ParallelDatabaseExport.aspx');"
                            InnerHtml="Parallel Database Export" ID="MenuItem77" Icon="import.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ExportAttendanceLogs.aspx');"
                            InnerHtml="Export Attendance Logs" ID="MenuItem90" Icon="import.gif">
                        </oem:MenuItem>
                         <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Utilities/ImportEmployeeBioPhoto.aspx');"
                            InnerHtml="Import Employee Bio Photo" ID="MenuItem124" Icon="import.gif">
                        </oem:MenuItem>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu6" runat="server" ShowEvent="MouseOver" AttachTo="PayRoll"
                    UseIcons="true" IconsFolder="MenuIcons" IconsPosition="Left" Align="Under" OffsetVertical="-2"
                    Width="220" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('PayRoll/PayRollFormulaSettings.aspx');"
                            InnerHtml="Payroll Formulas Settings" ID="MenuItem72">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('PayRoll/EmployeesPayDetails.aspx');"
                            InnerHtml="Employees Salary Structure" ID="MenuItem33">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('PayRoll/Loan.aspx');" InnerHtml="Loan Details"
                            ID="MenuItem34">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('PayRoll/Reimbrusment.aspx');"
                            Icon="Reimbursment.gif" InnerHtml="Reimbursement Details" ID="MenuItem35">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('PayRoll/EmployeePayslip.aspx');"
                            Icon="PaySlipRecord.gif" InnerHtml="Payslip Records" ID="MenuItem36">
                        </oem:MenuItem>
                        <oem:MenuItem InnerHtml="Pay Roll Reports" ID="MenuItem49" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LoanOrReimbrusment.aspx?Id=3');"
                            Icon="c_c.gif" InnerHtml="Payroll Yearly Summary Report" ID="MenuItem52" runat="server">
                        </oem:MenuItem>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu15" runat="server" ShowEvent="MouseOver" AttachTo="Canteen"
                    UseIcons="true" IconsFolder="MenuIcons" IconsPosition="Left" Align="Under" OffsetVertical="-2"
                    Width="220" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/CanteenItems.aspx');"
                            InnerHtml="Canteen Items" ID="CanteenItems">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/CanteenTimings.aspx');"
                            InnerHtml="Canteen Timings" ID="CanteenTimings">
                        </oem:MenuItem>
                        <oem:MenuItem InnerHtml="Canteen Reports" ID="CanteenReports" runat="server" Icon="c_c.gif">
                        </oem:MenuItem>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu16" runat="server" ShowEvent="MouseOver" AttachTo="CanteenReports"
                    Align="Right" Width="280" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LeaveEntryReport.aspx?Id=15');"
                            Icon="c_c.gif" InnerHtml="Daily Report" ID="MenuItem112"
                            runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LeaveEntryReport.aspx?Id=16');"
                            Icon="c_c.gif" InnerHtml="Summary Report" ID="MenuItem114"
                            runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LeaveEntryReport.aspx?Id=17');"
                            Icon="c_c.gif" InnerHtml="Work Code Report(Daily)" ID="MenuItem115" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LeaveEntryReport.aspx?Id=18');"
                            Icon="c_c.gif" InnerHtml="Work Code Report(Consolidated)" ID="MenuItem116" runat="server">
                        </oem:MenuItem>
                    </Components>
                </oem:EasyMenu>

                <oem:EasyMenu ID="Easymenu7" runat="server" ShowEvent="MouseOver" AttachTo="MenuItem49"
                    UseIcons="true" IconsFolder="MenuIcons" IconsPosition="Left" Align="Right" Width="230"
                    StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem InnerHtml="Monthly Report" ID="MenuItem48" runat="server" Icon="c_c.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LoanOrReimbrusment.aspx?Id=1');"
                            Icon="c_c.gif" InnerHtml="Loan Details Report" ID="MenuItem50" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LoanOrReimbrusment.aspx?Id=2');"
                            Icon="c_c.gif" InnerHtml="Reimbursement Details Report" ID="MenuItem51" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=16');"
                            Icon="c_c.gif" InnerHtml="Form 2A" ID="MenuItem53" runat="server">
                        </oem:MenuItem>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu3" runat="server" ShowEvent="MouseOver" AttachTo="Reports"
                    UseIcons="true" IconsFolder="MenuIcons" IconsPosition="Left" Align="Under" OffsetVertical="-2"
                    Width="280" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/Recalculate.aspx');"
                            Icon="c_c.gif" InnerHtml="Re calculate Attendance" ID="MenuItem27" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/DailyAttendanceReport.aspx');"
                            Icon="c_c.gif" InnerHtml="Daily Attendance Report" ID="MenuItem1" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/MonthlyAttendanceReport.aspx');"
                            Icon="c_c.gif" InnerHtml="Monthly Status" ID="MenuItem2" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=1');"
                            Icon="c_c.gif" InnerHtml="Yearly Summary" ID="MenuItem3" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=9');"
                            Icon="c_c.gif" InnerHtml="Attendance Summary Report" ID="MenuItem14" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=2');"
                            Icon="c_c.gif" InnerHtml="Leave Summary" ID="MenuItem4" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=3');"
                            Icon="c_c.gif" InnerHtml="Employee Details" ID="MenuItem5" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=17');"
                            Icon="c_c.gif" InnerHtml="Employees Shift Scheduler" ID="MenuItem54" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/DepartmentSummary.aspx');"
                            Icon="c_c.gif" InnerHtml="Department Summary" ID="MenuItem30" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LogRecords.aspx');"
                            Icon="c_c.gif" InnerHtml="Log Records" ID="MenuItem6" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LeaveEntryReport.aspx?Id=3');"
                            Icon="c_c.gif" InnerHtml="Random Check Report" ID="MenuItem7" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LeaveEntryReport.aspx?Id=1');"
                            Icon="c_c.gif" InnerHtml="Leave Entry Report" ID="MenuItem8" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LeaveEntryReport.aspx?Id=2');"
                            Icon="c_c.gif" InnerHtml="OutDoor Entry Report" ID="MenuItem9" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=8');"
                            Icon="c_c.gif" InnerHtml="Daily Log Report Matrix" ID="MenuItem73" runat="server">
                        </oem:MenuItem>
                        <%-- <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=3');"
                                InnerHtml="Employee Graph" ID="MenuItem12" runat="server">
                            </oem:MenuItem>--%>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=10');"
                            Icon="c_c.gif" InnerHtml="Last Day Status Report" ID="MenuItem86" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/ContinuousAbnormality.aspx');"
                            Icon="c_c.gif" InnerHtml="Continuous Abnormality" ID="MenuItem15" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=4');"
                            Icon="c_c.gif" InnerHtml="Muster Roll Report" ID="MenuItem38" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=5');"
                            Icon="c_c.gif" InnerHtml="Form J Report" ID="MenuItem39" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=18');"
                            Icon="c_c.gif" InnerHtml="Detailed Form J Report" ID="MenuItem78" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LeaveEntryReport.aspx?Id=4');"
                            Icon="c_c.gif" InnerHtml="Manual Entry Report" ID="MenuItem94" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/GenerateMemo.aspx');"
                            Icon="c_c.gif" InnerHtml="Generate memo" ID="MenuItem12" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/DailyExitReport.aspx');"
                            Icon="c_c.gif" InnerHtml="Daily Exit Report" ID="MenuItem99" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem InnerHtml="Special Reports" ID="SpecialReports" runat="server" Icon="c_c.gif">
                        </oem:MenuItem>
                        <oem:MenuItem InnerHtml="Export Logs" ID="ExportLogs" runat="server" Icon="c_c.gif">
                        </oem:MenuItem>
                        <oem:MenuItem InnerHtml="Extra Reports" ID="ExtraReports" runat="server" Icon="c_c.gif">
                        </oem:MenuItem>
                         <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LogRecords.aspx?ReportName=Covid19');"
                            Icon="c_cov.gif"  InnerHtml="Covid-19 In/Out Logs" ID="MenuItem120" runat="server">
                        </oem:MenuItem>
                    </Components>
                    <CSSClassesCollection>
                        <oem:CSSClasses Component="easyMenuItem" ComponentContentCell="easyMenuItemContentCell"
                            ComponentContentCellOver="easyMenuItemContentCellOver" ComponentIconCell="easyMenuItemIconCell"
                            ComponentIconCellOver="easyMenuItemIconCellOver" ComponentOver="easyMenuItemOver"
                            ComponentSubMenuCell="easyMenuItemSubMenuCell" ComponentSubMenuCellOver="easyMenuItemSubMenuCellOver"
                            ObjectType="OboutInc.EasyMenu_Pro.MenuItem" />
                    </CSSClassesCollection>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu12" runat="server" ShowEvent="MouseOver" AttachTo="SpecialReports"
                    Align="Right" Width="280" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=1');"
                            Icon="c_c.gif" InnerHtml="Department vs EmployementType Matrix" ID="MenuItem10"
                            runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=2');"
                            Icon="c_c.gif" InnerHtml="Company Vs EmployementType Matrix" ID="MenuItem11"
                            runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=4');"
                            Icon="c_c.gif" InnerHtml="Department Graph" ID="MenuItem13" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=5');"
                            Icon="c_c.gif" InnerHtml="Company Graph" ID="MenuItem79" runat="server">
                        </oem:MenuItem>

                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/MonthlyAttendanceReport.aspx?ReportName=Monthly CSV Export');"
                            Icon="c_c.gif" InnerHtml="Monthly CSV Export Spine" ID="MenuItem119" runat="server">
                        </oem:MenuItem>

                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu10" runat="server" ShowEvent="MouseOver" AttachTo="ExportLogs"
                    Align="Right" Width="210" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/CustomReport.aspx?Id=1');"
                            Icon="c_c.gif" InnerHtml="Export Attendance Logs" ID="MenuItem16" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/DailyAttendanceReport.aspx?Id=1');"
                            Icon="c_c.gif" InnerHtml="Attendance Logs(Employee Wise)" ID="MenuItem40" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/CustomReport.aspx?Id=2');"
                            Icon="c_c.gif" InnerHtml="Export Device Logs" ID="MenuItem18" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/ExportLogsInCustomFormat.aspx');"
                            Icon="c_c.gif" InnerHtml="Export Logs in Custom Format" ID="MenuItem85" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/ExportThirdPartyPayroll.aspx');"
                            Icon="c_c.gif" InnerHtml="Logs in Third Party Payroll Format" ID="MenuItem83"
                            runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SAPExport.aspx');"
                            Icon="c_c.gif" InnerHtml="SAP P10/P20 Export" ID="MenuItem84" runat="server">
                        </oem:MenuItem>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu11" runat="server" ShowEvent="MouseOver" AttachTo="ExtraReports"
                    Align="Right" Width="270" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/MonthlyAttendanceReport.aspx?ReportName=Custom Monthly Status Report');"
                            Icon="c_c.gif" InnerHtml="Custom Monthly Status Report" ID="MenuItem88" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/MonthlyAttendanceReport.aspx?ReportName=Monthly Late Arrival Early Departure Report');"
                            Icon="c_c.gif" InnerHtml="Monthly Late Arrival Early Departure Report" ID="MenuItem89"
                            runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/MonthlyAttendanceReport.aspx?ReportName=Monthly Hour Wise Summary');"
                            Icon="c_c.gif" InnerHtml="Monthly Hour Wise Summary" ID="MenuItem100" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/MonthlyAttendanceReport.aspx?ReportName=Monthly Sheet Designation');"
                            Icon="c_c.gif" InnerHtml="Monthly Sheet Designation" ID="MenuItem101" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/DailySnapshotReport.aspx?ReportName=Daily Snapshot Report');"
                            Icon="c_c.gif" InnerHtml="Punch Report By Date Time" ID="MenuItem105" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LogRecords.aspx?ReportName=Device Logs Count Report');"
                            Icon="c_c.gif" InnerHtml="Device Logs Count Report" ID="MenuItem106" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/MonthlyAttendanceReport.aspx?ReportName=Monthly First In Report');"
                            Icon="c_c.gif" InnerHtml="Monthly First In Report" ID="MenuItem107" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/MonthlyAttendanceReport.aspx?ReportName=LateEarly Muster Detail');"
                            Icon="c_c.gif" InnerHtml="Late+Early Muster Detail" ID="MenuItem109" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/MonthlyAttendanceReport.aspx?ReportName=Form13 Report');"
                            Icon="c_c.gif" InnerHtml="Form13 Report" ID="MenuItem26" runat="server">
                        </oem:MenuItem>

                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=13');"
                            Icon="c_c.gif" InnerHtml="Daily Exception Report" ID="MenuItem113" runat="server">
                        </oem:MenuItem>

                        
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/CustomOTReport.aspx');"
                            Icon="c_c.gif" InnerHtml="Custom OT Report" ID="MenuItem117" runat="server">
                        </oem:MenuItem>

                          <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/LeaveEntryReport.aspx?Id=19');"
                            Icon="c_c.gif" InnerHtml="Daily GPS Logs Report" ID="MenuItem118" runat="server">
                        </oem:MenuItem>

                             <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/specialReports.aspx?Id=14');"
                            Icon="c_c.gif" InnerHtml="Daily Sheet Designation" ID="MenuItem122" runat="server">
                        </oem:MenuItem>


                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu13" runat="server" ShowEvent="MouseOver" AttachTo="MenuItem48"
                    UseIcons="true" IconsFolder="MenuIcons" IconsPosition="Left" Align="Right" Width="290"
                    StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=6&Type=payroll');"
                            Icon="c_c.gif" InnerHtml="PT Report" ID="MenuItem41" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=7&Type=payroll');"
                            Icon="c_c.gif" InnerHtml="ESIC Report" ID="MenuItem42" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=8&Type=payroll');"
                            Icon="c_c.gif" InnerHtml="TDS Report" ID="MenuItem43" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=9&Type=payroll');"
                            Icon="c_c.gif" InnerHtml="PF Report" ID="MenuItem44" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=10&Type=payroll');"
                            Icon="c_c.gif" InnerHtml="OT Details Report" ID="MenuItem45" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=11&Type=payroll');"
                            Icon="c_c.gif" InnerHtml="LOP Report" ID="MenuItem46" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=13');"
                            Icon="c_c.gif" InnerHtml="Bank Transfer Statement" ID="MenuItem47" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=12&Type=payroll');"
                            Icon="c_c.gif" InnerHtml="Generate Pay Slip" ID="MenuItem37" runat="server">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Reports/SummaryReport.aspx?Id=15');"
                            Icon="c_c.gif" InnerHtml="Generate Payslip With Attendance Details" ID="MenuItem91"
                            runat="server">
                        </oem:MenuItem>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu1" runat="server" ShowEvent="MouseOver" AttachTo="About"
                    Align="Under" OffsetVertical="-2" Width="170" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('RaiseComplaintWithessl.aspx');"
                            InnerHtml="Raise Complaint With eSSL" ID="MenuItem121">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('WebHelp.pdf');" InnerHtml="Help Manual"
                            ID="MenuItem28">
                        </oem:MenuItem>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('AboutUs.aspx');"
                            InnerHtml="About us" ID="MenuAboutUs">
                        </oem:MenuItem>
                        <oem:MenuItem runat="server" OnClientClick="javascript:SelectMenuItem('ExtendEvalution.aspx');"
                            InnerHtml="Extend Evaluation" ID="MenuExtendEvaluation">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('CloudDatabaseBackup.aspx');"
                            InnerHtml="Database Backup" ID="MenuItem110">
                        </oem:MenuItem>
                    </Components>
                </oem:EasyMenu>
                <oem:EasyMenu ID="Easymenu14" runat="server" ShowEvent="MouseOver" AttachTo="Admin_AuditLogs"
                    UseIcons="true" IconsFolder="MenuIcons" IconsPosition="Left" Align="Under" OffsetVertical="-2"
                    Width="220" StyleFolder="styles/horizontal1">
                    <Components>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Admin/AuditLogs.aspx?Type=Admin');"
                            InnerHtml="Admin Audit Logs" ID="MenuItem80" Icon="c_c.gif">
                        </oem:MenuItem>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Admin/AuditLogs.aspx?Type=ESS');"
                            InnerHtml="ESS Audit Logs" ID="MenuItem111" Icon="c_c.gif">
                        </oem:MenuItem>                       
                    </Components>
                </oem:EasyMenu>

            </td>
        </tr>
        <%--For Tool Box Items--%>
        <tr style="background-image: url(Images/mid.gif); background-repeat: repeat-x">
            <td colspan="2">
                <oem:EasyMenu ID="Easymenu9" IconsFolder="MenuIcons" UseIcons="true" runat="server"
                    ShowEvent="Always" StyleFolder="styles/EasyMenu/Styles/horizontal1" Position="Horizontal"
                    CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" IconsPosition="Left">
                    <CSSClassesCollection>
                        <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
                            ComponentContentCell="ParentItemContentCell" Component="ParentItem" ComponentSubMenuCell="ParentItemSubMenuCell"
                            ComponentIconCellOver="ParentItemIconCellOver" ComponentIconCell="ParentItemIconCell"
                            ComponentOver="ParentItemOver" ComponentContentCellOver="ParentItemContentCellOver">
                        </oem:CSSClasses>
                        <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver"
                            ComponentContentCell="ParentSeparatorContentCell" Component="ParentSeparator"
                            ComponentSubMenuCell="ParentSeparatorSubMenuCell" ComponentIconCellOver="ParentSeparatorIconCellOver"
                            ComponentIconCell="ParentSeparatorIconCell" ComponentOver="ParentSeparatorOver"
                            ComponentContentCellOver="ParentSeparatorContentCellOver"></oem:CSSClasses>
                    </CSSClassesCollection>
                    <Components>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator35">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Admin/Users.aspx');" ID="MenuItem82"
                            runat="server">
                            <img src="MenuIcons/a_a.gif" title="Users" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator9">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Admin/ChangePassword.aspx');"
                            ID="MenuItem55" runat="server">
                            <img src="MenuIcons/a_d.gif" title="Change Password" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator10">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="window.parent.location.href='LogOut.aspx';" ID="MenuItem56"
                            runat="server">
                            <img src="MenuIcons/a_e.gif" title="Log Off" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator11">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/MasterSettings.aspx');"
                            ID="MenuItem57" runat="server">
                            <img src="MenuIcons/masterSettings.gif" title="Master Settings" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator12">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/Companies.aspx');"
                            ID="MenuItem58" runat="server">
                            <img src="MenuIcons/a_c.gif" title="Company" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator13">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/Departments.aspx');"
                            ID="MenuItem59" runat="server">
                            <img src="MenuIcons/b_b.gif" title="Departments" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator14">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/PublicHolidays.aspx');"
                            ID="MenuItem60" runat="server">
                            <img src="MenuIcons/holiday.gif" title="Public Holidays" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator15">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/ShiftDetails.aspx');"
                            ID="MenuItem61" runat="server">
                            <img src="MenuIcons/oJornal.gif" title="Shift Details" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator16">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/ShiftCalenders.aspx');"
                            ID="MenuItem62" runat="server">
                            <img src="MenuIcons/oCalendar.gif" title="Shift Calendar" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator17">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeeCategories.aspx');"
                            ID="MenuItem63" runat="server">
                            <img src="MenuIcons/oTasks.gif" title="Employee Categories" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator18">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/LeaveTypes.aspx');"
                            ID="MenuItem64" runat="server">
                            <img src="MenuIcons/b_g.gif" title="Leave Types" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator19">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/DepartmentsShifts.aspx');"
                            ID="MenuItem65" runat="server">
                            <img src="MenuIcons/b_c.gif" title="Department Shifts" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator20">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/Employees.aspx');"
                            ID="MenuItem66" runat="server">
                            <img src="MenuIcons/b_a.gif" title="Employee Details" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator21">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeesShifts.aspx');"
                            ID="MenuItem67" runat="server">
                            <img src="MenuIcons/b_h.gif" title="Employee Shift Details" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator22">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeesLeaveEntries.aspx');"
                            ID="MenuItem68" runat="server">
                            <img src="MenuIcons/b_d.gif" title="Leave Entries" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator23">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/EmployeeOutDoorEntries.aspx');"
                            ID="MenuItem69" runat="server">
                            <img src="MenuIcons/b_f.gif" title="Out Door Duty" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator24">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/DeviceLogList.aspx');"
                            ID="MenuItem70" runat="server">
                            <img src="MenuIcons/logs.gif" title="Log Records" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator25">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Manage/AttendenceLog.aspx');"
                            ID="MenuItem71" runat="server">
                            <img src="MenuIcons/BackupDataBase.gif" title="Attendance Logs" style="cursor: auto;" /></oem:MenuItem>
                        <%--<oem:MenuSeparator InnerHtml="|" ID="MenuSeparator26"></oem:MenuSeparator><oem:MenuItem   OnClientClick="javascript:SelectMenuItem('PayRoll/EmployeesPayDetails.aspx');"   ID="MenuItem72" runat="server"><img src="MenuIcons/a_a.gif" title="Employee Salary Structure" style="cursor:auto;"/></oem:MenuItem>
                            <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator27"></oem:MenuSeparator><oem:MenuItem   OnClientClick="javascript:SelectMenuItem('PayRoll/Loan.aspx');"   ID="MenuItem73" runat="server"><img src="MenuIcons/a_a.gif" title="Loan Details" style="cursor:auto;"/></oem:MenuItem>
                            <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator28"></oem:MenuSeparator><oem:MenuItem   OnClientClick="javascript:SelectMenuItem('PayRoll/Reimbrusment.aspx');"   ID="MenuItem74" runat="server"><img src="MenuIcons/a_a.gif" title="Reimbursement Details" style="cursor:auto;"/></oem:MenuItem>
                            <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator29"></oem:MenuSeparator><oem:MenuItem   OnClientClick="javascript:SelectMenuItem('PayRoll/EmployeePayslip.aspx');"   ID="MenuItem75" runat="server"><img src="MenuIcons/a_a.gif" title="Payslip Records" style="cursor:auto;"/></oem:MenuItem>--%>
                        <oem:MenuSeparator InnerHtml="|" ID="MenuSeparator30">
                        </oem:MenuSeparator>
                        <oem:MenuItem OnClientClick="javascript:SelectMenuItem('Admin/DatabaseSettings.aspx');"
                            ID="MenuItemDB1" runat="server">
                            <img src="MenuIcons/a_g.gif" title="Database Settings" style="cursor: auto;" /></oem:MenuItem>
                        <oem:MenuSeparator runat="server" InnerHtml="|" ID="MenuSeparatorDB1">
                        </oem:MenuSeparator>
                    </Components>
                </oem:EasyMenu>
            </td>
        </tr>
    </table>
    <div id="Div_IFrame" style="width: 100%; height: 100%; position: absolute; border: none;
        overflow: hidden;">
        <iframe id="tabIframe" style="width: 100%; height: 100%; border: none;"></iframe>
    </div>
    <owd:Window ID="mySessionTimeOutWindow" runat="server" Left="580" Top="320" Height="80"
        Width="250" VisibleOnLoad="false" StyleFolder="~/Styles/mainwindow/blue" Title="Session Time Out"
        IsModal="True" ShowStatusBar="False" ShowCloseButton="false" OnClientOpen="mySessionTimeOutWindow.screenCenter();">
        <table>
            <tr>
                <td align="left">
                    <asp:Label ID="lblSession" runat="server" Text="Session Timed Out. System will re-login."
                        Font-Size="11px" ForeColor="Black" Font-Names="Verdana"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <input id="btnSessionOk" type="button" value="OK" onclick="SessionTimeOutCloseWindow()" />
                </td>
            </tr>
        </table>
    </owd:Window>
    </form>
    <script type="text/javascript">

        function lnk_LogOff_OnClientClick() {
            window.parent.location.href = 'LogOut.aspx';
            return false;
        }

        function SessionTimeOutCloseWindow() {
            window.parent.location.href = 'LogOut.aspx';
        }

        function LoadMainPage(cId) {
            window.parent.splMain.loadPage('RightContent', cId + '.aspx');
        }

        function LoadMainPageWithQueryString(cId) {
            window.parent.splMain.loadPage('RightContent', cId);
        }

        //    function SelectMenuItem(itemID)
        //    {
        //    var WindowHeight=window.screen.height;
        //    switch (WindowHeight)
        //        {
        //            case 768:
        //              document.getElementById('Div_IFrame').style.height='80.7%'
        //              break;
        //            case 864:
        //              document.getElementById('Div_IFrame').style.height='83.4%'
        //              break;
        //            case 900:
        //              document.getElementById('Div_IFrame').style.height='84%'
        //              break;
        //              case 960:
        //              document.getElementById('Div_IFrame').style.height='85.3%'
        //              break;
        //            default:
        //              document.getElementById('Div_IFrame').style.height='84.2%'
        //        }
        //	    window.frames['tabIframe'].location.replace(itemID);
        //    }


        function SelectMenuItem(itemID) {
            var WindowHeight = window.screen.height;
            switch (WindowHeight) {
                case 768:
                    document.getElementById('Div_IFrame').style.height = '76.7%'
                    break;
                case 864:
                    document.getElementById('Div_IFrame').style.height = '79.4%'
                    break;
                case 900:
                    document.getElementById('Div_IFrame').style.height = '80%'
                    break;
                case 960:
                    document.getElementById('Div_IFrame').style.height = '81.3%'
                    break;
                default:
                    document.getElementById('Div_IFrame').style.height = '80.2%'
            }

            document.getElementById('tabIframe').src = itemID;
        }


    
    </script>
</body>
</html>
