<%@ page language="VB" autoeventwireup="false" inherits="Manage_AssignDepartmentHeads, App_Web_usmjemmz" enableEventValidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
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
<body>
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table width="100px" cellpadding="0" cellspacing="0" style="border-right: gray 1px solid;
            border-top: gray 1px solid; border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr>
                <td style="font-weight: bold; font-size: 17px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Assign Heads To Department&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label runat="server" ID="lbl_DepartmentName"
                        Style="font-family: Verdana; font-size: 13px; color: #0c416f; font-weight: normal;"></asp:Label>
                    <br />
                    <hr />
                </td>
            </tr>
            <tr style="background-color: lightsteelblue; padding-left: 5px; padding-top: 3px;
                padding-bottom: 3px; color: white;">
                <td colspan="2">
                    <table>
                        <tr>
                            <td colspan="2">
                                <obout:Grid ID="Dg_Employees" runat="server" CallbackMode="true" Serialize="false"
                                    KeepSelectedRecords="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                    AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="true" GenerateRecordIds="true"
                                    AllowFiltering="true">
                                    <ClientSideEvents OnClientCallback="assignEventsToCheckboxes" />
                                    <Columns>
                                        <obout:Column ID="Column10" HeaderText="Select" Width="90" runat="server">
                                            <TemplateSettings TemplateId="CheckTemplate" HeaderTemplateId="CheckAllTemplate" />
                                        </obout:Column>
                                        <obout:Column ID="Column2" Align="left" DataField="EmployeeId" Visible="false" Width="100"
                                            HeaderText="EmployeeId" runat="server" />
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
                                        <obout:Column ID="Column9" DataField="EmployementType" Visible="true" Width="150"
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
                                        <td style="width: 198px">
                                            &nbsp;<a style="font-family: Verdana; font-size: 11px; color: #0c416f;" href="AddEditDepartmentHeads.aspx?Code=<%=hdn_DepartmentId.Value%>&Name=<%=hdn_DepartmentName.Value%>"
                                                class="WebControls">« Go to Department Heads</a>
                                        </td>
                                        <td align="right" style="width: 824px">
                                            <table>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="lbl_Message" runat="server" EnableViewState="False" ForeColor="Red"
                                                            Font-Size="11px"></asp:Label>
                                                    </td>
                                                    <td align="right">
                                                        &nbsp;&nbsp;&nbsp;<asp:LinkButton ForeColor="blue" ID="lnk_DisplayError" runat="server"
                                                            Enabled="False" OnClientClick="return attachFlyoutToLink(this);" CssClass="WebControls">Display Error</asp:LinkButton>
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="btn_AssignHead" runat="server" Text="Assign Department Head" Width="170px"
                                                            CssClass="WebControls" />
                                                        <asp:HiddenField ID="hdn_LoginEmpName" runat="server" />
                                                        <asp:HiddenField ID="hdn_DepartmentId" runat="server" />
                                                        <asp:HiddenField ID="hdn_DepartmentName" runat="server" />
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
        <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE"
            OpenEvent="NONE" DelayTime="500" AttachTo="lnk_DisplayError" zIndex="100000">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <asp:TextBox runat="server" ReadOnly="true" BorderStyle="None" Wrap="true" Width="400px"
                            CssClass="WebControls" BackColor="#EEEEEE" Height="150px" TextMode="MultiLine"
                            BorderWidth="0" ID="lbl_DisplayError"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input id="Button1" type="button" value="Close" class="WebControls" onclick="javascript:<%=Flyout1.getClientID()%>.Close();" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
    </div>
    </form>
    <script runat="server">
        
        Function GetDataItemValue(ByVal fieldname As String, ByVal Container As Obout.Grid.TemplateContainer) As String
            
            
            If Container.DataItem(fieldname) Is Nothing Then
                Return Container.DataItem(fieldname.ToUpper)
              
                
            End If
            
            
            Return Container.DataItem(fieldname)
            
        End Function
        
    </script>
    <script type="text/javascript">
        assignEventsToCheckboxes();

        var sDeselectRecordsIds = Dg_Employees.getRecordsIds();
        if (sDeselectRecordsIds != null && sDeselectRecordsIds.length > 0) {
            var arrRecordsDeselectIds = sDeselectRecordsIds.split(",");
            for (var i = 0; i < arrRecordsDeselectIds.length; i++) {
                Dg_Employees.deselectRecord(i);
            }
        }
    </script>
</body>
</html>
