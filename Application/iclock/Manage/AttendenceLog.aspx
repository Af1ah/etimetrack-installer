<%@ page language="VB" autoeventwireup="false" inherits="Manage_AttendenceLog, App_Web_usmjemmz" enableeventvalidation="false" validaterequest="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET" %>

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
		    document.getElementById("<%=hdn_AttendanceLogId.ClientID %>").value = record.UserId;
	        if(confirm("Are you sure you want to delete? "))
	            return true;
	        else
	            return false;
	    }
	
	function OnDelete(record) 
	{
	    alert(record.Error);
	}
	
	function OnInsert(record) 
	{
		document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = record.Error;
	}
	
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
		    function selectRecordFromGrid() {
                var iIndex = document.getElementById("txtIndex").value;
                if(iIndex != "") {
                    dg_EmployeeAttendeanceLogs.selectRecord(iIndex);
                }
            }
            function deselectRecordFromGrid() {
                var iIndex = document.getElementById("txtIndex").value;
                if(iIndex != "") {
                    dg_EmployeeAttendeanceLogs.deselectRecord(iIndex);
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
                            dg_EmployeeAttendeanceLogs.selectRecord(iRecordIndex);
                        } else {
                            // deselect the record
                            dg_EmployeeAttendeanceLogs.deselectRecord(iRecordIndex);
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
                var sRecordsIds = dg_EmployeeAttendeanceLogs.getRecordsIds();
                if (sRecordsIds != null && sRecordsIds.length > 0) {
                    if (sRecordsIds != '') {
                        var arrRecordsIds = sRecordsIds.split(",");
                        for (var i = 0; i < arrRecordsIds.length; i++) {
                            var oRecord = document.getElementById(arrRecordsIds[i]);
                            oRecord.onmousedown = function (e) { stopEventPropagation(e); };
                            oRecord.onclick = function (e) { stopEventPropagation(e); };
                        }

                        // populate the previously checked checkboxes
                        var arrPageSelectedRecords = dg_EmployeeAttendeanceLogs.PageSelectedRecords;

                        for (var i = 0; i < arrPageSelectedRecords.length; i++) {
                            var oCheckbox = document.getElementById("chk_grid_" + arrPageSelectedRecords[i].AttendanceLogId);
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
                                    dg_EmployeeAttendeanceLogs.selectRecord(iRecordIndex);
                                } else {
                                    // deselect the record
                                    dg_EmployeeAttendeanceLogs.deselectRecord(iRecordIndex);
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
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style=" font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; ">
                   <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white; height: 27px;">
                         Attendance Logs
                    </td> 
                    <td align="right"><asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;</td>
                    
                </tr>
                  <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
                
                <tr >
                   <td  colspan=2 align="right" style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">
                    
                      Attendance Date&nbsp;<asp:DropDownList runat="server" id="drp_FromddDate"  >

                        <asp:ListItem Value="01">1</asp:ListItem>
                    <asp:ListItem Value="02">2</asp:ListItem>
                    <asp:ListItem Value="03">3</asp:ListItem>
                    <asp:ListItem Value="04">4</asp:ListItem>
                    <asp:ListItem Value="05">5</asp:ListItem>
                    <asp:ListItem Value="06">6</asp:ListItem>
                    <asp:ListItem Value="07">7</asp:ListItem>
                    <asp:ListItem Value="08">8</asp:ListItem>
                    <asp:ListItem Value="09">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                    <asp:ListItem Value="13">13</asp:ListItem>
                    <asp:ListItem Value="14">14</asp:ListItem>
                    <asp:ListItem Value="15">15</asp:ListItem>
                    <asp:ListItem Value="16">16</asp:ListItem>
                    <asp:ListItem Value="17">17</asp:ListItem>
                    <asp:ListItem Value="18">18</asp:ListItem>
                    <asp:ListItem Value="19">19</asp:ListItem>
                    <asp:ListItem Value="20">20</asp:ListItem>
                    <asp:ListItem Value="21">21</asp:ListItem>
                    <asp:ListItem Value="22">22</asp:ListItem>                    
                    <asp:ListItem Value="23">23</asp:ListItem>
                    <asp:ListItem Value="24">24</asp:ListItem>
                    <asp:ListItem Value="25">25</asp:ListItem>
                    <asp:ListItem Value="26">26</asp:ListItem>
                    <asp:ListItem Value="27">27</asp:ListItem>
                    <asp:ListItem Value="28">28</asp:ListItem>
                    <asp:ListItem Value="29">29</asp:ListItem>
                    <asp:ListItem Value="30">30</asp:ListItem>
                    <asp:ListItem Value="31">31</asp:ListItem>

                        </asp:DropDownList>
                        Month
                        <asp:DropDownList runat="server" id="drp_FromMMDate" >
                        
                         <asp:ListItem Value="01">1</asp:ListItem>
                    <asp:ListItem Value="02">2</asp:ListItem>
                    <asp:ListItem Value="03">3</asp:ListItem>
                    <asp:ListItem  Value="04">4</asp:ListItem>
                    <asp:ListItem Value="05">5</asp:ListItem>
                    <asp:ListItem Value="06">6</asp:ListItem>
                    <asp:ListItem Value="07">7</asp:ListItem>
                    <asp:ListItem Value="08">8</asp:ListItem>
                    <asp:ListItem Value="09">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                        </asp:DropDownList>
                        Year
                        <asp:DropDownList runat="server" id="drp_FromYYYYDate"   ></asp:DropDownList>
                        Status
                        <asp:DropDownList runat="server" id="drp_AttStatus"  >
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Present</asp:ListItem>
                        <asp:ListItem>Absent</asp:ListItem>
                        <asp:ListItem>Late Coming</asp:ListItem>
                        <asp:ListItem>Early Going</asp:ListItem>
                        <asp:ListItem>On Leave</asp:ListItem>
                        <asp:ListItem>On OutDoor Duty</asp:ListItem>
                        <asp:ListItem>Short Worked</asp:ListItem>
                        <asp:ListItem>Extra Worked</asp:ListItem>
                        <asp:ListItem>Missed Out Punch</asp:ListItem>
                        </asp:DropDownList>
                        

                         <asp:Button ID="btnUpdate"  runat="server" Text="Refresh" OnClientClick="SetSource(this.id)"/>
                          <asp:HiddenField ID="hidSourceID" runat="server" />

                         <script type="text/javascript">
                             function SetSource(SourceID) {
                                 var hidSourceID = document.getElementById("<%=hidSourceID.ClientID%>");
                                 hidSourceID.value = SourceID;
                             }
                  </script>
                         <asp:Button ID="btn_AddManualPunch" runat="server" Text="Add Manual Punch" Width="130px" />
                       <asp:Button ID="btn_recalculate" runat="server" Text="Recalculate Attendance" Width="155px" />
                       <asp:Button ID="btn_UpdateRemarks" runat="server" Text="Update Remarks" Width="120px" />
                   </td>
                </tr>
                
                  <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
                
                <tr>
                    <td colspan="2" >
                     <obout:Grid id="dg_EmployeeAttendeanceLogs" runat="server" AllowFiltering="true"  GenerateRecordIds="true" CallbackMode="true" EnableRecordHover="true"  KeepSelectedRecords="true"  Serialize="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                 OnRebind="RebindGrid" OnInsertCommand="InsertRecord">
			<TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                                        <ClientSideEvents OnClientInsert="OnInsert" OnClientCallback="assignEventsToCheckboxes" />
			<Columns>
			 <obout:Column ID="Column17" Width="90" HeaderText="Select" ConvertEmptyStringToNull="False" HeaderTemplateId="CheckAllTemplate" Index="0" TemplateId="CheckTemplate">
			                                        <TemplateSettings TemplateID="CheckTemplate" HeaderTemplateID="CheckAllTemplate"/>
			                                 </obout:Column>
			                                 
				<obout:Column ID="Column0" DataField="AttendanceLogId" Visible="False" HeaderText="AttendanceLogId" ConvertEmptyStringToNull="False" Index="1" />
				<obout:Column ID="Column1"  DataField="AttendanceDate" DataFormatString="{0:dd MMM yyyy}"   Width="135" HeaderText="Attendance Date" ConvertEmptyStringToNull="False" DataFormatString_GroupHeader="{0:dd MMM yyyy}" Index="2" />
				<obout:Column ID="Column2" DataField="EmployeeCode" Width="100" HeaderText="Emp Code" ConvertEmptyStringToNull="False" Index="3" />
                <obout:Column ID="Column3" DataField="EmployeeName" Width="135" HeaderText="Emp Name" ConvertEmptyStringToNull="False" Index="4" />
                <obout:Column ID="Column4" DataField="InTime" Width="80" HeaderText="InTime" ConvertEmptyStringToNull="False" Index="5" />
                <obout:Column ID="Column5" DataField="OutTime" Width="90" HeaderText="OutTime" ConvertEmptyStringToNull="False" Index="6" />
                <obout:Column ID="Column6" DataField="ShiftSName" Width="80" HeaderText="Shift" ConvertEmptyStringToNull="False" Index="7" />
                <obout:Column ID="Column7" DataField="Duration" Width="91" HeaderText="Duration" ConvertEmptyStringToNull="False" Index="8" />
                <obout:Column ID="Column8" DataField="OverTime" Width="102" HeaderText="Over Time" ConvertEmptyStringToNull="False" Index="9" />
                <obout:Column ID="Column9" DataField="LateBy" Visible="False" Width="88" HeaderText="LateBy" ConvertEmptyStringToNull="False" Index="10" />
                <obout:Column ID="Column10" DataField="EarlyBy" Visible="False" Width="88" HeaderText="EarlyBy" ConvertEmptyStringToNull="False" Index="11" />
                <obout:Column ID="Column11" DataField="IsOnLeave" Visible="False" Width="72" HeaderText="OnLeave" ConvertEmptyStringToNull="False" Index="12" />
                <obout:Column ID="Column12" DataField="IsonSpecialOff" Visible="False" Width="78" HeaderText="OnOD" ConvertEmptyStringToNull="False" Index="13" />
                <obout:Column ID="Column13" DataField="PunchRecords" Visible="False" Width="160" HeaderText="PunchRecords" ConvertEmptyStringToNull="False" Index="14" />
                <obout:Column ID="Column14" DataField="StatusCode" Width="80" HeaderText="Status" ConvertEmptyStringToNull="False" Index="15" />
                <obout:Column ID="Column15" DataField="OverTimeE" Visible="False" Width="80" HeaderText="Status" ConvertEmptyStringToNull="False" Index="16" />
                <obout:Column ID="Column16" DataField="EmployeeId" Visible="False" Width="80" HeaderText="Status" ConvertEmptyStringToNull="False" Index="17" />
                
                <obout:Column Width="80" AllowEdit="True" AllowDelete="True" ConvertEmptyStringToNull="False" Index="18" TemplateId="tplEditBtn">
                     <TemplateSettings TemplateId="tplEditBtn" />
                 </obout:Column>
                <obout:Column ConvertEmptyStringToNull="False" DataField="OTPreserved" HeaderText="OTPreserved"
                    Visible="False">
                </obout:Column>
            </Columns>					
			 <Templates>
			 
			 <obout:GridTemplate runat="server" ID="CheckTemplate" ControlID="" ControlPropertyName="">
                                                <Template>
                                                    <input type="checkbox" id="chk_grid_<%# Container.DataItem("AttendanceLogId") %>" />
                                                </Template>
                                            </obout:GridTemplate>
                                            
                                            <obout:GridTemplate runat="server" ID="CheckAllTemplate" ControlID="" ControlPropertyName="">
					                            <Template>
						                            <input type="checkbox" id="chk_all" onclick="checkAll();"/>
					                            </Template>
				                            </obout:GridTemplate>
				                            
				                            
                                <obout:GridTemplate runat="server" ID="tplEditBtn" ControlID="" ControlPropertyName="">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                            class="ob_gAL"><%#CheckPermissions("Edit OT") %></a>
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
			
		</obout:Grid>
	   
	</td>
   </tr>
 </table>	
		
	<obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
		    <table class="rowEditTable">
                    <tr>
                        <td >
                            <fieldset>
                                <legend>Update Over Time</legend>
                                <table>
                                    <tr>
                                        <td>
                                            Over Time</td>
                                        <td >
                                            <asp:TextBox ID="txt_OverTime" runat="server" Width="310px"   ></asp:TextBox>&nbsp;mins
                                        </td>
                                    </tr>
                                    <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chk_PreservedOverTime" runat="server" text="Preserve OverTime Value while Attendance Recalculation"/>
                                    </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" foreColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;<input
                                id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" /><asp:HiddenField ID="hdn_AttendanceLogId" runat="server" />
                                    
                        </td>
                    </tr>
                </table>
			</obout:Flyout>	
			
			 <owd:Window ID="wnd_UpdateRemarks" runat="server" visible="false" 
                     Left="350" Top="155" Height="150"  Width="350"
                    StyleFolder="~/Styles/mainwindow/blue"  Title="Update Remarks" IsModal="True" ShowStatusBar="False" ShowCloseButton="true" >               
                <table width="100%" height="100%" cellpadding="1" cellspacing="0" class="rowEditTable" style="border-top-style: none;
                    border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Update Remarks</legend>
                            <table>
                                <tr>
                                    <td>
                                        Remarks
                                    </td>
                                    <td>
                                    <asp:TextBox ID="txt_Remarks" runat="server" TextMode="MultiLine"  Width="260px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                   <td colspan="2" align="right">
                   <asp:Label ID="lbl_Error" runat="server" Text="&#160;" EnableViewState="False"></asp:Label>
                   <asp:Button ID="btn_RemarksSave" runat="server" Text="Save"></asp:Button>&nbsp;
                   <input id="btn_Close" type="button" value="Close" onclick="wnd_UpdateRemarks.Close();" />
                   </td>
                </tr>
                <tr>
                <td>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </owd:Window>
                 
			
			
			
    </div>
    </form>
    
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("OTRegister") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
    </script>
    
    <script type="text/javascript">
           
            
		    function attachFlyoutToLink(oLink,Action)
		     {	
		     try 
		     {	
		       <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
		       <%=Flyout1.getClientID()%>.Open();
		       clearFlyout();
		       if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
            catch(ex){}
		    }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout1.getClientID()%>.Close();
		    }
		    
		    function populateEditControls(iRecordIndex) 
		    {	
		        document.getElementById("<%=txt_OverTime.ClientID %>").value = dg_EmployeeAttendeanceLogs.Rows[iRecordIndex].Cells[9].Value;
		        if(dg_EmployeeAttendeanceLogs.Rows[iRecordIndex].Cells[19].Value !='-1')
		        {
                         document.getElementById("<%=chk_PreservedOverTime.ClientID %>").checked=true;
		        }
	            document.getElementById("<%=hdn_AttendanceLogId.ClientID %>").value = dg_EmployeeAttendeanceLogs.Rows[iRecordIndex].Cells[1].Value;
		    }
		   
		      
		     function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.actualleave =document.getElementById("<%=txt_OverTime.ClientID %>").value ;
		        oRecord.Error='';
		        dg_EmployeeAttendeanceLogs.executeInsert(oRecord);
		     }
		    
            function clearFlyout() 
            {
                document.getElementById("<%=chk_PreservedOverTime.ClientID %>").checked=false;
                document.getElementById("<%=txt_OverTime.ClientID %>").value = '';
	            document.getElementById("<%=hdn_AttendanceLogId.ClientID %>").value = '0';
                document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		    }
		
    </script>
    
</body></html>
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



