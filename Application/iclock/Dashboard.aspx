<%@ page language="VB" autoeventwireup="false" inherits="Dashboard, App_Web_wdniqpox" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<%@ Register Assembly="obout_Calendar2_Net" Namespace="OboutInc.Calendar2" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>eTimeTrackLite Server Online</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
    window.onload = function(){
if (top.location.href != self.location.href)
top.location.href = 'Default.aspx';
};
    </script>

</head>
<body topmargin="0" leftmargin="0" style="text-align: center">
    <form id="form1" runat="server">
       
        <table cellpadding="0" cellspacing="0">
            <tr style="font-size: 0;">
                <td style="width: 403px; height: 85px;">
                    <img alt="Logo" src="images/logo.gif" border="0" />
                </td>
                <td align="right" width="100%">
                    <img alt="Top Header Image" src="images/tophimg.gif" border="0" />
                </td>
            </tr>
            <tr style="font-size: 0;">
                <td colspan="2" style="background-color: lightsteelblue; height: 22px;">
                    <img alt="Top Header Divider" src="images/header_divider.gif" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right" style="height: 13px; text-align: left">
                    <table cellspacing="0" cellpadding="0" style="width: 100%">
                        <tr>
                            <td colspan="3" style="border-bottom: lightgrey thin solid; background-color: #e7edf2;
                                height: 62px;">
                                <h1>
                                    &nbsp; <span style="font-family: Bell MT"><span style="font-size: 18pt; color: black">
                                        Dashboard</span> <small><span style="font-size: 11pt; color: silver">Biometric Attendance
                                            System</span></small> </span>
                                </h1>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="vertical-align: middle; border-bottom: lightgrey thin solid;
                                text-align: center; background-color: ghostwhite;">
                                 
                                        
                                        <table style="width: 96%; padding-left: 11px;">
                                            <tr>
                                                <td style="vertical-align: middle; text-align: center; width: 32%;">
                                                
                                                    <div style="width: 98%; background-color: #e57718; height: 97%;">
                                                        <!-- small box -->
                                                        <div style="width: 100%;">
                                                            <div style="background-color: #ff851b;">
                                                                <h3 style="text-align: left">
                                                                    <asp:Label ID="lblRegEmployees" runat="server" Text="0"></asp:Label>
                                                                </h3>
                                                                <p style="text-align: left; font-size: 16px">
                                                                    Registered Employees
                                                                </p>
                                                            </div>
                                                            <div style="width: 1%;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td style="vertical-align: middle; text-align: center; width: 32%;">
                                                    <div style="width: 98%; background-color: #90b030; height: 97%;">
                                                        <!-- small box -->
                                                        <div style="width: 100%;">
                                                            <div style="background-color: #a1c436;">
                                                                <h3 style="text-align: left">
                                                                    <asp:Label ID="lblPrEmployees" runat="server" Text="0"></asp:Label>
                                                                </h3>
                                                                <p style="text-align: left; font-size: 16px">
                                                                    Present Employees
                                                                </p>
                                                            </div>
                                                            <div style="width: 1%;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td style="vertical-align: middle; text-align: center; width: 32%;">
                                                    <div style="width: 98%; background-color: #99703d; height: 97%">
                                                        <!-- small box -->
                                                        <div style="width: 100%;">
                                                            <div style="background-color: #ab7d44;">
                                                                <h3 style="text-align: left">
                                                                    <asp:Label ID="lblActDevices" runat="server" Text="0"></asp:Label>
                                                                </h3>
                                                                <p style="text-align: left; font-size: 16px">
                                                                    Active Devices
                                                                </p>
                                                            </div>
                                                            <div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;" colspan="3">
                                &nbsp;
                                <table style="width: 100%;" cellpadding="10px" cellspacing="0">
                                    <tr>
                                        <td colspan="3" style="background-color: #5895d8; text-align: left">
                                            <span style="font-size: 16pt; font-family: Calibri"><strong>&nbsp;Employee Log Details:</strong></span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="border-bottom: lightgrey thin dotted; text-align: left">
                                            <span style="font-size: 10pt">&nbsp;<span style="color: #006699">Filter By Device:</span>&nbsp;</span><asp:DropDownList
                                                ID="ddlDevice" runat="server" Width="203px">
                                            </asp:DropDownList>&nbsp; <span style="font-size: 10pt; color: #006699">Date:</span>
                                            &nbsp;<asp:TextBox ID="txtFromDate" runat="server" Width="195px"></asp:TextBox>&nbsp;<obout:Calendar
                                                ID="fromDateCal" runat="server" DateFormat="yyyy-MM-dd" DatePickerImagePath="~/Images/icon2.gif"
                                                DatePickerMode="True" TextBoxId="txtFromDate">
                                            </obout:Calendar>
                                            &nbsp;<asp:Button ID="btnGo" runat="server" Text="Go" />&nbsp;<asp:Label ID="lblError"
                                                runat="server" Font-Size="9pt" ForeColor="Red"></asp:Label>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: left; width: 50%; border-bottom: lightgrey thin dotted;">
                                            <div style="height: 520px; overflow: auto;">
                                                <cc1:Grid ID="DG_DeviceLogRecords" AutoGenerateColumns="false" runat="server" ShowLoadingMessage="true"
                                                    EnableRecordHover="true" AllowFiltering="true" Serialize="false" KeepSelectedRecords="true"
                                                    AllowAddingRecords="false" FolderStyle="~/styles/grid/styles/premiere_blue">
                                                    <Columns>
                                                        <cc1:Column ID="Id" DataField="EmployeeId" Visible="False" Width="100" ReadOnly="True"
                                                            HeaderText="EmployeeId" ConvertEmptyStringToNull="False" Index="0" />
                                                        <cc1:Column ID="UserId" DataField="EmployeeCode" Width="220" HeaderText="Employee Code"
                                                            ConvertEmptyStringToNull="False" Index="3" />
                                                        <cc1:Column ID="DeviceSName" DataField="EmployeeName" Width="200" HeaderText="Employee Name"
                                                            ConvertEmptyStringToNull="False" Index="5" />
                                                        <cc1:Column ID="DeviceSNo" DataField="Punches" Width="400" HeaderText="Punch Records"
                                                            ConvertEmptyStringToNull="False" Index="6" />
                                                    </Columns>
                                                </cc1:Grid>
                                            </div>
                                        </td>
                                        <td style="width: 50%; border-bottom: lightgrey thin dotted; border-left: lightgrey thin dotted;
                                            text-align: left; vertical-align: text-top;">
                                            <asp:Button ID="btnLogin" runat="server" Text="eTimetracklite Login" Width="227px"
                                                Style="background-color:lightblue" Font-Size="18pt" Font-Names="Berlin Sans FB"
                                                ForeColor="DimGray" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                            </td>
                            <td style="width: 100px">
                            </td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        &nbsp;
    </form>
</body>
</html>
