<%@ page language="VB" autoeventwireup="false" enableeventvalidation="false" inherits="PayRoll_EmployeePayslip, App_Web_4fhf4tum" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="osb" Namespace="OboutInc.OboutSuperButton" Assembly="obout_SuperButton" %>
<html>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function OnBeforeDelete(record) {
            var freezVal = record.IsFreezed
            if (freezVal == "False") {
                if (confirm("Are you sure you want to delete? ")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                return false;
            }
        }

        function OnDelete(record) {
            alert(record.Error);
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
                        dg_EmployeePayslip.selectRecord(iRecordIndex);
                    } else {
                        // deselect the record
                        dg_EmployeePayslip.deselectRecord(iRecordIndex);
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


            var sRecordsIds = dg_EmployeePayslip.getRecordsIds();

            if (sRecordsIds != null && sRecordsIds.length > 0) {
                var arrRecordsIds = sRecordsIds.split(",");
                for (var i = 0; i < arrRecordsIds.length; i++) {
                    var oRecord = document.getElementById(arrRecordsIds[i]);
                    oRecord.onmousedown = function (e) { stopEventPropagation(e); };
                    oRecord.onclick = function (e) { stopEventPropagation(e); };
                }

                // populate the previously checked checkboxes
                var arrPageSelectedRecords = dg_EmployeePayslip.PageSelectedRecords;
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
                                dg_EmployeePayslip.selectRecord(iRecordIndex);
                            } else {
                                // deselect the record
                                dg_EmployeePayslip.deselectRecord(iRecordIndex);
                            }
                        }
                    }
                }
            }
        }
          
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table width="100px" cellpadding="0" cellspacing="0" style="border-right: gray 1px solid;
            border-top: gray 1px solid; border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="background-color: lightsteelblue; padding-left: 0px; padding-top: 0px;
                padding-bottom: 0px; color: white;">
                <td colspan="2">
                    <table>
                        <tr style="font-family: Verdana; font-size: 11px; color: #0c416f; height: auto">
                            <td style="height: 26px">
                                &nbsp;&nbsp;&nbsp; &nbsp; Month&nbsp;&nbsp;<asp:DropDownList ID="drp_Month" runat="server"
                                    Width="138px" AutoPostBack="true">
                                </asp:DropDownList>
                                &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Year&nbsp;&nbsp;<asp:DropDownList ID="drp_Year"
                                    runat="server" Width="140px" AutoPostBack="true">
                                </asp:DropDownList>
                                &nbsp;<asp:Button ID="btn_Go" Visible="false" Style="" runat="server" Text="Go" />
                            </td>
                        </tr>
                        <tr style="font-family: Verdana; font-size: 11px; color: #0c416f; height: auto">
                            <td style="height: 24px">
                                &nbsp;&nbsp;Company&nbsp;<asp:DropDownList ID="drp_Company" AutoPostBack="true" runat="server"
                                    Width="138px">
                                </asp:DropDownList>
                                &nbsp;Designation&nbsp;<asp:DropDownList ID="drp_Designation" runat="server" AutoPostBack="true"
                                    Width="140px">
                                </asp:DropDownList>
                                &nbsp;Category&nbsp;<asp:DropDownList ID="drp_Category" AutoPostBack="true" runat="server"
                                    Width="115px">
                                </asp:DropDownList>
                                &nbsp;Status&nbsp;<asp:DropDownList ID="drp_Status" AutoPostBack="true" runat="server"
                                    Width="115px">
                                </asp:DropDownList>
                                &nbsp; &nbsp;Employment Type&nbsp;<asp:DropDownList ID="drp_EmploymentType" AutoPostBack="true"
                                    runat="server" Width="154px">
                                </asp:DropDownList>
                                &nbsp;&nbsp; &nbsp; Location&nbsp;<asp:DropDownList ID="drp_Location" AutoPostBack="true"
                                    runat="server" Width="179px">
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr />
                                <div id="div_Employees">
                                 
                                    <obout:Grid ID="dg_EmployeePayslip" runat="server" EnableRecordHover="true"  Serialize="false"
                                        AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                        KeepSelectedRecords="true" AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false"
                                        GenerateRecordIds="true" OnDeleteCommand="DeleteRecord" AllowFiltering="true"
                                        OnRebind="RebindGrid">
                                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                                        <ClientSideEvents OnClientCallback="assignEventsToCheckboxes" OnBeforeClientDelete="OnBeforeDelete"
                                            OnClientDelete="OnDelete" />
                                        <Columns>
                                            <obout:Column ID="Column10" Width="70" HeaderText="Select" ConvertEmptyStringToNull="False"
                                                HeaderTemplateId="CheckAllTemplate" Index="0" TemplateId="CheckTemplate">
                                                <TemplateSettings TemplateId="CheckTemplate" HeaderTemplateId="CheckAllTemplate" />
                                            </obout:Column>
                                            <obout:Column ID="Column2" DataField="EmployeeId" Visible="False" Width="100" HeaderText="EmployeeId" />
                                            <obout:Column ID="Column11" DataField="PaySlipRecordId" Visible="False" Width="100"
                                                HeaderText="PaySlipRecordId" />
                                            <obout:Column ID="Column1" DataField="EmployeeCode" Width="100" HeaderText="Emp Code" />
                                            <obout:Column ID="Column7" DataField="EmployeeName" Width="110" HeaderText="Emp Name" />
                                            <obout:Column ID="Column3" DataField="CompanySName" Visible="False" Width="120" HeaderText="Company" />
                                            <obout:Column ID="Column4" DataField="DepartmentSName" Visible="False" Width="120"
                                                HeaderText="Department" />
                                            <obout:Column ID="Column5" DataField="Basic" Width="75" HeaderText="Basic" />
                                            <obout:Column ID="Column6" DataField="HRA" Width="70" HeaderText="HRA" />
                                            <obout:Column ID="Column8" DataField="DA" Width="68" HeaderText="DA" />
                                            <obout:Column ID="Column9" DataField="Conveyance" Width="115" HeaderText="Conveyance" />
                                            <obout:Column ID="Column12" DataField="TotalOT" Width="65" HeaderText="OT" />
                                            <obout:Column ID="Column13" DataField="TDS" Width="75" HeaderText="TDS" />
                                            <obout:Column ID="Column14" DataField="PF" Width="65" HeaderText="PF" />
                                            <obout:Column ID="Column15" DataField="ESIC" Width="70" HeaderText="ESIC" />
                                            <obout:Column ID="Column16" DataField="PT" Width="70" HeaderText="PT" />
                                            <obout:Column ID="Column17" DataField="TotalLOP" Width="70" HeaderText="LOP" />
                                            <obout:Column ID="Column18" DataField="TotalEarning" Width="125" HeaderText="Tot. Earning" />
                                            <obout:Column ID="Column19" DataField="TotalDeduction" Width="125" HeaderText="Tot. Deduction" />
                                            <obout:Column ID="Column20" DataField="NetSalary" Width="120" HeaderText="Net Salary" />
                                            <obout:Column ID="Column21" DataField="IsFreezed" Width="105" HeaderText="Freezed" />
                                            <obout:Column HeaderText="Edit" Width="65" AllowEdit="true" AllowDelete="true">
                                                <TemplateSettings TemplateId="tplEditBtn" />
                                            </obout:Column>
                                            <obout:Column HeaderText="Delete" Width="65" AllowEdit="false" AllowDelete="true"
                                                Visible="true" />
                                        </Columns>
                                        <Templates>
                                            <obout:GridTemplate runat="server" ID="tplEditBtn">
                                                <Template>
                                                    <asp:HyperLink runat="server" CssClass="ob_gAL" Text="Edit" NavigateUrl='<%# "~/PayRoll/AddOrUpdateEmployeePaySlip.aspx?PaySlipRecordId=" + Container.DataItem("PaySlipRecordId")+"&EmployeeId="+Container.DataItem("EmployeeId")+"&EmployeeName="+Container.DataItem("EmployeeName")+"&EmployeeCode="+Container.DataItem("EmployeeCode")%>'
                                                        ID="AA1" />
                                                </Template>
                                            </obout:GridTemplate>
                                            <obout:GridTemplate runat="server" ID="tplAddBtn">
                                                <Template>
                                                    <asp:HyperLink runat="server" CssClass="ob_gAL" Text="Add" NavigateUrl='<%# "~/PayRoll/AddOrUpdateEmployeePaySlip.aspx?PaySlipRecordId=" + "0"%>'
                                                        ID="AA1" />
                                                </Template>
                                            </obout:GridTemplate>
                                            <obout:GridTemplate runat="server" ID="CheckTemplate" ControlID="" ControlPropertyName="">
                                                <Template>
                                                    <input type="checkbox" id="chk_grid_<%# Container.DataItem("EmployeeId") %>" />
                                                </Template>
                                            </obout:GridTemplate>
                                            <obout:GridTemplate runat="server" ID="CheckAllTemplate" ControlID="" ControlPropertyName="">
                                                <Template>
                                                    <input type="checkbox" id="chk_all" onclick="checkAll();" />
                                                </Template>
                                            </obout:GridTemplate>
                                        </Templates>
                                    </obout:Grid>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <oem:EasyMenu ID="EasyMenu1" runat="server" StyleFolder="~/styles/EasyMenu/Styles/vsnet"
                        IconsFolder="MenuIcons" Width="210" UseIcons="true" AttachTo="div_Employees"
                        ShowEvent="ContextMenu" Align="Cursor">
                        <Components>
                            <oem:MenuItem ID="menuItem46" runat="server">
                                <a id="btn_recalculate" href="#" runat="server" onserverclick="btn_recalculate_Click">
                                    Recalculate Payslip Details</a>
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator1" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem4" runat="server">
                                <a id="btn_Freeze" href="#" runat="server" onserverclick="btn_Freeze_Click">Freeze Selected
                                    Employees</a>
                            </oem:MenuItem>
                            <oem:MenuSeparator ID="menuSeparator2" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                            </oem:MenuSeparator>
                            <oem:MenuItem ID="menuItem5" runat="server">
                                <a id="btn_UnFreeze" href="#" runat="server" onserverclick="btn_UnFreeze_Click">Unfreeze
                                    Selected Employees</a>
                            </oem:MenuItem>
                        </Components>
                    </oem:EasyMenu>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="Hdn_PaySlipRecordId" runat="server" />
        <script runat="server">
            Function ChangeBackcolor(ByVal IsFreeze As Boolean) As String
                If IsFreeze Then
                    Return "Red"
                Else
                    Return "black"
                End If
            End Function
        </script>
    </div>
    </form>
</body>
</html>
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
