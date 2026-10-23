<%@ page language="VB" autoeventwireup="false" inherits="Manage_DeviceList, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register Assembly="obout_Calendar2_Net" Namespace="OboutInc.Calendar2" TagPrefix="obout" %>

<script type="text/javascript">


    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        if (record.DeviceSName == 'Mobile') {
            alert('Cannot delete this device');
            return false;
        }
        else {
            record.Error = '';
            document.getElementById("<%=Hdn_DeviceId.ClientID %>").value = record.DeviceId;
            document.getElementById("<%=Hdn_DeviceName.ClientID %>").value = record.DeviceSName;
            if (confirm("Are you sure you want to delete? "))
                return true;
            else
                return false;
        }
    }

    function OnDelete(record) {
        alert(record.Error);
    }

    function OnInsert(record) {
        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = record.Error;
    }



    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }

    function AvoidWrite(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode < 48 || charCode > 57)
            return false;
        else {
            return false;
        }
    }   


</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                        grid_Devices.selectRecord(iRecordIndex);
                    } else {
                        // deselect the record
                        grid_Devices.deselectRecord(iRecordIndex);
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

            var sRecordsIds = grid_Devices.getRecordsIds();

            if (sRecordsIds != null && sRecordsIds.length > 0) {

                var arrRecordsIds = sRecordsIds.split(",");
                for (var i = 0; i < arrRecordsIds.length; i++) {
                    var oRecord = document.getElementById(arrRecordsIds[i]);
                    oRecord.onmousedown = function (e) { stopEventPropagation(e); };
                    oRecord.onclick = function (e) { stopEventPropagation(e); };
                }

                // populate the previously checked checkboxes
                var arrPageSelectedRecords = grid_Devices.PageSelectedRecords;

                for (var i = 0; i < arrPageSelectedRecords.length; i++) {
                    var oCheckbox = document.getElementById("chk_grid_" + arrPageSelectedRecords[i].DeviceId);
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

    </script>
</head>
<body onload="drp_connectionType_SelectIndexChanges();">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; ">
                <td colspan=2 style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white; height: 27px;">
                    Devices List
                </td>
            
            </tr>
              <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
            <tr>
            
                <td colspan=2 align="right" style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">
                    &nbsp;&nbsp; Location &nbsp;<asp:DropDownList ID="drp_FilterLocation" runat="server"
                        >
                    </asp:DropDownList>
                    Device Type
                    <asp:DropDownList ID="drp_FilterDeviceType" AutoPostBack="True" runat="server" Width="100" >
                        <asp:ListItem Value="Normal">Normal</asp:ListItem>
                        <asp:ListItem Value="Android">Android</asp:ListItem>
                        <asp:ListItem Value="FaceTMP">FaceTMP</asp:ListItem>
                        <asp:ListItem Value="ExternalTMP">ExternalTMP</asp:ListItem>
                        <asp:ListItem Value="MUAI">MUAI</asp:ListItem>
                    </asp:DropDownList>
                    Sort By
                    <asp:DropDownList ID="ddlSortBy" runat="server" Width="120">
                        <asp:ListItem Value="DeviceSName">Device Name</asp:ListItem>
                        <asp:ListItem Value="SerialNumber">Serial Number</asp:ListItem>
                        <asp:ListItem Value="LastPing">Last Ping</asp:ListItem>
                    </asp:DropDownList>
                    Page Size
                    <asp:TextBox ID="txtPageSize" runat="server" 
                        Width="40" Text="100" />
                   


                         <asp:Button ID="btnUpdate"  runat="server" Text="Refresh" OnClientClick="SetSource(this.id)"/>
                          <asp:HiddenField ID="hidSourceID" runat="server" />

                         <script type="text/javascript">
                             function SetSource(SourceID) {
                                 var hidSourceID = document.getElementById("<%=hidSourceID.ClientID%>");
                                 hidSourceID.value = SourceID;
                             }
                  </script>

                        Select Command
                    <asp:DropDownList ID="ddlCommand" runat="server" Width="170">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Clear Logs From Device</asp:ListItem>
                        <asp:ListItem>Change Ip Address</asp:ListItem>
                        <asp:ListItem>Reset Transaction Stamp</asp:ListItem>
                        <asp:ListItem>Reset OpStamp</asp:ListItem>
                        <asp:ListItem>Upload Users To Device</asp:ListItem>
                        <asp:ListItem>Change Card Key</asp:ListItem>
                        <asp:ListItem>Restart Device</asp:ListItem>
                        <asp:ListItem>Change SubnetMask</asp:ListItem>
                        <asp:ListItem>Change GateWay</asp:ListItem>
                        <asp:ListItem>Change WebServerIP</asp:ListItem>
                        <asp:ListItem>Change WebServerPort</asp:ListItem>
                        <asp:ListItem>Delete Users From Device</asp:ListItem>
                        <asp:ListItem>Block Users From Device</asp:ListItem>
                        <asp:ListItem>UnBlock Users From Device</asp:ListItem>
                        <asp:ListItem>Enroll User FP</asp:ListItem>
                        <asp:ListItem>Unlock Door</asp:ListItem>
                        <asp:ListItem>Reset AttPhoto Stamp</asp:ListItem>
                        <asp:ListItem>Enroll User Face</asp:ListItem>
                        <asp:ListItem>Enroll User Face Ex</asp:ListItem>
                        <asp:ListItem>Get ATTLOG By Datetime</asp:ListItem>
                    </asp:DropDownList>
                    <input id="btnExecuteCommand" type="button" onclick="ExecuteCommands();" value="Execute"
                        onclick="return btnExecuteCommand_onclick()" />
                        <asp:Button ID="btnExportToExcel" runat="server" Text="Export To Excel" />
                </td>
            </tr>
          
            <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 323px; padding-top: 10px;" valign="top">
                    <div id="div_Employees">
                        <obout:Grid ID="grid_Devices" runat="server" AllowRecordSelection="true" AllowMultiRecordSelection="true"
                            KeepSelectedRecords="true" Serialize="true" AllowPageSizeSelection="true" AllowFiltering="true"
                            AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                            AllowAddingRecords="true" ShowLoadingMessage="false" OnRebind="RebindGrid" AllowSorting="false"
                            OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" GenerateRecordIds="true">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" OnClientCallback="assignEventsToCheckboxes" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column ID="Column2" DataField="DeviceId" Visible="False" Width="300" HeaderText="DeviceId"
                                    ConvertEmptyStringToNull="False" Index="0" />
                                <obout:Column ID="Column44" DataField="SerialNumber1" ReadOnly="True" HeaderText="Chk"
                                    Width="40" ConvertEmptyStringToNull="False" Index="1" TemplateId="TemplateWithCheckbox">
                                    <TemplateSettings TemplateId="TemplateWithCheckbox" />
                                </obout:Column>
                                <obout:Column ID="Column1" DataField="DeviceSName" TemplateId="tplDeviceName" Width="115"
                                    HeaderText="Device Name" ConvertEmptyStringToNull="False" Index="2">
                                    <TemplateSettings TemplateId="tplDeviceName" />
                                </obout:Column>
                                <obout:Column ID="Column3" DataField="DeviceFName" Visible="False" Width="350" HeaderText="DeviceFName"
                                    ConvertEmptyStringToNull="False" Index="3" />
                                <obout:Column ID="Column7" DataField="SerialNumber" Width="140" HeaderText="Serial No."
                                    ConvertEmptyStringToNull="False" Index="4" />
                                <obout:Column ID="Column8" DataField="DeviceDirection" Width="70" HeaderText="Direction"
                                    ConvertEmptyStringToNull="False" Index="5" />
                                <obout:Column ID="Column4" DataField="IpAddress" Visible="False" Width="300" HeaderText="IpAddress"
                                    ConvertEmptyStringToNull="False" Index="6" />
                                <obout:Column ID="Column5" DataField="ConnectionType" Visible="False" Width="300"
                                    HeaderText="ConnectionType" ConvertEmptyStringToNull="False" Index="7" />
                                <obout:Column ID="Column10" DataField="DeviceType" Visible="False" Width="130" HeaderText="DeviceType"
                                    ConvertEmptyStringToNull="False" Index="8">
                                </obout:Column>
                                <obout:Column ID="Column11" DataField="TransactionStamp" Width="90" HeaderText="T Stamp"
                                    ConvertEmptyStringToNull="False" Index="9" />
                                <obout:Column ID="Column9" DataField="OpStamp" Width="95" HeaderText="Op Stamp" ConvertEmptyStringToNull="False"
                                    Index="10" />
                                <obout:Column ID="Column13" DataField="TimeZone" Width="80" HeaderText="Time Zone"
                                    ConvertEmptyStringToNull="False" Index="11" />
                                <obout:Column ID="Column15" DataField="TimeOut" Visible="False" Width="120" HeaderText="TimeOut"
                                    ConvertEmptyStringToNull="False" Index="12" />
                                <obout:Column ID="Column14" DataField="DeviceLocation" Width="100" HeaderText="Location"
                                    ConvertEmptyStringToNull="False" Index="13">
                                </obout:Column>
                                <obout:Column ID="Column6" Width="130" HeaderText="Last Ping" DataField="LastPing"
                                    ConvertEmptyStringToNull="False" Index="14" TemplateId="LastPing_Template">
                                    <TemplateSettings TemplateId="LastPing_Template" />
                                </obout:Column>
                                <obout:Column ID="Column12" Width="70" HeaderText="Status" ConvertEmptyStringToNull="False"
                                    Index="15" TemplateId="DeviceStatus_Template">
                                    <TemplateSettings TemplateId="DeviceStatus_Template" />
                                </obout:Column>
                                <obout:Column ID="Column22" DataField="C3" Width="95" HeaderText="Validate Status"
                                    ConvertEmptyStringToNull="False" Index="16" />
                                <obout:Column Width="100" ConvertEmptyStringToNull="False" Index="17" TemplateId="tplViewUsersInDeviceBtn">
                                    <TemplateSettings TemplateId="tplViewUsersInDeviceBtn" />
                                </obout:Column>
                                <obout:Column ID="Column18" DataField="C5" Visible="False" Width="300" HeaderText="C5"
                                    ConvertEmptyStringToNull="False" Index="18" />
                                <obout:Column ID="Column16" DataField="C6" Visible="False" Width="300" HeaderText="C6"
                                    ConvertEmptyStringToNull="False" Index="19" />
                                <obout:Column ID="Column17" DataField="C7" Visible="False" Width="300" HeaderText="C7"
                                    ConvertEmptyStringToNull="False" Index="20" />
                                <obout:Column HeaderText="Edit" Width="45" AllowEdit="True" AllowDelete="True" ConvertEmptyStringToNull="False"
                                    Index="21" TemplateId="tplEditBtn">
                                    <TemplateSettings TemplateId="tplEditBtn" />
                                </obout:Column>
                                <obout:Column HeaderText="Delete" Width="80" AllowDelete="True" ConvertEmptyStringToNull="False"
                                    Index="22" />
                                <obout:Column ID="Column19" DataField="FaceDeviceType" Visible="false" Width="300"
                                    HeaderText="FaceDeviceType" ConvertEmptyStringToNull="False" Index="23" />
                                <obout:Column ID="Column20" DataField="MasterId" Visible="false" Width="300" HeaderText="MasterId"
                                    ConvertEmptyStringToNull="False" Index="24" />
                                <obout:Column ID="Column21" DataField="DeviceActivationCode" Visible="False" Width="200"
                                    HeaderText="DeviceActivationCode" ConvertEmptyStringToNull="False" Index="25" />
                            </Columns>
                            <Templates>
                                <obout:GridTemplate runat="server" ID="tplEditBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                            class="ob_gAL">Edit</a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplAddBtn">
                                    <Template>
                                        <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add')" class="ob_gAL">
                                            <%#CheckPermissions("Add")%>
                                        </a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplViewUsersInDeviceBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Style="cursor: hand;" Text="View Users"
                                            NavigateUrl='<%# "~/Manage/DeviceUsers.aspx?DeviceId=" + Container.DataItem.Item("DeviceId")+"&DeviceSName=" + Container.DataItem.Item("DeviceSName")+"&SerialNumber=" + Container.DataItem.Item("SerialNumber") +"&FaceDeviceType=" + Container.DataItem.Item("FaceDeviceType") +"&MasterId=0"%>'
                                            ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="LastPing_Template" ControlID="" ControlPropertyName="">
                                    <Template>
                                        <%#ParseLastPing(Container.DataItem.Item("LastPing"))%>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="DeviceStatus_Template" ControlID="" ControlPropertyName="">
                                    <Template>
                                        <asp:Label ID="Label1" runat="server" Text='<%#DeviceStatus(Container.DataItem.Item("LastPing"),Container.DataItem.Item("TimeOut"))%>'
                                            ForeColor='<%#ChangeColorOnDeviceStatusCheck(Container.DataItem("LastPing"),Container.DataItem("TimeOut")) %>'></asp:Label>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="TemplateWithCheckbox">
                                    <Template>
                                        <input type="checkbox" id="chk_grid_<%# Container.DataItem("DeviceId") %>" tooltip='<%# Container.Value %>' />
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplDeviceName">
                                    <Template>
                                        <asp:HyperLink runat="server" Style="text-decoration: none;" Text='<%# Container.Value %>'
                                            NavigateUrl='<%# iif(Container.Value="Mobile","~/Manage/MobileDeviceLogs.aspx?DeviceId=" + Container.DataItem.Item("DeviceId"), "#") %>'
                                            ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </div>
                </td>
            </tr>
        </table>
        <oem:EasyMenu ID="EasyMenu1" runat="server" StyleFolder="~/styles/EasyMenu/Styles/vsnet"
            IconsFolder="MenuIcons" Width="210" UseIcons="true" ShowEvent="ContextMenu" Align="Cursor">
            <Components>
                <oem:MenuItem ID="menuItem4" runat="server">
                    <a id="btn_ClearLogsFromDevice" style="width: 100%;" href="#" runat="server" onclick="return confirm('Are you sure you want to delete all the logs from device.')"
                        onserverclick="btn_ClearLogsFromDevice_onserverclick">Clear Logs From Device</a>
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator2" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="btn_ChangeIpAddress" runat="server" InnerHtml="Change Ip Address"
                    OnClientClick="Wnd_ChangeDeviceDetails_Open('Ip Address');">
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator3" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem3" runat="server">
                    <a id="btn_ResetTransactionStamp" style="width: 100%;" href="#" runat="server" onserverclick="btn_ResetTransactionStamp_onserverclick">
                        Reset Transaction Stamp</a>
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator4" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem5" runat="server">
                    <a id="btn_ResetOpStamp" href="#" style="width: 100%;" runat="server" onserverclick="btn_ResetOpStamp_onserverclick">
                        Reset OpStamp</a>
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator5" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem6" runat="server">
                    <a id="A1" href="#" runat="server" style="width: 100%;" onserverclick="btn_UploadUsersToDevice_onserverclick">
                        Upload Users To Device</a>
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator6" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem7" runat="server" InnerHtml="Change Card Key" OnClientClick="Wnd_ChangeDeviceDetails_Open('Card Key');">
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator7" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem8" runat="server">
                    <a id="btn_RestartDevice" href="#" style="width: 100%;" runat="server" onserverclick="btn_RestartDevice_onserverclick">
                        Restart Device</a>
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator8" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem9" runat="server" InnerHtml="Change SubnetMask" OnClientClick="Wnd_ChangeDeviceDetails_Open('SubnetMask');">
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator9" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem10" runat="server" InnerHtml="Change GateWay" OnClientClick="Wnd_ChangeDeviceDetails_Open('GateWay');">
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator1" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem1" runat="server" InnerHtml="Change WebServerIP" OnClientClick="Wnd_ChangeDeviceDetails_Open('WebServerIP');">
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator10" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                </oem:MenuSeparator>
                <oem:MenuItem ID="menuItem2" runat="server" InnerHtml="Change WebServerPort" OnClientClick="Wnd_ChangeDeviceDetails_Open('WebServerPort');">
                </oem:MenuItem>
            </Components>
        </oem:EasyMenu>
        <obout:Flyout runat="server" ID="Flyout1" Position="BOTTOM_CENTER" CloseEvent="NONE"
            OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Device Information</legend>
                            <table>
                                <tr id="trDeviceName" runat="server">
                                    <td style="font-weight: bold;">
                                        Device Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_DeviceFName" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="font-weight: bold;">
                                        Short Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_DeviceShortName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr id="trSerialNumber" runat="server">
                                    <td style="font-weight: bold;">
                                        Serial Number
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_SerialNo" runat="server"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        Connection Type
                                    </td>
                                    <td>
                                        <select id="drp_ConnectionType" runat="server" onchange="drp_connectionType_SelectIndexChanges();"
                                            style="width: 160px;">
                                            <option selected="selected">Tcp/IP</option>
                                            <option>USB</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr id="trIPAddress" runat="server">
                                    <td style="font-weight: bold;">
                                        Ip Address
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_IpAddress" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Device Location
                                    </td>
                                    <td>
                                        <obout:Combobox Validate="false" ID="drp_Location" runat="server" CssClass="WebControls"
                                            FolderStyle="~/styles/default" Width="160" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                </tr>
                                <tr id="trTimeZone" runat="server">
                                    <td style="font-weight: bold;">
                                        Time Zone
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_TimeZone" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="font-weight: bold;">
                                        Time Out
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_TimeOut" runat="server" Width="130px"></asp:TextBox>&nbsp;Sec
                                    </td>
                                </tr>
                                <tr id="trDeviceDirection" runat="server">
                                    <td>
                                        Device Direction
                                    </td>
                                    <td>
                                        <select id="drp_DeviceDiretion" runat="server" enableviewstate="true">
                                            <option selected="selected">In Device</option>
                                            <option>Out Device</option>
                                            <option>Alternate In/Out Device</option>
                                            <option>System Direction(In/Out) Device</option>
                                        </select>
                                    </td>
                                    <td>
                                        Device Type
                                    </td>
                                    <td colspan="3">
                                        <select id="drp_FaceDeviceType" runat="server" enableviewstate="true">
                                            <option selected="selected">Normal</option>
                                            <option>Android</option>
                                            <option>FaceTMP</option>
                                            <option>ExternalTMP</option>
                                            <option>MUAI</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr id="trDeviceType" runat="server">
                                    <td style="font-weight: bold;">
                                        Device Type
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="rbtn_DeviceType" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True">Attendance</asp:ListItem>
                                            <asp:ListItem>Canteen</asp:ListItem>
                                            <asp:ListItem>Access Control</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <%--<tr >
                                    <td style="font-weight: bold;">
                                        Device&nbsp;Activation&nbsp;Code
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtDeviceActivationCode" runat="server"></asp:TextBox>
                                    </td>
                                </tr>--%>
                                <tr id="trCenterId" runat="server">
                                    <td style="font-weight: bold;">
                                        Center&nbsp;Id
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCenterId" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="font-weight: bold;">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr id="trCenterName" runat="server">
                                    <td style="font-weight: bold;">
                                        Center&nbsp;User&nbsp;Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="font-weight: bold;">
                                        Center&nbsp;Password
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                 <tr id="trMobileTimeZone" runat="server">
                                    <td style="font-weight: bold;">
                                        Time Zone
                                    </td>
                                    <td>
                                        <select id="drp_MobileTimeZone" runat="server" enableviewstate="true">
                                            <option selected="selected">+</option>
                                            <option>-</option>
                                        </select>&nbsp;
                                        <asp:TextBox ID="txt_MobileTimeZone" runat="server" Text="330" Width="134px"></asp:TextBox>&nbsp; GMT in Mins
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
                    <td align="right">
                        <input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                            id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp; &nbsp; &nbsp;
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                        <asp:HiddenField ID="Hdn_DeviceId" runat="server" />
                        <asp:HiddenField ID="Hdn_SerialNumber" runat="server" />
                        <asp:HiddenField ID="Hdn_DeviceName" runat="server" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
        
        <owd:Window ID="Wnd_ChangeDeviceDetails" runat="server" IsModal="true" Height="125"
            Width="380" StyleFolder="~/Styles/mainwindow/blue" Title="Change Device Details"
            VisibleOnLoad="false" ShowCloseButton="false" ShowStatusBar="False" Left="450"
            Top="120">
            <table class="rowEditTable" width="100%" height="100%">
                <tr>
                    <td>
                        <fieldset>
                            <table>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkSelected1" onclick="flip1(this,'0');" runat="server" Text="For Selected Devices" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkAll1" onclick="flip1(this,'1');" runat="server" Text="For All Devices" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_ChangeName" runat="server" Text="Ip Address"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ChangeIpAddress" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:HiddenField ID="hdn_DeviceComm" runat="server" />
                        <asp:Button ID="btn_SaveChange" runat="server" Text="Save" />&nbsp;<input id="btn_CancelSave"
                            onclick="CloseAndClearAll('Wnd_ChangeDeviceDetails');" type="button" value="Close" />&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_Error" runat="server" EnableViewState="false"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>
        &nbsp;
        <owd:Window ID="WndClearLogs" runat="server" IsModal="true" Height="120" Width="330"
            StyleFolder="~/Styles/mainwindow/blue" Title="Clear Logs From Device" VisibleOnLoad="false"
            ShowCloseButton="false" ShowStatusBar="False" Left="450" Top="120">
            <table class="rowEditTable" width="100%" height="100%">
                <tr>
                    <td>
                        <fieldset>
                            <table>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkSelected" onclick="flip(this,'0');" runat="server" Text="For Selected Devices" />
                                        &nbsp;&nbsp;
                                        <asp:CheckBox ID="chkAll" runat="server" onclick="flip(this,'1');" Text="For All Devices" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnOk" runat="server" Text="Ok" />&nbsp;<input id="btnClose" onclick="CloseAndClearAll('WndClearLogs');"
                            type="button" value="Close" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" EnableViewState="false"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>
        &nbsp;
        <owd:Window ID="WndEnrollUser" runat="server" IsModal="true" Height="175" Width="330"
            StyleFolder="~/Styles/mainwindow/blue" Title="Clear Logs From Device" VisibleOnLoad="false"
            ShowCloseButton="false" ShowStatusBar="False" Left="450" Top="120">
            <table class="rowEditTable" width="100%" height="100%">
                <tr>
                    <td>
                        <fieldset>
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="CheckBox1" Checked="true" onclick="flip(this,'0');" runat="server"
                                            Text="For Selected Devices" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        User Device Code
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDeviceCode" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Finger Index Id
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFingerId" Onkeypress="return isNumberKey(event)" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkOverwrite" Text="Overwrite" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnEnrollOk" runat="server" Text="Ok" />&nbsp;<input id="btnEnrollClose"
                            onclick="CloseAndClearAll('WndEnrollUser');" type="button" value="Close" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" EnableViewState="false"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>
        <owd:Window ID="WndEnrollUserFace" runat="server" IsModal="true" Height="155" Width="330"
            StyleFolder="~/Styles/mainwindow/blue" Title="Enroll User Face" VisibleOnLoad="false"
            ShowCloseButton="false" ShowStatusBar="False" Left="450" Top="120">
            <table class="rowEditTable" width="100%" height="100%">
                <tr>
                    <td>
                        <fieldset>
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="CheckBox2" Checked="true" onclick="flip(this,'0');" runat="server"
                                            Text="For Selected Devices" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        User Device Code
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEnrollFaceDeviceCode" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkEnrollFaceOverwrite" Text="Overwrite" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnEnrollUserFaceOK" runat="server" Text="Ok" />&nbsp;<input id="btnEnrollUserFaceClose"
                            onclick="CloseAndClearAll('WndEnrollUserFace');" type="button" value="Close" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" EnableViewState="false"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>
        <owd:Window ID="WndResetLog" runat="server" IsModal="true" Height="160" Width="400"
            StyleFolder="~/Styles/mainwindow/blue" Title="Clear Logs From Device" VisibleOnLoad="false"
            ShowCloseButton="false" ShowStatusBar="False" Left="450" Top="120">
            <table class="rowEditTable" width="100%">
                <tr>
                    <td>
                        <fieldset>
                            <table>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkSelected2" onclick="flip2(this,'0');" runat="server" Text="For Selected Devices" />
                                        &nbsp;
                                        <asp:CheckBox ID="chkAll2" runat="server" onclick="flip2(this,'1');" Text="For All Devices" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Select Date"></asp:Label>&nbsp;
                                        <asp:TextBox ID="txt_Date" AutoComplete="off" runat="server" Width="200px" onkeypress="return AvoidWrite(event);"></asp:TextBox>
                                        <obout:Calendar ID="DateCal" runat="server" DateFormat="yyyy-MM-dd" DatePickerImagePath="~/Images/icon2.gif"
                                            DatePickerMode="True" TextBoxId="txt_Date">
                                        </obout:Calendar>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnResetLogOK" runat="server" Text="Ok" />&nbsp;<input id="btnResetLogClose"
                            onclick="CloseAndClearAll('WndResetLog');" type="button" value="Close" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_ResetLogError" runat="server" EnableViewState="false"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>
        

        <owd:Window ID="WndGetAttLogByDatetime" runat="server" IsModal="true" Height="155" Width="400"
            StyleFolder="~/Styles/mainwindow/blue" Title="Get Att Logs" VisibleOnLoad="false"
            ShowCloseButton="false" ShowStatusBar="False" Left="450" Top="120">
            <table class="rowEditTable" width="100%">
                <tr>
                    <td>
                        <fieldset>
                            <table>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkAttLogSelected" onclick="flipGetAttLog(this,'0');" runat="server" Text="For Selected Devices" />
                                        &nbsp;
                                        <asp:CheckBox ID="chkAttLogAll" runat="server" onclick="flipGetAttLog(this,'1');" Text="For All Devices" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="From Date"></asp:Label>&nbsp;
                                        <asp:TextBox ID="txt_FromDateTime" AutoComplete="off" runat="server" Width="200px"
                                            onkeypress="return AvoidWrite(event);"></asp:TextBox>
                                        <obout:Calendar ID="Calendar1" runat="server" DateFormat="yyyy-MM-dd hh:mm:ss" DatePickerImagePath="~/Images/icon2.gif"
                                            DatePickerMode="True" TextBoxId="txt_FromDateTime" ShowTimeSelector="true">
                                        </obout:Calendar>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text="To Date"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txt_ToDateTime" AutoComplete="off" runat="server" Width="200px" onkeypress="return AvoidWrite(event);"></asp:TextBox>
                                        <obout:Calendar ID="Calendar2" runat="server" DateFormat="yyyy-MM-dd hh:mm:ss" DatePickerImagePath="~/Images/icon2.gif"
                                            DatePickerMode="True" TextBoxId="txt_ToDateTime" ShowTimeSelector="true">
                                        </obout:Calendar>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btn_GetAttLog" runat="server" Text="Ok" />&nbsp;<input id="btn_CloseAttLog"
                            onclick="CloseAndClearAll('WndGetAttLogByDatetime');" type="button" value="Close" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" EnableViewState="false"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>





        <asp:HiddenField ID="hidSelectedCommand" runat="server" />
        <div style="display: none;">
            <asp:Button ID="btnClearGridSelection" runat="server" Text="Close" /></div>
        <asp:HiddenField ID="HiddenSelectedCommandWindow" runat="server" />
    </div>
    </form>
    <script type="text/javascript">
        document.getElementById("ob_drp_LocationContainer").style.zIndex = "99999";
    </script>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("DeviceManagement") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function ParseLastPing(ByVal LastCheckDate As String)
            Try
                If CDate(LastCheckDate) < CDate("1910-01-01") Then
                    Return ""
                Else
                    Return CDate(LastCheckDate).ToString("dd-MMM-yyyy HH:mm")
                End If
            Catch ex As Exception
                Return ""
            End Try
        End Function
        
        Function DeviceStatus(ByVal LastCheckDate As String, ByVal TimeOut As String)
            Try
                If TimeOut = "" Then
                    TimeOut = 300
                End If
            
                If DateDiff(DateInterval.Second, CDate(LastCheckDate), CDate(Now.ToString("dd-MMM-yyyy HH:mm:ss"))) > TimeOut Then
                    Return "offline"
                Else
                    Return "online"
                End If
                Return "offline"
            Catch ex As Exception
                Return "online"
            End Try
        End Function
        
        Function ChangeColorOnDeviceStatusCheck(ByVal LastCheckDate As String, ByVal TimeOut As String) As System.Drawing.Color
            Try
                If TimeOut = "" Then
                    TimeOut = 300
                End If
            
                If DateDiff(DateInterval.Second, CDate(LastCheckDate), CDate(Now.ToString("dd-MMM-yyyy HH:mm:ss"))) > TimeOut Then
                    Return Drawing.Color.Red
                Else
                    Return Drawing.Color.Green
                End If
                Return Drawing.Color.Red
            Catch ex As Exception
                Return Drawing.Color.Red
            End Try
        End Function
        
        'Function ClearAllGridChanges()
            
        '    grid_Devices.SelectedRecords = Nothing          
        '    Return True
            
        'End Function
        
        
    </script>
    <script type="text/javascript">
    
    function flip(cb,strVal)
    {
         if (cb.checked)
         {
            if(strVal=='0')
            {
              document.getElementById('<%=chkAll.ClientID %>').checked=false;
            }
            else
            {
          
              document.getElementById('<%=chkSelected.ClientID %>').checked=false;
            }
         }
    }
        
        
    function flip1(cb,strVal)
    {
         if (cb.checked)
         {
            if(strVal=='0')
            {
              document.getElementById('<%=chkAll1.ClientID %>').checked=false;
            }
            else
            {
             
              document.getElementById('<%=chkSelected1.ClientID %>').checked=false;
            }
         }
    }    
       

    function flip2(cb,strVal)
    {
         if (cb.checked)
         {
            if(strVal=='0')
            {
              document.getElementById('<%=chkAll2.ClientID %>').checked=false;
            }
            else
            {
             
              document.getElementById('<%=chkSelected2.ClientID %>').checked=false;
            }
         }
    }    



    function flipGetAttLog(cb,strVal)
    {
         if (cb.checked)
         {
            if(strVal=='0')
            {
              document.getElementById('<%=chkAttLogAll.ClientID %>').checked=false;
            }
            else
            {
             
              document.getElementById('<%=chkAttLogSelected.ClientID %>').checked=false;
            }
         }
    }    
        
        
    function AlertMessage()
    {
      var hidValue=document.getElementById('<%=hidSelectedCommand.ClientID %>').value;
      if(hidValue=='Clear Logs From Device')
      {
         return confirm('Are you sure you want to delete all the logs from device.');
      }
    }
		        
    function ExecuteCommands()
    {
      var SelectedCommand=document.getElementById('<%=ddlCommand.ClientID %>').value;
      document.getElementById('<%=hidSelectedCommand.ClientID %>').value=SelectedCommand;
      
      if(SelectedCommand=='--Select--')
        {
          alert("Please select command");
        }
      else if(SelectedCommand=='Clear Logs From Device')
        {
          WndClearLogs.setTitle('Clear Logs From Device');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }
      else if(SelectedCommand=='Change Ip Address')
        {
          Wnd_ChangeDeviceDetails_Open('Ip Address');
        }  
      else if(SelectedCommand=='Reset Transaction Stamp')
        {
          WndClearLogs.setTitle('Reset Transaction Stamp');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }
      else if(SelectedCommand=='Reset OpStamp')
        {
          WndClearLogs.setTitle('Reset OpStamp');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }
      else if(SelectedCommand=='Reset AttPhoto Stamp')
        {
            WndClearLogs.setTitle('Reset AttPhoto Stamp');
            WndClearLogs.Open();
            WndClearLogs.screenCenter();
        }
      else if(SelectedCommand=='Change Card Key')
        {
          Wnd_ChangeDeviceDetails_Open('Card Key');
        }
      else if(SelectedCommand=='Restart Device')
        {
          WndClearLogs.setTitle('Restart Device');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }
      else if(SelectedCommand=='Change SubnetMask')
        {
          Wnd_ChangeDeviceDetails_Open('SubnetMask');
        }  
      else if(SelectedCommand=='Change GateWay')
        {
          Wnd_ChangeDeviceDetails_Open('GateWay');
        }  
       else if(SelectedCommand=='Change WebServerIP')
        {
          Wnd_ChangeDeviceDetails_Open('WebServerIP');
        }  
       else if(SelectedCommand=='Change WebServerPort')
        {
          Wnd_ChangeDeviceDetails_Open('WebServerPort');
        }
       else if(SelectedCommand=='Upload Users To Device')
        {
          WndClearLogs.setTitle('Upload Users To Device');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }
       else if(SelectedCommand=='Delete Users From Device')
        {
          WndClearLogs.setTitle('Delete Users To Device');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }        
        else if (SelectedCommand=='Block Users From Device')
        {
           WndClearLogs.setTitle('Block Users From Device');
           WndClearLogs.Open();
           WndClearLogs.screenCenter();
        }   
        else if (SelectedCommand=='UnBlock Users From Device')
        {
           WndClearLogs.setTitle('UnBlock Users From Device');
           WndClearLogs.Open();
           WndClearLogs.screenCenter();
        }   
        else if (SelectedCommand=='Enroll User FP')
        {
           WndEnrollUser.setTitle('Enroll User FP To Device');
           WndEnrollUser.Open();
           WndEnrollUser.screenCenter();
        }       
         else if(SelectedCommand=='Unlock Door')
        {
          WndClearLogs.setTitle('Unlock Door');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }
        else if(SelectedCommand=='Reset Log')
        {
           WndResetLog.setTitle('Reset Log');
           WndResetLog.Open();
           WndResetLog.screenCenter();
        }
        else if(SelectedCommand=='Get All Users')
        {
          WndClearLogs.setTitle('Get All Users');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }
        else if(SelectedCommand=='Delete All Users')
        {
          WndClearLogs.setTitle('Delete All Users');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }
        else if(SelectedCommand=='Delete All Logs')
        {
          WndClearLogs.setTitle('Delete All Logs');
          WndClearLogs.Open();
          WndClearLogs.screenCenter();
        }
        else if (SelectedCommand=='Enroll User Face')
        {
           WndEnrollUserFace.setTitle('Enroll User Face To Device');
           WndEnrollUserFace.Open();
           WndEnrollUserFace.screenCenter();
        }  
        
          else if (SelectedCommand=='Enroll User Face Ex')
        {
           WndEnrollUserFace.setTitle('Enroll User Face To Device');
           WndEnrollUserFace.Open();
           WndEnrollUserFace.screenCenter();
        }  
         
        else if(SelectedCommand=='Get ATTLOG By Datetime')
        {
          WndGetAttLogByDatetime.setTitle('Get ATTLOG By Datetime');
          WndGetAttLogByDatetime.Open();
          WndGetAttLogByDatetime.screenCenter();
        }    
        
    }
    
    function Wnd_ChangeDeviceDetails_Open(Action)
    {
        if(Action=='Ip Address')
        {
            document.getElementById('<%=lbl_ChangeName.ClientID %>').innerHTML='Ip Address';
            document.getElementById('<%=hdn_DeviceComm.ClientID %>').value='Ip Address';
            document.getElementById('<%=txt_ChangeIpAddress.ClientID %>').value=document.getElementById('<%=txt_IpAddress.ClientID %>').value;
        }
        else
        {
            document.getElementById('<%=txt_ChangeIpAddress.ClientID %>').value='';
            document.getElementById('<%=lbl_ChangeName.ClientID %>').innerHTML=Action;
            document.getElementById('<%=hdn_DeviceComm.ClientID %>').value=Action;
        }
        Wnd_ChangeDeviceDetails.Open();
        Wnd_ChangeDeviceDetails.screenCenter();
        return false;

    }
		    
		    function attachFlyoutToLink(oLink,Action)
		        {	
                    var  rowIndex =oLink.id.toString().replace("grid_link_", "");
                    if(Action=='Update')
                    {
                        if (grid_Devices.Rows[rowIndex].Cells[2].Value=='Mobile')
                        {
                          //alert('Cannot edit this device');
                           document.getElementById("<%=trMobileTimeZone.ClientID %>").style.display="";  
                           document.getElementById("<%=trDeviceName.ClientID %>").style.display="none";  
                           document.getElementById("<%=trSerialNumber.ClientID %>").style.display="none";  
                           document.getElementById("<%=trIPAddress.ClientID %>").style.display="none";  
                           document.getElementById("<%=trTimeZone.ClientID %>").style.display="none";  
                           document.getElementById("<%=trDeviceDirection.ClientID %>").style.display="none";  
                           document.getElementById("<%=trDeviceType.ClientID %>").style.display="none";  
                           document.getElementById("<%=trCenterId.ClientID %>").style.display="none";  
                           document.getElementById("<%=trCenterName.ClientID %>").style.display="none";  

                           <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	                       <%=Flyout1.getClientID()%>.Open();
	                       clearFlyout();
                          if(Action=='Update')
	                      {
	                         populateEditControls(oLink.id.toString().replace("grid_link_", ""));
	                      }
                          return true;
                        }
                    }
                      
                      document.getElementById("<%=trMobileTimeZone.ClientID %>").style.display="none";        
                      document.getElementById("<%=trDeviceName.ClientID %>").style.display="";  
                      document.getElementById("<%=trSerialNumber.ClientID %>").style.display="";  
                      document.getElementById("<%=trIPAddress.ClientID %>").style.display="";  
                      document.getElementById("<%=trTimeZone.ClientID %>").style.display="";  
                      document.getElementById("<%=trDeviceDirection.ClientID %>").style.display="";  
                      document.getElementById("<%=trDeviceType.ClientID %>").style.display="";  
                      document.getElementById("<%=trCenterId.ClientID %>").style.display="";  
                      document.getElementById("<%=trCenterName.ClientID %>").style.display="";   

                      <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	                  <%=Flyout1.getClientID()%>.Open();
	                  clearFlyout();
	                  if(Action=='Update')
	                  {
	                    populateEditControls(oLink.id.toString().replace("grid_link_", ""));
	                  }
		        }
		        
		        function GetSerialNumber(Sender)
		        {
		            var id=Sender.id;
		            document.getElementById('<%=Hdn_SerialNumber.ClientID %>').value=id.replace('lnkDevice_','')
		        }
                
		    
		    function closeFlyout() 
		        {
		            <%=Flyout1.getClientID()%>.Close();
		        }

              
		        
		        function drp_connectionType_SelectIndexChanges()
		        {
		            var ConnectionType=document.getElementById("<%=drp_ConnectionType.ClientID %>").value;
		            if(ConnectionType=='Tcp/IP')
		                document.getElementById("<%=txt_IpAddress.ClientID %>").disabled=false;
		            else
		                document.getElementById("<%=txt_IpAddress.ClientID %>").disabled=true;
		        }
		       
		    
		    function populateEditControls(iRecordIndex) 
		        {	
		            document.getElementById("<%=Hdn_DeviceId.ClientID%>").value =grid_Devices.Rows[iRecordIndex].Cells[0].Value;
		            document.getElementById("<%=txt_DeviceShortName.ClientID%>").value = grid_Devices.Rows[iRecordIndex].Cells[2].Value;
		            document.getElementById("<%=txt_DeviceFName.ClientID%>").value = grid_Devices.Rows[iRecordIndex].Cells[3].Value;
		            document.getElementById( "<%=txt_SerialNo.ClientID %>").value = grid_Devices.Rows[iRecordIndex].Cells[4].Value;
		        document.getElementById("ob_drp_LocationTextbox").value=grid_Devices.Rows[iRecordIndex].Cells[13].Value;
		            var Direction=grid_Devices.Rows[iRecordIndex].Cells[5].Value;
		            if(Direction=='in')
		                document.getElementById("<%=drp_DeviceDiretion.ClientID %>").value='In Device';
		            
		            else if(Direction=='out')
		                document.getElementById("<%=drp_DeviceDiretion.ClientID %>").value="Out Device"
		            
		            else if(Direction=='altinout')
		                document.getElementById("<%=drp_DeviceDiretion.ClientID %>").value="Alternate In/Out Device"
		            
		            else if(Direction=='inout')
		                document.getElementById("<%=drp_DeviceDiretion.ClientID %>").value="System Direction(In/Out) Device"
		                
		            document.getElementById("<%=txt_IpAddress.ClientID %>").value = grid_Devices.Rows[iRecordIndex].Cells[6].Value;
		            document.getElementById("<%=drp_ConnectionType.ClientID %>").value = grid_Devices.Rows[iRecordIndex].Cells[7].Value;
		            
		            var DeviceType=grid_Devices.Rows[iRecordIndex].Cells[8].Value;
                document.getElementById('<%=txt_TimeZone.ClientID %>').disabled=false; 
                document.getElementById('<%=txt_TimeOut.ClientID %>').disabled=false; 
                
		             document.getElementById("<%=txt_TimeZone.ClientID%>").value = grid_Devices.Rows[iRecordIndex].Cells[11].Value;
		             document.getElementById("<%=txt_TimeOut.ClientID%>").value = grid_Devices.Rows[iRecordIndex].Cells[12].Value;
		             document.getElementById("<%=txtCenterId.ClientID%>").value = grid_Devices.Rows[iRecordIndex].Cells[18].Value;
		             document.getElementById("<%=txtUserName.ClientID%>").value = grid_Devices.Rows[iRecordIndex].Cells[19].Value;
		             document.getElementById("<%=txtPassword.ClientID%>").value = grid_Devices.Rows[iRecordIndex].Cells[20].Value;
                     document.getElementById("<%=drp_FaceDeviceType.ClientID %>").value = grid_Devices.Rows[iRecordIndex].Cells[23].Value;
	             
		            if(DeviceType=='Attendance')
                       document.getElementById("Flyout1_rbtn_DeviceType_0").checked=true;
		            
		            else if(DeviceType=='Canteen')
                       document.getElementById("Flyout1_rbtn_DeviceType_1").checked=true;
		            
		            else if(DeviceType=='Access Control')
                       document.getElementById("Flyout1_rbtn_DeviceType_2").checked=true;
		            drp_connectionType_SelectIndexChanges();



                    // only for mobile device edit
                    
                    if(grid_Devices.Rows[iRecordIndex].Cells[2].Value=="Mobile")
                    {
                      var  timeZoneValue=grid_Devices.Rows[iRecordIndex].Cells[11].Value;
                      if(timeZoneValue.includes("-"))
                      {
                         document.getElementById("<%=drp_MobileTimeZone.ClientID %>").selectedIndex = 1;
                         document.getElementById("<%=txt_MobileTimeZone.ClientID%>").value = timeZoneValue.replace("-","");
                      }
                      else
                      {
                         document.getElementById("<%=drp_MobileTimeZone.ClientID %>").selectedIndex = 0;
                         document.getElementById("<%=txt_MobileTimeZone.ClientID%>").value = timeZoneValue.replace("+","");
                      }

                    }


		        }


                
		      
		       function btn_Save_onclick()
		        {
		            var oRecord = new Object();
	                oRecord.DeviceId =document.getElementById("<%=Hdn_DeviceId.ClientID %>").value ;
		        oRecord.Location=document.getElementById("ob_drp_LocationTextbox").value;
	                oRecord.Error='';
	                 if(document.getElementById("Flyout1_rbtn_DeviceType_0").checked ==  true)
		                    oRecord.ShiftType='Attendance';
		             else if(document.getElementById("Flyout1_rbtn_DeviceType_1").checked ==  true)
		                    oRecord.ShiftType='Canteen';
		             else if(document.getElementById("Flyout1_rbtn_DeviceType_2").checked ==  true)
		                    oRecord.ShiftType='Access Control';
	                grid_Devices.executeInsert(oRecord);
		        }


               
		    
            function clearFlyout()
            {
		        document.getElementById("<%=txt_DeviceFName.ClientID%>").value = '';
		        document.getElementById("<%=txt_DeviceShortName.ClientID%>").value = '';
		        document.getElementById( "<%=txt_SerialNo.ClientID %>").value = '';
		        document.getElementById("<%=drp_DeviceDiretion.ClientID %>").selectedIndex=0;
		        document.getElementById("<%=drp_ConnectionType.ClientID %>").selectedIndex=0;
		        document.getElementById("<%=txt_IpAddress.ClientID %>").value = '';
		        document.getElementById("<%=Hdn_DeviceId.ClientID%>").value = '0';
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		        document.getElementById("<%=txt_TimeZone.ClientID%>").value = '330';
		        document.getElementById("<%=txt_TimeOut.ClientID%>").value = '300';
                document.getElementById('<%=txt_TimeZone.ClientID %>').disabled=true; 
                document.getElementById('<%=txt_TimeOut.ClientID %>').disabled=true; 
                document.getElementById("Flyout1_rbtn_DeviceType_0").checked=true;
                document.getElementById("<%=txtCenterId.ClientID%>").value = '';
                document.getElementById("<%=txtUserName.ClientID%>").value = '';
                document.getElementById("<%=txtPassword.ClientID%>").value = '';
                document.getElementById("<%=drp_FaceDeviceType.ClientID %>").selectedIndex=0;
		        drp_connectionType_SelectIndexChanges();
                                
                document.getElementById("<%=drp_MobileTimeZone.ClientID %>").selectedIndex=0;
                document.getElementById("<%=txt_MobileTimeZone.ClientID%>").value = '330';

		        
		    }
		    
		    function RefreshDataGrid()
            {
                grid_Devices.refresh();
                window.setTimeout('RefreshDataGrid()', 15000);
            }

    function CloseAndClearAll(CommandWindowName)
    {
        document.getElementById("HiddenSelectedCommandWindow").value=CommandWindowName;
        document.getElementById("btnClearGridSelection").click();

     
    }
//                window.setTimeout('RefreshDataGrid()', 15000);
function btnExecuteCommand_onclick() {

}

    </script>
    <script type="text/javascript">
        assignEventsToCheckboxes();

        var sDeselectRecordsIds = grid_Devices.getRecordsIds();
        if (sDeselectRecordsIds != null && sDeselectRecordsIds.length > 0) {
            var arrRecordsDeselectIds = sDeselectRecordsIds.split(",");
            for (var i = 0; i < arrRecordsDeselectIds.length; i++) {
                grid_Devices.deselectRecord(i);

            }
        }
    </script>
</body>
</html>
