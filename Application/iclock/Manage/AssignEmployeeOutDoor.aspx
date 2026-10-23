<%@ page language="VB" autoeventwireup="false" inherits="Manage_AssignEmployeeOutDoor, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
<body onload="IsApproved_CheckedChange();SetDuration();">
    <form id="form1" runat="server">
    <div>
    <uctrl:header ID="MyHeader" runat="server" />
            <table width="100px" cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                   <tr>
                    <td  style="font-weight: bold; font-size: 17px; background-color: lightsteelblue;padding:5px; color: white;">
                       Assign Employees Out Door Entries
                       <br />
                       <hr />
                    </td>                    
                </tr>
                <tr style=" background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td colspan="2" style="width: 1008px">
                    <table>
                    <tr style="font-family: Verdana; font-size: 11px; color: #0c416f;">
                    <td style="width: 999px">
                    <table>
                    <tr style="font-family: Verdana; font-size: 11px; color: #0c416f;">
                    <td style="width: 510px; height: 26px;">
                    From Date
                    <select ID="drp_ddFromDate"  runat="server"  Width="46px" style="width: 48px"></select>&nbsp;<select ID="drp_mmFromDate" runat="server" EnableViewState="true" Width="48px" style="width: 50px"></select>&nbsp;<select ID="drp_yyyyFromDate" runat="server"  EnableViewState="true" Width="69px" style="width: 60px"></select>&nbsp;&nbsp;
                        &nbsp; &nbsp;&nbsp; &nbsp;To Date
                    <select ID="drp_ddToDate"  runat="server"  Width="46px" style="width: 50px"></select>&nbsp;<select ID="drp_mmToDate" runat="server" EnableViewState="true" Width="48px" style="width: 50px"></select>&nbsp;<select ID="drp_yyyyToDate" runat="server"  EnableViewState="true" Width="69px" style="width: 60px"></select>&nbsp;
                    </td>
                    <td style="width: 429px; height: 26px;">
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <asp:CheckBox ID="chk_IsApproved" runat="server" Text="Is Approved" Checked="true"   onclick="IsApproved_CheckedChange()"  />
                        &nbsp; &nbsp;Approved By
                        <asp:TextBox ID="txt_ApprovedBy" Enabled="false" runat="server" Width="151px"></asp:TextBox>&nbsp;      
                    </td>
                    </tr>
                    </table>
                        &nbsp;&nbsp;
                        Duration &nbsp; <asp:TextBox ID="txt_Duration" runat="server" Enabled="false" Width="44px"></asp:TextBox>
                        Mins &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Begin Time 1&nbsp;<asp:DropDownList ID="drp_hhBeginTime" onchange="SetDuration();"   runat="server"  Width="46px"></asp:DropDownList>
                        <asp:DropDownList ID="drp_mmBeginTime" onchange="SetDuration();"  runat="server" EnableViewState="true" Width="48px"></asp:DropDownList>
                        24 Hr fmt &nbsp;&nbsp;&nbsp;End Time 1&nbsp;
                        <asp:DropDownList ID="drp_hhEndTime" onchange="SetDuration();"   runat="server"  Width="46px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="drp_mmEndTime" onchange="SetDuration();"  runat="server" EnableViewState="true" Width="48px"></asp:DropDownList>
                        
                        24 Hr fmt&nbsp;   Remarks&nbsp;<asp:TextBox ID="txt_Remarks" runat="server" TextMode="MultiLine" Height="33px" Width="162px"></asp:TextBox>
                        
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                         Begin Time 2&nbsp;<asp:DropDownList ID="drp_hhBeginTime2" onchange="SetDuration();"   runat="server"  Width="46px"></asp:DropDownList>
                        <asp:DropDownList ID="drp_mmBeginTime2" onchange="SetDuration();"  runat="server" EnableViewState="true" Width="48px"></asp:DropDownList>
                        24 Hr fmt &nbsp;&nbsp;&nbsp;End Time 2&nbsp;
                        <asp:DropDownList ID="drp_hhEndTime2" onchange="SetDuration();"   runat="server"  Width="46px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="drp_mmEndTime2" onchange="SetDuration();"  runat="server" EnableViewState="true" Width="48px"></asp:DropDownList>
                        
                        24 Hr fmt&nbsp;
                        
                        </td>
                    <td rowspan="3" width="50">
                        &nbsp;</td>
                    </tr>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                <tr>
                    <td colspan="2">
                    <hr />
                     <obout:Grid ID="Dg_Employees" runat="server"  Serialize="false"  KeepSelectedRecords="true" 
                                        AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue" AllowMultiRecordDeleting="true"
                                        AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="true" GenerateRecordIds="true" AllowFiltering="true">
                                        <ClientSideEvents OnClientCallback="assignEventsToCheckboxes" />
                                        <Columns>
                                            <obout:Column ID="Column10" Width="100" HeaderText="Select" runat="server">
			                                        <TemplateSettings TemplateID="CheckTemplate" HeaderTemplateID="CheckAllTemplate"/>
			                                 </obout:Column>
                                            <obout:Column ID="Column2" Align="left" DataField="EmployeeId" Visible="false" Width="100"
                                                HeaderText="ShiftId" runat="server" />
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
						                            <input type="checkbox" id="chk_all" onclick="checkAll();"/>
					                            </Template>
				                            </obout:GridTemplate>
                                        </Templates>
                                    </obout:Grid>
	
	</td>
                </tr>
                
                <tr style="padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                                <td colspan="2">
                                <hr />
                                <table>
                                <tr>
                                <td style="width: 272px">
                                &nbsp;&nbsp;<a  style="font-family:Verdana; font-size: 13px; color: #0c416f;" href="EmployeeOutDoorEntries.aspx">« Go to Employees OutDoor Entries</a>
                                </td>
                                
                                <td align="right" style="width: 826px">
                                <table>
                                <tr>
                                <td>
                                <asp:Label ID="lbl_Error" runat="server" EnableViewState="False" ForeColor="Red" Font-Size="12px" Font-Bold="false"></asp:Label>
                                </td>
                                <td align="right">
                                <asp:Button ID="btn_AssignLeave" runat="server" Text="Assign OutDoor Entries" /><asp:HiddenField ID="hdn_Duration" runat="server" />
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
    
    <script runat="server">
        
        Function GetDataItemValue(ByVal fieldname As String, ByVal Container As Obout.Grid.TemplateContainer) As String
            
            
            If Container.DataItem(fieldname) Is Nothing Then
                Return Container.DataItem(fieldname.ToUpper)
              
                
            End If
            
            
            Return Container.DataItem(fieldname)
            
        End Function
        
    </script>
    
    <script type="text/javascript">
    
     function IsApproved_CheckedChange()
                {
                    var object=document.getElementById('<%=chk_IsApproved.ClientID %>');
                    if(object.checked)
                    {
                        document.getElementById('<%=txt_ApprovedBy.ClientID %>').value=document.getElementById('<%=hdn_LoginEmpName.ClientID %>').value;
                    }    
                    else
                    {
                        document.getElementById('<%=txt_ApprovedBy.ClientID %>').disabled=true;
                        document.getElementById('<%=txt_ApprovedBy.ClientID %>').value='';
                     }   
                }
                
   
    
    function SetDuration()
		    {
		        var HHBeginTime=parseInt(document.getElementById("<%=drp_HHBeginTime.ClientID%>").value);
		        if(document.getElementById("<%=drp_HHBeginTime.ClientID%>").value=='08')
		            HHBeginTime=8;
		        else if(document.getElementById("<%=drp_HHBeginTime.ClientID%>").value=='09')
		            HHBeginTime=9;
		            
		        var mmBeginTime=parseInt(document.getElementById("<%=drp_mmBeginTime.ClientID%>").value);
		        if(document.getElementById("<%=drp_mmBeginTime.ClientID%>").value=='08')
		            mmBeginTime=8;
		        else if(document.getElementById("<%=drp_mmBeginTime.ClientID%>").value=='09')
		            mmBeginTime=9;
		            
		        var HHEndTime=parseInt(document.getElementById("<%=drp_HHEndTime.ClientID%>").value);
		         if(document.getElementById("<%=drp_HHEndTime.ClientID%>").value=='08')
		            HHEndTime=8;
		        else if(document.getElementById("<%=drp_HHEndTime.ClientID%>").value=='09')
		            HHEndTime=9;
		            
		        var mmEndTime=parseInt(document.getElementById("<%=drp_mmEndTime.ClientID%>").value);
		        if(document.getElementById("<%=drp_HHEndTime.ClientID%>").value=='08')
		            HHEndTime=8;
		        else if(document.getElementById("<%=drp_HHEndTime.ClientID%>").value=='09')
		            HHEndTime=9;
		            
		        var Hours;
		        if(HHEndTime<HHBeginTime)
		        HHEndTime=HHEndTime+24;
		        else if(HHEndTime==HHBeginTime &&  mmBeginTime>mmEndTime)
		        HHEndTime=HHEndTime+24;
		        
		        Hours=(HHEndTime-HHBeginTime)*60;
		        var Minuts=mmEndTime-mmBeginTime;
		        var TotalDuration=Hours+Minuts;
		        document.getElementById( "<%=txt_Duration.ClientID %>").value =TotalDuration;
		        document.getElementById( "<%=hdn_Duration.ClientID %>").value =TotalDuration;
		        
		        
		        
		        
		        
		        
		            var HHBeginTime2=parseInt(document.getElementById("<%=drp_HHBeginTime2.ClientID%>").value);
		            
		            
		        if(document.getElementById("<%=drp_HHBeginTime2.ClientID%>").value=='08')
		            HHBeginTime2=8;
		        else if(document.getElementById("<%=drp_HHBeginTime2.ClientID%>").value=='09')
		            HHBeginTime2=9;
		            
		        var mmBeginTime2=parseInt(document.getElementById("<%=drp_mmBeginTime2.ClientID%>").value);
		        if(document.getElementById("<%=drp_mmBeginTime2.ClientID%>").value=='08')
		            mmBeginTime2=8;
		        else if(document.getElementById("<%=drp_mmBeginTime2.ClientID%>").value=='09')
		            mmBeginTime2=9;
		            
		        var HHEndTime2=parseInt(document.getElementById("<%=drp_HHEndTime2.ClientID%>").value);
		         if(document.getElementById("<%=drp_HHEndTime2.ClientID%>").value=='08')
		            HHEndTime2=8;
		        else if(document.getElementById("<%=drp_HHEndTime2.ClientID%>").value=='09')
		            HHEndTime2=9;
		            
		        var mmEndTime2=parseInt(document.getElementById("<%=drp_mmEndTime2.ClientID%>").value);
		        if(document.getElementById("<%=drp_HHEndTime2.ClientID%>").value=='08')
		            HHEndTime2=8;
		        else if(document.getElementById("<%=drp_HHEndTime2.ClientID%>").value=='09')
		            HHEndTime2=9;
		            
		        var Hours2;
		        if(HHEndTime2<HHBeginTime2)
		        HHEndTime2=HHEndTime2+24;
		        else if(HHEndTime2==HHBeginTime2 &&  mmBeginTime2>mmEndTime2)
		        HHEndTime2=HHEndTime2+24;
		        
		        Hours2=(HHEndTime2-HHBeginTime2)*60;
		        var Minuts2=mmEndTime2-mmBeginTime2;
		        var TotalDuration2=Hours2+Minuts2;
		        document.getElementById( "<%=txt_Duration.ClientID %>").value =TotalDuration+TotalDuration2;
		        document.getElementById( "<%=hdn_Duration.ClientID %>").value =TotalDuration+TotalDuration2;
		    }
		    
    </script>
</body>
</html>

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
