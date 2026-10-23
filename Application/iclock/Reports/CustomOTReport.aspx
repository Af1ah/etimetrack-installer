 <%@ page language="VB" autoeventwireup="false" inherits="Reports_CustomOTReport, App_Web_z1ac55br" enableEventValidation="false" %>
<%@ Register TagPrefix="uctrl" Src="~/header.ascx" TagName="header" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8);
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            return ret;
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode != 46 && charCode > 31
            && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

    </script>

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
        <uctrl:header ID="Header1" runat="server" />
        <owd:Window ID="ReportProtoType" runat="server" IsModal="true" Height="540" Width="870"
            StyleFolder="~/Styles/mainwindow/blue" Title="Custom OT Report" VisibleOnLoad="true"
            ShowCloseButton="true" Left="80" Top="25" ShowStatusBar="False">
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                </tr>
                <tr>
                    <td colspan="6">
                        <fieldset>
                            <legend>
                                <asp:Label ID="Label3" runat="server" Text="Parameter Settings" Font-Bold="True"></asp:Label>
                            </legend>
                            <table cellpadding="1" align="left">
                                <tr>
                                    <td>
                                        Multiply&nbsp;Normal&nbsp;OT&nbsp;by&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox
                                            ID="txt_NormalOTValue" Width="50px" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>&nbsp;no&nbsp;of&nbsp;time.
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;Multiply&nbsp;Holiday&nbsp;OT&nbsp;by&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox
                                            ID="txt_HolidayOTValue" Width="50px" onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>&nbsp;no&nbsp;of&nbsp;time.
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        Multiply&nbsp;Weeklyoff&nbsp;OT&nbsp;by&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txt_WeeklyOffOTValue"
                                            runat="server"  Width="50px" onkeypress="return isNumberKey(event)"></asp:TextBox>&nbsp;no&nbsp;of&nbsp;time.
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Work&nbsp;Duration&nbsp;Transaction&nbsp;Code&nbsp;<asp:TextBox ID="txt_WorkDurationCode" runat="server" Width="50px"
                                            ></asp:TextBox>&nbsp;no&nbsp;of&nbsp;time.
                                    </td>
                                      <td>
                                        &nbsp;&nbsp;Normal&nbsp;OT&nbsp;Transaction&nbsp;Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txt_NormalOTCode" runat="server"
                                           Width="50px" ></asp:TextBox>&nbsp;no&nbsp;of&nbsp;time.
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Holiday&nbsp;OT&nbsp;Transaction&nbsp;Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txt_HolidayCode" runat="server"
                                          Width="50px" ></asp:TextBox>&nbsp;no&nbsp;of&nbsp;time.
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;WeeklyOff&nbsp;OT&nbsp;Transaction&nbsp;Code&nbsp;<asp:TextBox ID="txt_WeeklyOffCode" runat="server"
                                          Width="50px"  ></asp:TextBox>&nbsp;no&nbsp;of&nbsp;time.
                                    </td>
                                </tr>
                               
                            </table>
                        </fieldset>
                        <br />
                    </td>
                </tr>
                <tr id="tr_Monthly">
                    <td colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Group By"></asp:Label>&nbsp;&nbsp;
                        <asp:DropDownList ID="drp_GroupOrder" runat="server" CssClass="WebControls">
                            <asp:ListItem>Department Wise</asp:ListItem>
                            <asp:ListItem>Grade Wise</asp:ListItem>
                            <asp:ListItem>Team Wise</asp:ListItem>
                            <asp:ListItem>Category Wise</asp:ListItem>
                            <asp:ListItem>Employement Type Wise</asp:ListItem>
                            <asp:ListItem>Location Wise</asp:ListItem>
                            <asp:ListItem>Designation Wise</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td colspan="3" align="right">
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
                <tr id="Tr1" runat="server">
                    <td runat="server" id="tdSelectMonth">
                        From Date
                    </td>
                    <td id="Td1" runat="server">
                        <asp:DropDownList ID="Drp_FromDateDD" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_FromDateMM" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_FromDateYYYY" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="drp_SelectMonth" Visible="false" Width="180px" runat="server"
                            CssClass="WebControls">
                        </asp:DropDownList>
                    </td>
                    <td runat="server" id="tdSelectYear">
                        To Date
                    </td>
                    <td id="Td2" runat="server">
                        <asp:DropDownList ID="Drp_ToDateDD" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_ToDateMM" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_ToDateYYYY" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="drp_SelectYrear" Width="180px" Visible="false" runat="server"
                            CssClass="WebControls">
                        </asp:DropDownList>
                    </td>
                    <td id="Td3" runat="server">
                    </td>
                    <td id="Td4" runat="server">
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td colspan="2">
                        <fieldset>
                            <legend>
                                <asp:CheckBox ID="chk_FilterEmployee" Text="Filter Employee" runat="server" OnClick="javascript:chk_FilterEmployee_CheckedChanged();"
                                    CssClass="WebControls" /></legend>
                            <table cellpadding="1">
                                <tr>
                                    <td>
                                        Employee Code
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_EmployeeCode" runat="server" Width="75px" CssClass="WebControls"></asp:TextBox>
                                        &nbsp;<asp:CheckBox ID="chk_Exact" runat="server" Text="Exact" CssClass="WebControls" />
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        Employee Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_EmployeeName" runat="server" Width="120px" CssClass="WebControls"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        Employee Category
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_EmployeeCategory" runat="server" Width="125px" CssClass="WebControls">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        Employee Designation
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_EmployeeDesignation" runat="server" Width="125px" CssClass="WebControls">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        Employee Location
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_EmployeeLocation" runat="server" Width="125px" CssClass="WebControls">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        Employee Type
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_EmployeeType" runat="server" Width="125px" CssClass="WebControls">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                    <td colspan="2" align="right">
                        <fieldset style="border: none">
                            <legend></legend>
                            <table cellpadding="1">
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox ID="chk_FilterCompany" runat="server" Text="Filter Company" onClick="javascript:chk_FilterCompany_CheckChanged();"
                                            CssClass="WebControls" />
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ListBox ID="Lst_FilterCompany" runat="server" Height="157px" Width="140px" CssClass="WebControls"
                                            BorderStyle="Solid" BorderWidth="1px" SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
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
                        <fieldset style="border: none">
                            <legend></legend>
                            <table cellpadding="1">
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox ID="chk_FilterDepartment" runat="server" CssClass="WebControls" Text="Filter Department"
                                            onClick="javascript:chk_FilterDepartment_CheckChanged();" />
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ListBox ID="Lst_FilterDepartment" runat="server" CssClass="WebControls" Height="157px"
                                            Width="140px" BorderStyle="Solid" BorderWidth="1px" SelectionMode="Multiple">
                                        </asp:ListBox>
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
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
                <tr  id="trReportFormat" runat=server>
                    <td colspan="6">
                        <fieldset>
                            <legend>
                                <asp:Label ID="Label1" runat="server" Text="Export File Format" CssClass="WebControls"></asp:Label></legend>
                            <table>
                                <tr>
                                    <td>
                                        Export File Format&nbsp;&nbsp;
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbtn_FileFormat" RepeatDirection="Horizontal" runat="server">
                                            <asp:ListItem>Excel</asp:ListItem>
                                            <asp:ListItem Selected="True">PDF</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:CheckBox ID="chk_RecalculateAttendance" runat="server" CssClass="WebControls"
                            Text="Recalculate Attendance" />
                        &nbsp;<asp:CheckBox ID="chk_ShowCompanyLogo" Checked="true" Text="Show Company Logo"
                            runat="server" />
                    </td>

                    <td>
                        <img style="display: none" id="imgloadinggif" src="../Images/loading.gif" alt="loading.." />
                    </td>

                    <td colspan="2" align="right">
                        <asp:Button ID="btn_GenerateReport" CssClass="WebControls" runat="server" Text="Save Settings & Generate Report"
                             OnClientClick="jsShowHideProgress();" UseSubmitBehavior="false"  />&nbsp;<input
                                type="button" value="Close" id="btn_Close" style="font-size: 11px; font-family: Verdana;
                                height: 20px;" onclick="ReportProtoType.Close();" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <hr />
                        <asp:Label ID="lblStatus" runat="server" CssClass="WebControls" Height="20px" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>
        <asp:LinkButton Visible="false" ID="Lnk_SelectAllDepartment" runat="server" Text="Select All"
            CssClass="WebControls" OnClientClick="return SelectAll(this);"></asp:LinkButton>
        &nbsp;&nbsp;
        <asp:LinkButton Visible="false" ID="Lnk_DeSelectAllDepartment" runat="server" Text="Deselect All"
            CssClass="WebControls" OnClientClick="return DeSelectAll(this);"></asp:LinkButton>
        <asp:LinkButton ID="Lnk_SelectAllCompany" Visible="false" runat="server" Text="Select All"
            CssClass="WebControls" OnClientClick="return SelectAll(this);"></asp:LinkButton>
        &nbsp;&nbsp;
        <asp:LinkButton ID="Lnk_DeSelectAllCompany" Visible="false" runat="server" Text="Deselect All"
            CssClass="WebControls" OnClientClick="return DeSelectAll(this);"></asp:LinkButton>
        &nbsp;</div>
 
    </form>
