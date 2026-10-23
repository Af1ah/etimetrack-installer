<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeeEditMenu, App_Web_kgq5n2bg" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="fup" Namespace="OboutInc.FileUpload" Assembly="obout_FileUpload" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../jQueryMenustyles/jquery-ui.css" rel="stylesheet" />
    <script src="../jQueryMenuscripts/jquery-1.11.3.min.js"></script>
    <script src="../jQueryMenuscripts/jquery-ui.js"></script>
  
    <style type="text/css">
        #ParentDIV
        {
            width: 50%;
            height: 100%;
            font-size: 12px;
            font-family: Calibri;
        }
    </style>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
  <script type="text/javascript">
      $(function () {
          $("#tabs").tabs({
              activate: function () {
                  var selectedTab = $('#tabs').tabs('option', 'active');
                  $('#<%= hdnSelectedTab.ClientID %>').val(selectedTab);
              },
              active: document.getElementById('<%= hdnSelectedTab.ClientID %>').value
          });
      });
    </script>

    <form id="form1" runat="server">
    <div id="tabs" style="height: 100%">
        <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="0" />
        <ul>
            <li><a href="#tabs-2">Official Details</a></li>
            <li><a href="#tabs-3">Other Details</a></li>
            <li><a href="#IframeLeave">Leave Summary</a></li>
            <li><a href="#IframeShift">Shift Details</a></li>
            <li><a href="#IframePay">Pay Details</a></li>
            <li><a href="#tabs-4">Login & Department Access</a></li>
            <li><a href="#IframePhoto">Photo</a></li>
        </ul>
        <div id="tabs-2">
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
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="btn_AddToDevice" runat="server" Text="Add To All Devices" />
                        &nbsp;
                        <asp:Button ID="btn_DeleteFromDevice" runat="server" Text="Delete From All Devices" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_Save" runat="server" Text="Save" />&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:HiddenField ID="Hdn_EmployeeId" runat="server" />
                        <asp:HiddenField ID="Hdn_EmployeeCode" runat="server" />
                        <asp:HiddenField ID="hdn_EmployeePasword" runat="server" />
                        <asp:Label runat="server" ForeColor="red" Text="" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div id="tabs-3">
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
                                        <asp:TextBox ID="txt_EmailId" Width="410px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Date of Birth
                                    </td>
                                    <td>
                                        <select id="drp_DOBDay" enabled="false" runat="server" enableviewstate="true" width="46px">
                                        </select>
                                        &nbsp;&nbsp;<select id="drp_DOBMonth" runat="server" enabled="false" enableviewstate="true"
                                            width="48px">
                                        </select>&nbsp;&nbsp;<select id="drp_DOBYear" runat="server" enabled="false" enableviewstate="true"
                                            width="69px">
                                        </select>
                                        &nbsp; &nbsp; &nbsp;
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
                                        Residentail Address
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_ResidentailAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td id="tdUserPic">
                                    </td>
                                    <td align="left" rowspan="3" id="tdImage">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Permanent Address
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_PermanentAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
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
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        &nbsp;<asp:Button ID="btn_OtherUpdate" runat="server" Text="Update" />&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="lbl_InvalidError1"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div id="tabs-4">
            <table cellpadding="1" class="rowEditTable">
                <tr>
                    <td align="left">
                        <fieldset>
                            <legend>Employee Login And Department Access Details</legend>
                            <table>
                                <tr>
                                    <td align="center" colspan="4">
                                        <asp:Label ID="lbl_EmpDetails" Font-Bold="True" runat="server" Text="essl:essl"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr />
                                    </td>
                                </tr>
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
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btn_OK" runat="server" Text="Update" OnClientClick="GetSelectedItem();"
                            CssClass="WebControls" />&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lbl_LoginAndAccessError" ForeColor="red" Text="" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <asp:HiddenField ID="Hdn_ExportName" runat="server" />
                <asp:HiddenField ID="Hdn_SourceExportName" runat="server" />
                <asp:HiddenField ID="Hdn_ExportValueName" runat="server" />
                <asp:HiddenField ID="Hdn_SourceExportValueName" runat="server" />
            </table>
        </div>
        <iframe id="IframeLeave" frameborder="1" scrolling="auto" style="height: 380px; width: 80%;
            padding-left: 6px;" src="employeeleaves.aspx?EmployeeId=<%= Request.QueryString("EmployeeId")%>&EmployeeCode=<%= Request.QueryString("EmployeeCode")%>&EmployeeName=<%= Request.QueryString("EmployeeName")%>&Gender=<%= Request.QueryString("Gender")%>">
        </iframe>
        <iframe id="IframeShift" frameborder="1" scrolling="auto" style="height: 500px; width: 80%;
            padding-left: 6px;" src="EmployeeShiftCalendarShedular.aspx?EmployeeId=<%= Request.QueryString("EmployeeId")%>&CompanyId=<%= Request.QueryString("CompanyId")%>&DepartmentId=<%= Request.QueryString("DepartmentId")%>&EmployeeName=<%= Request.QueryString("EmployeeName")%>">
        </iframe>
        <iframe id="IframePay" frameborder="1" scrolling="auto" style="height: 500px; width: 80%;
            padding-left: 6px;" src="../PayRoll/EmployeePayDetails.aspx?EmployeeId=<%= Request.QueryString("EmployeeId")%>&EmployeeCode=<%= Request.QueryString("EmployeeCode")%>&EmployeeName=<%= Request.QueryString("EmployeeName")%>&Gender=<%= Request.QueryString("Gender")%>">
        </iframe>
        <iframe id="IframePhoto" frameborder="1" scrolling="auto" style="height: 400px; width: 80%;
            padding-left: 6px;" src=" UpdateEmployeeProfilePhoto.aspx?EmployeeId=<%= Request.QueryString("EmployeeId")%>&EmployeeName=<%= Request.QueryString("EmployeeName")%>&EmployeeCode=<%= Request.QueryString("EmployeeCode")%>">
        </iframe>
        <a style="font-family: Verdana; font-size: 13px; color: #0c416f; text-decoration: underline;"
            href="Employees.aspx">« Go to Employees</a>
    </div>
    <script type="text/javascript">

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
    </script>
    </form>
</body>
</html>
