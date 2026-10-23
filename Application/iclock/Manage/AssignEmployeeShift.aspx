<%@ page language="VB" autoeventwireup="false" inherits="Manage_AssignEmployeeShift, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    

    <script type="text/javascript">
		    function selectRecordFromGrid() {
                var iIndex = document.getElementById("txtIndex").value;
                if(iIndex != "") {
                    Dg_Employees.selectRecord(iIndex);
                }
            }
            function deselectRecordFromGrid() {
                var iIndex = document.getElementById("txtIndex").value;
                if(iIndex != "") {
                    Dg_Employees.deselectRecord(iIndex);
                }
            }

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

            function stopEventPropagation(e) {
                if(!e){e=window.event;}
	            if(!e){return false;}
	            e.cancelBubble=true;
	            if(e.stopPropagation){e.stopPropagation();}
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
          
    </script>
</head>
<body >
    <form id="form1" runat="server">
    <div>
    <uctrl:header ID="MyHeader" runat="server" />
            <table width="100px"  cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;background-color: lightsteelblue;">
                <tr>
                    <td  style="font-weight: bold; font-size: 17px; background-color: lightsteelblue;padding:5px; color: white;">
                       Assign Employee Shift
                       <br />
                       <hr />
                    </td>                    
                </tr> 
                <tr>
                    <td colspan="2">
                    <table>                                    
                    <tr style="font-family: Verdana; font-size: 11px; color: #0c416f;">
                    <td style="width: 65px">
                    From Date
                    </td>
                    <td style="width: 179px">
                    <select ID="drp_Fromday"  runat="server"  Width="46px"></select>&nbsp;<select ID="drp_Frommonth" runat="server" EnableViewState="true" Width="48px"></select>&nbsp;<select ID="drp_FromYear" runat="server"  EnableViewState="true" Width="69px"></select>&nbsp;&nbsp;
                    </td>
                    <td style="width: 54px" valign="middle">
                    To Date
                    </td>
                    <td style="width: 196px" align="center" valign="middle">
                        <br />
                    <select ID="drp_Today"  runat="server"  Width="46px"></select>&nbsp;<select ID="drp_Tomonth" runat="server" EnableViewState="true" Width="48px"></select>&nbsp;<select ID="drp_ToYear" runat="server"  EnableViewState="true" Width="69px"></select>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp;</td>
                    <td>
                    <table>
                    <tr>
                    <td>
                    <asp:RadioButtonList ID="rbtn_ShiftOrShiftCalendar" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"><asp:ListItem Selected="True" Value="Shift" >Shift</asp:ListItem><asp:ListItem  Value="ShiftCalendar"   >Shift Calendar</asp:ListItem> </asp:RadioButtonList>
                    </td>
                    <td>
                    &nbsp;
                    </td>
                    <td style="font-family: Verdana; font-size: 11px; color: #0c416f;">
                    Shift
                    </td>
                    <td>
                    <select id="drp_Shift" runat="server" ></select>
                    </td>
                    </tr>
                    </table>
                    </td>
                    
                    </tr>
                    </table>
                    
                    </td>
                </tr>
                <tr style="padding-right: 3px;">
                    <td colspan="2" style="width: 1002px" >
                        
                        
                     <obout:Grid ID="Dg_Employees" runat="server" Serialize="false"  KeepSelectedRecords="true" 
                                        AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                        AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="true" GenerateRecordIds="true" AllowFiltering="true">
                                        <ClientSideEvents OnClientCallback="assignEventsToCheckboxes" />
                                        <Columns>
                                            <obout:Column ID="Column10" HeaderText="Select" runat="server" Width="60">
			                                        <TemplateSettings TemplateID="CheckTemplate" HeaderTemplateID="CheckAllTemplate"/>
			                                 </obout:Column>
                                            <obout:Column ID="Column2" Align="left" DataField="EmployeeId" Visible="false" Width="100"
                                                HeaderText="ShiftId" runat="server" />
                                            <obout:Column ID="Column1" DataField="EmployeeCode" Visible="true" Width="100" HeaderText="Emp Code"
                                                runat="server" />
                                            <obout:Column ID="Column7" DataField="EmployeeName" Visible="true" Width="150" HeaderText="Emp Name"
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
                                            <obout:Column ID="Column9" DataField="EmployementType" Visible="true" Width="105"
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
						                            <input type="checkbox" id="chk_all" onclick="checkAll();"/>
					                            </Template>
				                            </obout:GridTemplate>
                                        </Templates>
                                    </obout:Grid>
	
	</td>
                </tr>
                
                <tr>
                                <td colspan="2" style="width: 1002px">
                            <hr />
                                
                                <table>
                                <tr>
                                <td style="width: 272px">
                                &nbsp;&nbsp;<a  style="font-family:Verdana; font-size: 13px; color: #0c416f;" href="EmployeesShifts.aspx">« Go to Employees Shift</a>
                                </td>
                                
                                
                                <td align="right" style="width: 800px">
                                <table>
                                <tr>
                                <td align="right">
                                <asp:Label ID="lbl_Message" runat="server" EnableViewState="False" ForeColor="Red" Font-Size="12px" Font-Bold="false"></asp:Label>
                                </td>
                                <td align="right">
                                <asp:Button ID="btn_AssignShift" runat="server" Text="Assign Shift" OnClientClick="AssignShift_onClick();" />&nbsp;
                                    <asp:HiddenField ID="hdn_ShifttsIds" runat="server" />
                        <asp:HiddenField ID="hdn_Shiftts" runat="server" />
                        <asp:HiddenField ID="hdn_ShifttCalendarIds" runat="server" />
                        <asp:HiddenField ID="hdn_ShifttCalendar" runat="server" />
                        <asp:HiddenField ID="hdn_ShiftId" runat="server" />
                        <asp:HiddenField ID="hdn_ShiftType" runat="server" />
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
    <script type="text/javascript">
    
            function AssignShift_onClick()
                {
                    document.getElementById("<%=hdn_ShiftId.ClientID %>").value=document.getElementById("<%=drp_Shift.ClientID %>").value
                     if(document.getElementById("rbtn_ShiftOrShiftCalendar_0").checked)
                        document.getElementById("<%=hdn_ShiftType.ClientID %>").value='Shift';
                     else
                        document.getElementById("<%=hdn_ShiftType.ClientID %>").value='ShiftCalendar';
                }
                
            function SetShiftWhilePostback()
            {
                    document.getElementById("<%=drp_Shift.ClientID %>").value=document.getElementById("<%=hdn_ShiftId.ClientID %>").value
                    
                    if(document.getElementById("<%=drp_Shift.ClientID %>").value=='')
		                document.getElementById("<%=drp_Shift.ClientID %>").selectedIndex=0;
            }
            
            function LoadShiftOrShiftCalndar()
	            {
	                var ShiftIds=document.getElementById("<%=hdn_ShifttsIds.ClientID %>").value;
	                var Shift=document.getElementById("<%=hdn_Shiftts.ClientID %>").value;
	                var ShiftCalendarIds=document.getElementById("<%=hdn_ShifttCalendarIds.ClientID %>").value;
	                var ShiftCalendars=document.getElementById("<%=hdn_ShifttCalendar.ClientID %>").value;
                    if(document.getElementById("rbtn_ShiftOrShiftCalendar_0").checked)
                        LoadShifts(ShiftIds,Shift)
                    else
                        LoadShiftCalendar(ShiftCalendarIds,ShiftCalendars)
	            }
	            
	            
        		    
            function LoadShifts(ShiftIds,Shifts)
	            {
	                document.getElementById("<%=drp_Shift.ClientID %>").options.length = 0;
	                var ShiftId=new Array();
	                ShiftId=ShiftIds.split(',');
	                var Shift=new Array();
	                Shift=Shifts.split(',');
	                for(var i=0;i<ShiftId.length;i++)
	                {
	                    var Options=document.createElement("OPTION");
	                    Options.text = Shift[i];
                        Options.value = ShiftId[i];
                        document.getElementById("<%=drp_Shift.ClientID %>").options.add(Options);
	                }
	            }
        		    
	        function LoadShiftCalendar(ShiftCalendarIds,ShiftCalendars)
	            {
                    document.getElementById("<%=drp_Shift.ClientID %>").options.length = 0;
	                var ShiftCalendarId=new Array();
	                ShiftCalendarId=ShiftCalendarIds.split(',');
	                var ShiftCalendar=new Array();
	                ShiftCalendar=ShiftCalendars.split(',');
	                for(var i=0;i<ShiftCalendarId.length;i++)
	                {
	                    var Options=document.createElement("OPTION");
	                    Options.text = ShiftCalendar[i];
                        Options.value = ShiftCalendarId[i];
                        document.getElementById("<%=drp_Shift.ClientID %>").options.add(Options);
	                }
	            }
    </script>
</body>
</html>

<script runat="server">
        
        Function GetDataItemValue(ByVal fieldname As String, ByVal Container As Obout.Grid.TemplateContainer) As String
            
            
            If Container.DataItem(fieldname) Is Nothing Then
                Return Container.DataItem(fieldname.ToUpper)
              
                
            End If
            
            
            Return Container.DataItem(fieldname)
            
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

var sDeselectRecordsIds = Dg_Employees.getRecordsIds();
if (sDeselectRecordsIds != null && sDeselectRecordsIds.length > 0) {
    var arrRecordsDeselectIds = sDeselectRecordsIds.split(",");
    for (var i = 0; i < arrRecordsDeselectIds.length; i++) {
        Dg_Employees.deselectRecord(i);
    }
}
</script>