</body>
</html>
<script type="text/javascript">

    // SET DESIGNATION AND EMPLOYEETYPE COMBOBOX SET POSITION

    document.getElementById("ob_drp_EmployeeDesignationContainer").style.zIndex = "99999";
    document.getElementById("ob_drp_EmployeeTypeContainer").style.zIndex = "99999";


    //  FILTER EMPLOYEE CHECK CHANGED

    function chk_FilterEmployee_CheckedChanged() {

        var CheckStatus = document.getElementById("<%=chk_FilterEmployee.ClientID %>").checked;

        if (CheckStatus) {
            document.getElementById("<%=txt_EmployeeCode.ClientID %>").disabled = false;
            document.getElementById("<%=txt_EmployeeName.ClientID %>").disabled = false;
            document.getElementById("<%=chk_Exact.ClientID %>").disabled = false;
            document.getElementById("<%=drp_EmployeeCategory.ClientID %>").disabled = false;
            document.getElementById("<%=drp_EmployeeDesignation.ClientID %>").disabled = false;
            document.getElementById("<%=drp_EmployeeType.ClientID %>").disabled = false;
            document.getElementById("<%=drp_EmployeeLocation.ClientID %>").disabled = false;
        }

        else {
            document.getElementById("<%=txt_EmployeeCode.ClientID %>").disabled = true;
            document.getElementById("<%=txt_EmployeeName.ClientID %>").disabled = true;
            document.getElementById("<%=chk_Exact.ClientID %>").disabled = true;
            document.getElementById("<%=drp_EmployeeCategory.ClientID %>").disabled = true;
            document.getElementById("<%=drp_EmployeeDesignation.ClientID %>").disabled = true;
            document.getElementById("<%=drp_EmployeeType.ClientID %>").disabled = true;
            document.getElementById("<%=drp_EmployeeLocation.ClientID %>").disabled = true;
        }
    }


    //  FILTER  COMPANY  CHECK CHANGED

    function chk_FilterCompany_CheckChanged() {
        var checkStatus = document.getElementById("<%=chk_FilterCompany.ClientId %>").checked;
        var ListViewObject = document.getElementById("<%=Lst_FilterCompany.ClientID %>");
        for (var j = 0; j < ListViewObject.options.length; j++) {
            ListViewObject.options[j].selected = true;
        }
        if (checkStatus) {
            document.getElementById("<%=Lst_FilterCompany.ClientId %>").disabled = true;
            //        document.getElementById("<%=Lnk_SelectAllCompany.ClientId %>").disabled=false;
            //        document.getElementById("<%=Lnk_DeSelectAllCompany.ClientId %>").disabled=false;
            document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled = false;
            document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").checked = true;
            document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled = false;
        }
        else {
            document.getElementById("<%=Lst_FilterCompany.ClientId %>").disabled = true;
            //        document.getElementById("<%=Lnk_SelectAllCompany.ClientId %>").disabled=true;
            //        document.getElementById("<%=Lnk_DeSelectAllCompany.ClientId %>").disabled=true;
            document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled = true;
            document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").checked = true;
            document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled = true;

        }
    }

    //  FILTER  DEPARTMENT  CHECK CHANGED

    function chk_FilterDepartment_CheckChanged() {
        var checkStatus = document.getElementById("<%=chk_FilterDepartment.ClientId %>").checked;
        var ListViewObject = document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
        for (var j = 0; j < ListViewObject.options.length; j++) {
            ListViewObject.options[j].selected = true;
        }

        if (checkStatus) {
            document.getElementById("<%=Lst_FilterDepartment.ClientId %>").disabled = true;
            //        document.getElementById("<%=Lnk_SelectAllDepartment.ClientId %>").disabled=false;
            //        document.getElementById("<%=Lnk_DeSelectAllDepartment.ClientId %>").disabled=false;
            document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled = false;
            document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").checked = true;
            document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled = false;
        }
        else {
            document.getElementById("<%=Lst_FilterDepartment.ClientId %>").disabled = true;
            //        document.getElementById("<%=Lnk_SelectAllDepartment.ClientId %>").disabled=true;
            //        document.getElementById("<%=Lnk_DeSelectAllDepartment.ClientId %>").disabled=true;
            document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled = true;
            document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").checked = true;
            document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled = true;

        }
    }



    // SELECT ALL

    function SelectAll(Sender) {

        var FieldName = Sender.getAttribute("id");

        if (FieldName == 'ReportProtoType_Lnk_SelectAllCompany') {
            var ListViewObject = document.getElementById("<%=Lst_FilterCompany.ClientID %>");
            for (var j = 0; j < ListViewObject.options.length; j++) {
                ListViewObject.options[j].selected = true;
            }
            return false;
        }

        else if (FieldName == 'ReportProtoType_Lnk_SelectAllDepartment') {
            var ListViewObject = document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
            for (var j = 0; j < ListViewObject.options.length; j++) {
                ListViewObject.options[j].selected = true;
            }
            return false;
        }
    }

    // DESELECT ALL

    function DeSelectAll(Sender) {

        var FieldName = Sender.getAttribute("id");

        if (FieldName == 'ReportProtoType_Lnk_DeSelectAllCompany') {
            var ListViewObject = document.getElementById("<%=Lst_FilterCompany.ClientID %>");
            for (var j = 0; j < ListViewObject.options.length; j++) {
                ListViewObject.options[j].selected = false;
            }
            return false;
        }

        else if (FieldName == 'ReportProtoType_Lnk_DeSelectAllDepartment') {
            var ListViewObject = document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
            for (var j = 0; j < ListViewObject.options.length; j++) {
                ListViewObject.options[j].selected = false;
            }
            return false;
        }
    }







    function chk_CompanySelectDeselectAll_Changed() {
        var checkStatus = document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").checked;
        if (checkStatus) {

            var ListViewObject = document.getElementById("<%=Lst_FilterCompany.ClientID %>");
            for (var j = 0; j < ListViewObject.options.length; j++) {
                ListViewObject.options[j].selected = true;
            }
            document.getElementById("<%=Lst_FilterCompany.ClientId %>").disabled = true;
            //                    document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled=true;
            //                    document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled=false;


        }
        else {

            document.getElementById("<%=Lst_FilterCompany.ClientId %>").disabled = false;
            //                    document.getElementById("<%=rdo_SelectAllCompany.ClientId %>").disabled=false;
            //                    document.getElementById("<%=rdo_DeselectAllCompany.ClientId %>").disabled=true;
            var ListViewObject = document.getElementById("<%=Lst_FilterCompany.ClientID %>");
            for (var j = 0; j < ListViewObject.options.length; j++) {
                ListViewObject.options[j].selected = false;
            }
        }
    }




    function chk_DepartmentSelectDeselectAll_Changed() {
        var checkStatus = document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").checked;
        if (checkStatus) {
            var ListViewObject = document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
            for (var j = 0; j < ListViewObject.options.length; j++) {
                ListViewObject.options[j].selected = true;
            }
            document.getElementById("<%=Lst_FilterDepartment.ClientId %>").disabled = true;
            //                        document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled=true;
            //                        document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled=false;

        }
        else {

            document.getElementById("<%=Lst_FilterDepartment.ClientId %>").disabled = false;
            //                        document.getElementById("<%=rdo_SelectAllDepartment.ClientId %>").disabled=false;
            //                        document.getElementById("<%=rdo_DeselectAllDepartment.ClientId %>").disabled=true;
            var ListViewObject = document.getElementById("<%=Lst_FilterDepartment.ClientID %>");
            for (var j = 0; j < ListViewObject.options.length; j++) {
                ListViewObject.options[j].selected = false;
            }
        }
    }
        
</script>


