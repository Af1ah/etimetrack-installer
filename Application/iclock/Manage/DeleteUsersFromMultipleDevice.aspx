<%@ page language="VB" autoeventwireup="false" inherits="Manage_DeleteUsersFromMultipleDevice, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script type="text/javascript">
		    

            function SelectDeselect(oCheckbox) {
                var oElement = oCheckbox.parentNode;
                while(oElement != null && oElement.nodeName != "TR") {
                    oElement = oElement.parentNode;
                }

                if(oElement != null) {
                    // oElement represents the row where the clicked      
                            // checkbox reside
                    var oContainer = oElement.parentNode;
                    var iRecordIndex = -1;
                    for(var i=0; i<oContainer.childNodes.length; i++) {
                        if(oContainer.childNodes[i] == oElement) {
                            iRecordIndex = i;
                            break;
                        }
                    }
                   
                    if(iRecordIndex != -1) {
                        if(oCheckbox.checked == true) {
                            // select the record
                            Dg_Employees.selectRecord(iRecordIndex);
                        } else {
                            // deselect the record
                            Dg_Employees.deselectRecord(iRecordIndex);
                        }
                    }
                }
            }
            
            
            function SelectDeselectDiv(oCheckbox) {
                var oElement = oCheckbox.parentNode;
                while(oElement != null && oElement.nodeName != "TR") {
                    oElement = oElement.parentNode;
                }

                if(oElement != null) {
                    // oElement represents the row where the clicked      
                            // checkbox reside
                    var oContainer = oElement.parentNode;
                    var iRecordIndex = -1;
                    for(var i=0; i<oContainer.childNodes.length; i++) {
                        if(oContainer.childNodes[i] == oElement) {
                            iRecordIndex = i;
                            break;
                        }
                    }
                   
                    if(iRecordIndex != -1) {
                        if(oCheckbox.checked == true) {
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
                if(!e){e=window.event;}
	            if(!e){return false;}
	            e.cancelBubble=true;
	            if(e.stopPropagation){e.stopPropagation();}
            }

            function assignEventsToCheckboxes() {
            
                assignEventsToDevCheckboxes();
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
			function checkAll(){
			    var newState = document.getElementById("chk_all").checked;

			    var inputArr = document.getElementsByTagName("INPUT");
			    for ( i=0; i< inputArr.length; i++){
			        var e = inputArr[i];
			        if ( e && e.type == "checkbox" && e.id != null && e.id.indexOf("chk_grid_") == 0 ){
			            e.checked = newState;
			            var oElement = e.parentNode.parentNode.parentNode;
			            var oContainer = oElement.parentNode;
			            if ( oElement && oContainer){
                            var iRecordIndex = -1;
                            for(var j=0; j<oContainer.childNodes.length; j++) {
                                if(oContainer.childNodes[j] == oElement) {
                                    iRecordIndex = j;
                                    break;
                                }
                            }
                           
                            if(iRecordIndex != -1) {
			                    if(newState == true) {
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
			
			
			 function assignEventsToDevCheckboxes() {
            
                // disable the record selection feature by clicking on the records
                var sRecordsIds = grid_Devices.getRecordsIds(); 
                var arrRecordsIds = sRecordsIds.split(",");
                for(var i=0; i<arrRecordsIds.length; i++) {
                    var oRecord = document.getElementById(arrRecordsIds[i]);
                    oRecord.onmousedown = function(e) {stopEventPropagation(e);};
                    oRecord.onclick = function(e) {stopEventPropagation(e);};
                }
                
                // populate the previously checked checkboxes
                var arrPageSelectedRecords = grid_Devices.PageSelectedRecords;
                
                for(var i=0; i<arrPageSelectedRecords.length; i++) {                    
                    var oCheckbox = document.getElementById("chk_div_" + arrPageSelectedRecords[i].DeviceId);
                    oCheckbox.checked = true;
                }
            
                // enable the record selection feature by selecting the checkboxes
                var arrCheckboxes = document.getElementsByTagName("INPUT");  

                for(var i=0; i<arrCheckboxes.length; i++) {      
                    if(arrCheckboxes[i].type == "checkbox" && arrCheckboxes[i].id.indexOf("chk_div_") == 0) {
                        arrCheckboxes[i].onmousedown = function(e) {stopEventPropagation(e);};
                        arrCheckboxes[i].onclick = function(e) {SelectDeselectDiv(this);stopEventPropagation(e);};
                    }
                }
            }
            
            function checkAllDiv(){
			    var newState = document.getElementById("chk_Divall").checked;

			    var inputArr = document.getElementsByTagName("INPUT");
			    for ( i=0; i< inputArr.length; i++){
			        var e = inputArr[i];
			        if ( e && e.type == "checkbox" && e.id != null && e.id.indexOf("chk_div_") == 0 ){
			            e.checked = newState;
			            var oElement = e.parentNode.parentNode.parentNode;
			            var oContainer = oElement.parentNode;
			            if ( oElement && oContainer){
                            var iRecordIndex = -1;
                            for(var j=0; j<oContainer.childNodes.length; j++) {
                                if(oContainer.childNodes[j] == oElement) {
                                    iRecordIndex = j;
                                    break;
                                }
                            }
                           
                            if(iRecordIndex != -1) {
			                    if(newState == true) {
                                    // select the record
                                    grid_Devices.selectRecord(iRecordIndex);
                                } else {
                                    // deselect the record
                                    grid_Devices.deselectRecord(iRecordIndex);
                                }
                            }
                        }
			        }
			    }
			}
			
          
    </script>

    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td id="Td1" runat="server"  style="font-weight: bold; font-size: 14px;
                        background-color: lightsteelblue; padding: 5px; color: white;">
                        Delete Users From Multiple Device <b></b>
                    </td>
                         <td align="right">
                        Status&nbsp;
                        <asp:DropDownList ID="drp_FilterStatus" Width="96px" runat="server" AutoPostBack="true">
                        </asp:DropDownList>
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
                            <obout:Grid ID="Dg_Employees" runat="server" CallbackMode="true" Serialize="false"
                                AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                AllowMultiRecordDeleting="true" AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false"
                                GenerateRecordIds="true" AllowFiltering="true">
                                <ClientSideEvents OnClientCallback="assignEventsToCheckboxes" />
                                <Columns>
                                    <obout:Column ID="Column10" Width="50" HeaderText="Select" runat="server">
                                        <TemplateSettings TemplateId="CheckTemplate" HeaderTemplateId="CheckAllTemplate" />
                                    </obout:Column>
                                    <obout:Column ID="Column2" Align="left" DataField="EmployeeId" Visible="false" Width="100"
                                        HeaderText="ShiftId" runat="server" />
                                    <obout:Column ID="Column11" DataField="EmployeeCodeInDevice" Visible="true" Width="120"
                                        HeaderText="Device Code" runat="server" />
                                    <obout:Column ID="Column1" DataField="EmployeeCode" Visible="true" Width="110" HeaderText="Emp Code"
                                        runat="server" />
                                    <obout:Column ID="Column7" DataField="EmployeeName" Visible="true" Width="130" HeaderText="Emp Name"
                                        runat="server" />
                                    <obout:Column ID="Column3" DataField="CompanySName" Visible="true" Width="110" HeaderText="Company"
                                        runat="server" />
                                    <obout:Column ID="Column4" DataField="DepartmentSName" Visible="true" Width="120"
                                        HeaderText="Department" runat="server" />
                                    <obout:Column ID="Column33" DataField="Designation" Visible="true" Width="120"
                                        HeaderText="Designation" runat="server" />
                                    <obout:Column ID="Column39" DataField="Location" Visible="true" Width="130" HeaderText="Location"
                                        runat="server" />
                                    <obout:Column ID="Column5" DataField="EmployeeDeviceGroup" Visible="true" Width="80"
                                        HeaderText="Group Id" runat="server" />
                                    <obout:Column ID="Column6" DataField="EmployeeRFIDNumber" Visible="true" Width="120"
                                        HeaderText="Card Number" runat="server" />
                                    <obout:Column ID="Column8" Visible="true" Width="80" HeaderText="Password" runat="server">
                                        <TemplateSettings TemplateId="DevicePassword_Template" />
                                    </obout:Column>
                                    <obout:Column ID="Column9" DataField="FPCount" Visible="true" Width="100" HeaderText="FingerPrint"
                                        runat="server" />
                                    <obout:Column ID="Column12" DataField="DevicePassword" Visible="false" Width="120"
                                        HeaderText="Card Number" runat="server" />
                                    <obout:Column ID="Column30" DataField="PalmCount" Visible="true" Width="75" HeaderText="Palm"
                                        runat="server">
                                        <TemplateSettings TemplateId="PalmCount_Template" />
                                    </obout:Column>
                                    <obout:Column ID="Column31" DataField="FaceCount" Visible="true" Width="80" HeaderText="Face"
                                        runat="server">
                                        <TemplateSettings TemplateId="FaceCount_Template" />
                                    </obout:Column>

                                      <obout:Column ID="Column40" DataField="AIFaceCount" Visible="true" Width="80" HeaderText="AIFace"
                                    runat="server">
                                    <TemplateSettings TemplateId="AIFaceCount_Template" />
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
                                    <obout:GridTemplate runat="server" ID="DevicePassword_Template" ControlID="" ControlPropertyName="">
                                        <Template>
                                            <%#ParseEmployeeDevicePassword(Container.DataItem.Item("DevicePassword"))%>
                                        </Template>
                                    </obout:GridTemplate>
                                    <obout:GridTemplate runat="server" ID="PalmCount_Template" ControlID="" ControlPropertyName="">
                                        <Template>
                                            <%#ParseEmployeePalmCount(Container.DataItem.Item("PalmCount"))%>
                                        </Template>
                                    </obout:GridTemplate>
                                    <obout:GridTemplate runat="server" ID="FaceCount_Template" ControlID="" ControlPropertyName="">
                                        <Template>
                                            <%#ParseEmployeeFaceCount(Container.DataItem.Item("FaceCount"))%>
                                        </Template>
                                    </obout:GridTemplate>
                                     <obout:GridTemplate runat="server" ID="AIFaceCount_Template" ControlID="" ControlPropertyName="">
                                    <Template>
                                        <%# ParseEmployeeAIFaceCount(Container.DataItem.Item("AIFaceCount"))%>
                                    </Template>
                                </obout:GridTemplate>
                                </Templates>
                            </obout:Grid>
                        </div>
                        <div id="div_Devices">
                            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                                    <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                                        padding: 5px; color: white; height: 27px;">
                                        Select Devices
                                    </td>
                                    <td align="right">
                                        &nbsp;&nbsp; Location &nbsp;<asp:DropDownList ID="drp_FilterLocation" runat="server"
                                            >
                                        </asp:DropDownList>&nbsp;Device Type
                                    <asp:DropDownList ID="drp_FilterDeviceType" runat="server" Width="100" AutoPostBack="true">
                                        <asp:ListItem Value="Normal">Normal</asp:ListItem>
                                         <asp:ListItem Value="Android">Android</asp:ListItem>
                                        <asp:ListItem Value="FaceTMP">FaceTMP</asp:ListItem>
                                        <asp:ListItem Value="ExternalTMP">ExternalTMP</asp:ListItem>
                                        <asp:ListItem Value="MUAI">MUAI</asp:ListItem>
                                    </asp:DropDownList>
                                        <input type="button" class="tdText" value="Refresh" onclick="grid_Devices.refresh()"
                                            id="btn_Refresh" />
                                    </td>
                                </tr>
                                <tr style="background-color: lightsteelblue;">
                                    <td colspan="2">
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div id="div1">
                                            <obout:Grid ID="grid_Devices" runat="server" CallbackMode="true" Serialize="false" 
                                                AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                                AllowMultiRecordDeleting="true" AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false"
                                                GenerateRecordIds="true" AllowFiltering="true">
                                                 <ClientSideEvents OnClientCallback="assignEventsToDevCheckboxes" />
                                                <Columns>
                                                    <obout:Column ID="Column28" HeaderText="SELECT" Width="70" runat="server" Index="0">
                                                        <TemplateSettings TemplateId="TemplateWithCheckbox" HeaderTemplateId="GridDivHeaderTemplate" />
                                                    </obout:Column>
                                                    <obout:Column ID="Column13" DataField="DeviceId" Visible="False" Width="300" HeaderText="DeviceId"
                                                        ConvertEmptyStringToNull="False" Index="1" />
                                                    <obout:Column ID="Column14" DataField="DeviceSName" SortOrder="Asc" Width="125" HeaderText="Device Name"
                                                        ConvertEmptyStringToNull="False" Index="2" />
                                                    <obout:Column ID="Column15" DataField="DeviceFName" Visible="False" Width="250" HeaderText="DeviceFName"
                                                        ConvertEmptyStringToNull="False" Index="3" />
                                                    <obout:Column ID="Column16" DataField="SerialNumber" Width="150" HeaderText="Serial No."
                                                        ConvertEmptyStringToNull="False" Index="4" />
                                                    <obout:Column ID="Column17" DataField="DeviceDirection" Width="130" HeaderText="Device Direction"
                                                        ConvertEmptyStringToNull="False" Index="5" />
                                                    <obout:Column ID="Column18" DataField="IpAddress" Visible="False" Width="300" HeaderText="IpAddress"
                                                        ConvertEmptyStringToNull="False" Index="6" />
                                                    <obout:Column ID="Column19" DataField="ConnectionType" Visible="False" Width="300"
                                                        HeaderText="ConnectionType" ConvertEmptyStringToNull="False" Index="7" />
                                                    <obout:Column ID="Column20" DataField="DeviceType" Visible="False" Width="130" HeaderText="DeviceType"
                                                        ConvertEmptyStringToNull="False" Index="8">
                                                    </obout:Column>
                                                    <obout:Column ID="Column21" DataField="TransactionStamp" Width="90" HeaderText="T Stamp"
                                                        ConvertEmptyStringToNull="False" Index="9" />
                                                    <obout:Column ID="Column22" DataField="OpStamp" Width="95" HeaderText="Op Stamp"
                                                        ConvertEmptyStringToNull="False" Index="10" />
                                                    <obout:Column ID="Column23" DataField="TimeZone" Width="105" HeaderText="Time Zone"
                                                        ConvertEmptyStringToNull="False" Index="11" />
                                                    <obout:Column ID="Column24" DataField="TimeOut" Visible="False" Width="120" HeaderText="TimeOut"
                                                        ConvertEmptyStringToNull="False" Index="12" />
                                                    <obout:Column ID="Column25" DataField="DeviceLocation" Width="148" HeaderText="Location"
                                                        ConvertEmptyStringToNull="False" Index="13">
                                                    </obout:Column>
                                                    <obout:Column ID="Column26" Width="130" HeaderText="Last Ping" DataField="LastPing"
                                                        ConvertEmptyStringToNull="False" Index="14" TemplateId="LastPing_Template">
                                                        <TemplateSettings TemplateId="LastPing_Template" />
                                                    </obout:Column>
                                                    <obout:Column ID="Column27" Width="115" HeaderText="Device Status" ConvertEmptyStringToNull="False"
                                                        Index="15" TemplateId="DeviceStatus_Template">
                                                        <TemplateSettings TemplateId="DeviceStatus_Template" />
                                                    </obout:Column>
                                                    <obout:Column ID="Column29" DataField="MasterId" Visible="false" Width="148" HeaderText="MasterId"
                                                        ConvertEmptyStringToNull="False" Index="16">
                                                    </obout:Column>
                                                     <obout:Column ID="Column32" DataField="FaceDeviceType" Visible="False" Width="120"
                                                    HeaderText="FaceDeviceType" ConvertEmptyStringToNull="False" Index="17" />
                                                </Columns>
                                                <Templates>
                                                    <obout:GridTemplate runat="server" ID="TemplateWithCheckbox">
                                                        <Template>
                                                            <input type="checkbox" id="chk_div_<%# Container.DataItem("DeviceId") %>" />
                                                        </Template>
                                                    </obout:GridTemplate>
                                                    <obout:GridTemplate runat="server" ID="GridDivHeaderTemplate">
                                                        <Template>
                                                            <input type="checkbox" id="chk_Divall" onclick="checkAllDiv();" />
                                                        </Template>
                                                    </obout:GridTemplate>
                                                    <obout:GridTemplate runat="server" ID="LastPing_Template">
                                                        <Template>
                                                            <%#ParseLastPing(Container.DataItem.Item("LastPing"))%>
                                                        </Template>
                                                    </obout:GridTemplate>
                                                    <obout:GridTemplate runat="server" ID="DeviceStatus_Template">
                                                        <Template>
                                                            <asp:Label ID="Label1" runat="server" Text='<%#DeviceStatus(Container.DataItem.Item("LastPing"),Container.DataItem.Item("TimeOut"))%>'
                                                                ForeColor='<%#ChangeColorOnDeviceStatusCheck(Container.DataItem("LastPing"),Container.DataItem("TimeOut")) %>'></asp:Label>
                                                        </Template>
                                                    </obout:GridTemplate>
                                                </Templates>
                                            </obout:Grid>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2" style="font-size: 12px; background-color: lightsteelblue;"
                        height="50">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_Delete" runat="server" Text="Delete" />&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

<script runat="server">
    Function ParseEmployeeDevicePassword(ByVal DevicePassword As String) As String
        Try
            If DevicePassword = "" Or DevicePassword = "0" Then
                Return "No"
            Else
                Return "Yes"
            End If
                
        Catch ex As Exception
            Return ""
        End Try
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
    
    Function ParseEmployeeFaceCount(ByVal FaceCount As String) As String
        Try
            If CInt(FaceCount) > 0 Then
                Return "1"
            Else
                Return "0"
            End If
                
        Catch ex As Exception
            Return "0"
        End Try
    End Function
    
    Function ParseEmployeePalmCount(ByVal PalmCount As String) As String
        Try
            If CInt(PalmCount) > 0 Then
                Return "1"
            Else
                Return "0"
            End If
                
        Catch ex As Exception
            Return "0"
        End Try
    End Function
    
    Function ParseEmployeeAIFaceCount(ByVal FaceCount As String) As String
        Try
            If CInt(FaceCount) > 0 Then
                Return "1"
            Else
                Return "0"
            End If
                
        Catch ex As Exception
            Return "0"
        End Try
    End Function
    
  
</script>

<script type="text/javascript">

var oldonload = window.onload;
if (typeof window.onload != 'function') {
    window.onload = assignEventsToCheckboxes;
} else {
    window.onload = function() {
    if (oldonload) {
        oldonload();
    }
    assignEventsToCheckboxes();
    }
}
</script>

