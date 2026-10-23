<%@ page language="VB" autoeventwireup="false" inherits="Manage_AssignEmployeeDeviceLogs, App_Web_usmjemmz" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">

        

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
</head>
<body onload="IsApproved_CheckedChange();">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table width="100px" cellpadding="0" cellspacing="0" style="border-right: gray 1px solid;
            border-top: gray 1px solid; border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr>
                <td style="font-weight: bold; font-size: 17px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Assign Employees Device Logs
                    <br />
                    <hr />
                </td>
            </tr>
            <tr style="background-color: lightsteelblue; padding-left: 0px; padding-top: 0px;
                padding-bottom: 0px; color: white;">
                <td colspan="2">
                    <table>
                        <tr style="font-family: Verdana; font-size: 11px; color: #0c416f; height: auto">
                            <td>
                                DateTime&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="drp_Day" runat="server"></select><select
                                    id="drp_Month" runat="server"></select><select id="drp_Year" runat="server"></select><asp:DropDownList
                                        ID="drp_Hour" runat="server" Width="48px">
                                    </asp:DropDownList>
                                :<asp:DropDownList ID="drp_Minuts" runat="server" Width="49px">
                                </asp:DropDownList>
                                &nbsp;&nbsp; &nbsp; Direction&nbsp;
                                <select id="drp_Direcion" runat="server" enableviewstate="true">
                                    <option selected="selected" value="in">In</option>
                                    <option value="out">out</option>
                                    <option value="breakin">Break In</option>
                                    <option value="breakout">Break out</option>
                                </select>
                            </td>
                            <td style="height: 33px">
                                Device Name&nbsp;<asp:DropDownList ID="drp_DeviceName" runat="server" Width="180px">
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WorkCode&nbsp;<asp:DropDownList ID="drp_WorkCode"
                                    runat="server">
                                    <asp:ListItem>0</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr style="font-family: Verdana; font-size: 11px; color: #0c416f; height: auto">
                            <td colspan=2>
                                <table style="font-family: Verdana; font-size: 11px; color: #0c416f; height: auto" cellspacing=0 cellpadding=0>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chk_IsApproved" Width="139px" runat="server" Text="Is Approved"
                                                Checked="true" onclick="IsApproved_CheckedChange()" />
                                        </td>
                                        <td>
                                            Approved&nbsp;By&nbsp;
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtApprovedBy" Enabled="false" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            Status
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtStatus" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                                <obout:Grid ID="Dg_Employees" runat="server" CallbackMode="true" Serialize="false"
                                    KeepSelectedRecords="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                    AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="true" GenerateRecordIds="true"
                                    AllowFiltering="true">
                                    <ClientSideEvents OnClientCallback="assignEventsToCheckboxes" />
                                    <Columns>
                                        <obout:Column ID="Column10" Width="90" HeaderText="Select" runat="server">
                                            <TemplateSettings TemplateId="CheckTemplate" HeaderTemplateId="CheckAllTemplate" />
                                        </obout:Column>
                                        <obout:Column ID="Column2" Align="left" DataField="EmployeeId" Visible="false" Width="100"
                                            HeaderText="ShiftId" runat="server" />
                                        <obout:Column ID="Column11" Align="left" DataField="EmployeeCodeInDevice" Visible="false"
                                            Width="100" HeaderText="EmployeeCodeInDevice" runat="server" />
                                        <obout:Column ID="Column1" DataField="EmployeeCode" Visible="true" Width="100" HeaderText="Emp Code"
                                            runat="server" />
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
                                    </Templates>
                                </obout:Grid>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr />
                                <table>
                                    <tr>
                                        <td style="width: 272px">
                                            &nbsp;&nbsp;<a style="font-family: Verdana; font-size: 13px; color: #0c416f;" href="EmployeeManualEntryLogs.aspx">«
                                                Go to Employees Manual Entries</a>
                                        </td>
                                        <td align="right" style="width: 826px">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lbl_Message" runat="server" EnableViewState="False" ForeColor="Red"
                                                            Font-Size="12px" Font-Bold="false"></asp:Label>
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="btn_AssignManualEntries" runat="server" Text="Assign Manual Entries" />
                                                        <asp:HiddenField ID="hdn_LoginEmpName" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function IsApproved_CheckedChange() {
        var object = document.getElementById('<%=chk_IsApproved.ClientID %>');
        if (object.checked) {
            document.getElementById('<%=txtApprovedBy.ClientID %>').value = document.getElementById('<%=hdn_LoginEmpName.ClientID %>').value;
        }
        else {
            document.getElementById('<%=txtApprovedBy.ClientID %>').disabled = true;
            document.getElementById('<%=txtApprovedBy.ClientID %>').value = '';
        }
    }

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

    var sDeselectRecordsIds = Dg_Employees.getRecordsIds();
    if (sDeselectRecordsIds != null && sDeselectRecordsIds.length > 0) {
        var arrRecordsDeselectIds = sDeselectRecordsIds.split(",");
        for (var i = 0; i < arrRecordsDeselectIds.length; i++) {
            Dg_Employees.deselectRecord(i);
        }

    }
</script>
