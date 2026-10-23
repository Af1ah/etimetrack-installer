<%@ page language="VB" autoeventwireup="false" inherits="Manage_DeviceUsers, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>

    <script type="text/javascript">
        function selectRecordFromGrid() {
            var iIndex = document.getElementById("txtIndex").value;
            if (iIndex != "") {
                Dg_Employees.selectRecord(iIndex);
            }
        }
        function deselectRecordFromGrid() {
            var iIndex = document.getElementById("txtIndex").value;
            if (iIndex != "") {
                Dg_Employees.deselectRecord(iIndex);
            }
        }

        function SelectDeselect(oCheckbox) {
            var oElement = oCheckbox.parentNode;
            while (oElement != null && oElement.nodeName != "TR") {
                oElement = oElement.parentNode;
            }

            if (oElement != null) {
                // oElement represents the row where the clicked      
                // checkbox reside
                var oContainer = oElement.parentNode;
                var iRecordIndex = -1;
                for (var i = 0; i < oContainer.childNodes.length; i++) {
                    if (oContainer.childNodes[i] == oElement) {
                        iRecordIndex = i;
                        break;
                    }
                }

                if (iRecordIndex != -1) {
                    if (oCheckbox.checked == true) {
                        // select the record
                        Dg_Employees.selectRecord(iRecordIndex);
                    } else {
                        // deselect the record
                        Dg_Employees.deselectRecord(iRecordIndex);
                    }
                }
            }
        }

        function stopEventPropagation(e) {
            if (!e) { e = window.event; }
            if (!e) { return false; }
            e.cancelBubble = true;
            if (e.stopPropagation) { e.stopPropagation(); }
        }

        function assignEventsToCheckboxes() {

            // disable the record selection feature by clicking on the records
            var sRecordsIds = Dg_Employees.getRecordsIds();
            if (sRecordsIds != null && sRecordsIds.length > 0) {
                var arrRecordsIds = sRecordsIds.split(",");
                for (var i = 0; i < arrRecordsIds.length; i++) {
                    var oRecord = document.getElementById(arrRecordsIds[i]);
                    oRecord.onmousedown = function (e) { stopEventPropagation(e); };
                    oRecord.onclick = function (e) { stopEventPropagation(e); };
                }

                // populate the previously checked checkboxes
                var arrPageSelectedRecords = Dg_Employees.PageSelectedRecords;

                for (var i = 0; i < arrPageSelectedRecords.length; i++) {
                    var oCheckbox = document.getElementById("chk_grid_" + arrPageSelectedRecords[i].EmployeeId);
                    oCheckbox.checked = true;
                }

                // enable the record selection feature by selecting the checkboxes
                var arrCheckboxes = document.getElementsByTagName("INPUT");
                for (var i = 0; i < arrCheckboxes.length; i++) {
                    if (arrCheckboxes[i].type == "checkbox" && arrCheckboxes[i].id.indexOf("chk_grid_") == 0) {
                        arrCheckboxes[i].onmousedown = function (e) { stopEventPropagation(e); };
                        arrCheckboxes[i].onclick = function (e) { SelectDeselect(this); stopEventPropagation(e); };
                    }
                }
            }
        }

        // check/uncheck all rows.
        function checkAll() {
            var newState = document.getElementById("chk_all").checked;

            var inputArr = document.getElementsByTagName("INPUT");
            for (i = 0; i < inputArr.length; i++) {
                var e = inputArr[i];
                if (e && e.type == "checkbox" && e.id != null && e.id.indexOf("chk_grid_") == 0) {
                    e.checked = newState;

                    var oElement = e.parentNode.parentNode.parentNode;
                    var oContainer = oElement.parentNode;
                    if (oElement && oContainer) {
                        var iRecordIndex = -1;
                        for (var j = 0; j < oContainer.childNodes.length; j++) {
                            if (oContainer.childNodes[j] == oElement) {
                                iRecordIndex = j;
                                break;
                            }
                        }

                        if (iRecordIndex != -1) {
                            if (newState == true) {
                                // select the record
                                Dg_Employees.selectRecord(iRecordIndex);
                            } else {
                                // deselect the record
                                Dg_Employees.deselectRecord(iRecordIndex);
                            }
                        }
                    }
                }
            }
        }
          
    </script>

    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body background="../Images/bck1.gif" style="background-repeat: no-repeat; background-position-x: right;
    background-position-y: top;">
    <form id="form1" runat="server">
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td id="Td1" runat="server" colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                        padding: 5px; color: white;">
                        Users In Device <b><%=Request.QueryString("DeviceSName")%></b> &nbsp;<asp:Button ID="btnExportToCsv"
                                runat="server" Text="Export To CSV" />
                    
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
                            <obout:Grid ID="Dg_Employees" runat="server"  Serialize="false"
                                AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                AllowMultiRecordDeleting="true" AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false"
                                GenerateRecordIds="true" AllowFiltering="true">
                                <ClientSideEvents OnClientCallback="assignEventsToCheckboxes" />
                                <Columns>
                                    <obout:Column ID="Column10" Width="100" HeaderText="Select" runat="server">
                                        <TemplateSettings TemplateId="CheckTemplate" HeaderTemplateId="CheckAllTemplate" />
                                    </obout:Column>
                                    <obout:Column ID="Column2" Align="left" DataField="EmployeeId" Visible="false" Width="100"
                                        HeaderText="ShiftId" runat="server" />
                                    <obout:Column ID="Column1" DataField="EmployeeCode" Visible="true" Width="100" HeaderText="Emp Code" runat="server" />
                                      <obout:Column ID="Column11" DataField="EmployeeCodeInDevice" Visible="true" Width="100" HeaderText="Device Code" runat="server" />  
                                    <obout:Column ID="Column7" DataField="EmployeeName" Visible="true" Width="120" HeaderText="Emp Name"
                                        runat="server" />
                                    <obout:Column ID="Column3" DataField="CompanySName" Visible="true" Width="120" HeaderText="Company"
                                        runat="server" />
                                    <obout:Column ID="Column4" DataField="DepartmentSName" Visible="true" Width="120"
                                        HeaderText="Department" runat="server" />
                                    <obout:Column ID="Column5" DataField="Location" Visible="true" Width="120" HeaderText="Location"
                                        runat="server" />
                                    <obout:Column ID="Column6" DataField="CategorySName" Visible="true" Width="120" HeaderText="Category"
                                        runat="server" />
                                    <obout:Column ID="Column8" DataField="EmployeesStatus" Visible="true" Width="85"
                                        HeaderText="Status" runat="server" />
                                    <obout:Column ID="Column9" DataField="EmployementType" Visible="true" Width="120"
                                        HeaderText="Emp Type" runat="server" />
                                    <obout:Column ConvertEmptyStringToNull="False" Width="120" AllowFilter="false" DataField="C7"
                                        HeaderText="Privilege" TemplateId="Privilege_Template">
                                        <TemplateSettings TemplateId="Privilege_Template" />
                                    </obout:Column>
                                </Columns>
                                <Templates>
                                    <obout:GridTemplate runat="server" ID="CheckTemplate">
                                        <Template>
                                            <input type="checkbox" id="chk_grid_<%# Container.DataItem("EmployeeId") %>" />
                                        </Template>
                                    </obout:GridTemplate>
                                    <obout:GridTemplate runat="server" ID="CheckAllTemplate">
                                        <Template>
                                            <input type="checkbox" id="chk_all" onclick="checkAll();" />
                                        </Template>
                                    </obout:GridTemplate>
                                     <obout:GridTemplate runat="server" ID="Privilege_Template" ControlID="" ControlPropertyName="">
                                        <Template>
                                            <%# GetPrivilegeName(Container.DataItem.Item("C7"))%>
                                        </Template>
                                    </obout:GridTemplate>
                                </Templates>
                            </obout:Grid>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <oem:EasyMenu ID="EasyMenu1" runat="server" StyleFolder="~/styles/EasyMenu/Styles/vsnet"
            IconsFolder="MenuIcons" Width="210" UseIcons="true" AttachTo="div_Employees"
            ShowEvent="ContextMenu" Align="Cursor">
            <Components>
                <oem:MenuItem ID="menuItem1" InnerHtml="Change Privilege" OnClientClick="WindowOpen();">
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator1" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem4" InnerHtml="Delete User" OnClientClick="DeleteWindowOpen();">
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator2" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
            </Components>
        </oem:EasyMenu>
        <owd:Window ID="wnd_ChangePrivilege" runat="server" Height="135" StyleFolder="~/Styles/mainwindow/blue"
            Title="Change Privilege" Width="300" VisibleOnLoad="false" IsResizable="true" ShowStatusBar="false"
            Left="350" Top="155">
            <table class="rowEditTable" width="100%" height="100%">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Change Privilege</legend>
                            <table>
                                <tr>
                                    <td>
                                        Privilage
                                    </td>
                                    <td>
                                         <select id="drp_Privilage" runat="server" style="width: 156px; height: 22px">
                                            <option value="0">Normal User</option>
                                            <option value="6">Admin</option>
                                            <option value="14">Supervisor</option>
                                            <option value="2">Enroller</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btn_Save" runat="server" Text="OK" />
                        &nbsp;&nbsp;<input id="btn_Cancel" type="button" value="Close" onclick="wnd_ChangePrivilege.Close();" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="Hdn_Satus" type="hidden" runat="server" /><asp:HiddenField ID="Hdn_LoginUserIds"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_Error" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>
        <owd:Window ID="wnd_DeleteMessageWindow" runat="server" ShowCloseButton="true" VisibleOnLoad="false"
            Left="400" Top="200" Height="140" Width="300" StyleFolder="~/Styles/mainwindow/blue"
            Title="Delete Message" IsModal="False" ShowStatusBar="False">
            <table class="rowEditTable"  style="width: 100%; height: 100%;border:none;">
                <tr>
                    <td>
                        <fieldset style="width: 280px">
                            <legend>Deleting</legend>
                            <table>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Are You Sure of Deleting the Record?
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btn_DelYes" runat="server" Text="Yes" />&nbsp;
                                        <input id="Btn_DeleteNo" type="button" value="No" runat="server" onclick="wnd_DeleteMessageWindow.Close();" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_DelError" runat="server" EnableViewState="false" ForeColor="red"></asp:Label></td>
                </tr>
            </table>
        </owd:Window>
    </form>
</body>
</html>

<script type="text/javascript">
    function WindowOpen() {
        document.getElementById("<%=lbl_Error.ClientID %>").innerHTML = '';
        wnd_ChangePrivilege.Open();
    }

    function DeleteWindowOpen() {
        document.getElementById("<%=lbl_DelError.ClientID %>").innerHTML = '';
        wnd_DeleteMessageWindow.Open();
    }
</script>

<script runat="server">
      
    Function GetPrivilegeName(ByVal PrivilegeValue As String)
        Try
            
            If PrivilegeValue = "14" Then
                Return "Super Admin"
            ElseIf PrivilegeValue = "10" Then
                Return "User Defined"
            ElseIf PrivilegeValue = "6" Then
                Return "Admin"
            ElseIf PrivilegeValue = "2" Then
                Return "Registrator"
            Else
                Return "Normal User"
            End If
            Return "Normal User"
        Catch ex As Exception
            Return "Normal User"
        End Try
        
    End Function
                
    </script>


<script type="text/javascript">


    var oldonload = window.onload;
    if (typeof window.onload != 'function') {
        window.onload = assignEventsToCheckboxes;
    } else {
        window.onload = function () {
            if (oldonload) {
                oldonload();
            }
            assignEventsToCheckboxes();
        }
    }
</script>

