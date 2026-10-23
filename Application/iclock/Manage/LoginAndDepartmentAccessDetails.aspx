<%@ page language="VB" autoeventwireup="false" inherits="Manage_LoginAndDepartmentAccessDetails, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
		   

            function SelectDeselect(oCheckbox) {
            alert('hello');
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
                            Dg_Department.selectRecord(iRecordIndex);
                        } else {
                            // deselect the record
                            Dg_Department.deselectRecord(iRecordIndex);
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
                var sRecordsIds = Dg_Department.getRecordsIds();
                if (sRecordsIds != null && sRecordsIds.length > 0) {
                    var arrRecordsIds = sRecordsIds.split(",");
                    for (var i = 0; i < arrRecordsIds.length; i++) {
                        var oRecord = document.getElementById(arrRecordsIds[i]);
                        oRecord.onmousedown = function (e) { stopEventPropagation(e); };
                        oRecord.onclick = function (e) { stopEventPropagation(e); };
                    }

                    // populate the previously checked checkboxes
                    var arrPageSelectedRecords = Dg_Department.PageSelectedRecords;
                    for (var i = 0; i < arrPageSelectedRecords.length; i++) {
                        var oCheckbox = document.getElementById("chk_grid_" + arrPageSelectedRecords[i].DepartmentId);
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
                                    Dg_Department.selectRecord(iRecordIndex);
                                } else {
                                    // deselect the record
                                    Dg_Department.deselectRecord(iRecordIndex);
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
                border-left: gray 1px solid; border-bottom: gray 1px solid;background-color: lightsteelblue;">
                <tr>
                <td>
                <fieldset>
                <legend>Employee Login And Department Access</legend>
                <table>
                
              
                <tr></tr>
                
                
                 <tr style=" background-color: lightsteelblue;">
                <td align="center" colspan="2" style=" background-color: lightsteelblue;">
                     <asp:Label ID="lbl_EmployeeDetails" Font-Bold="true" runat="server" Text="Label"></asp:Label>
                </td>
                </tr>
                
                 <tr>
                <td colspan="2" style=" background-color: lightsteelblue;">
                <hr />
                </td>
                </tr>
                
                
                <tr style=" background-color: lightsteelblue;">
                <td>
                Login Name&nbsp;&nbsp;<asp:TextBox ID="txt_LoginName" runat="server"></asp:TextBox>
                </td>
                <td>
                Password&nbsp;&nbsp;<asp:TextBox ID="txt_Password" TextMode="Password" runat="server"></asp:TextBox>
                </td>
                </tr>
                
                  <tr>
                <td colspan="2" style=" background-color: lightsteelblue;">
                <hr />
                </td>
                </tr>
                
                
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td align="center" colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;padding:5px; color: white;">
                        Department List
                    </td>
                </tr>
                
                <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                
                <tr>
                    <td colspan="2">
                    
                     <obout:Grid ID="Dg_Department" runat="server" CallbackMode="true" Serialize="true"
                                        AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                        AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false"  GenerateRecordIds="true" AllowFiltering="true">
                                        <ClientSideEvents OnClientCallback="assignEventsToCheckboxes" />
                            <Columns>
                            <obout:Column ID="Column10" Width="90" HeaderText="Select" runat="server">
			                                        <TemplateSettings TemplateID="CheckTemplate" HeaderTemplateID="CheckAllTemplate"/>
			                                 </obout:Column>
                                <obout:Column DataField="DepartmentId" Visible="false" ReadOnly="true" HeaderText="DepartmentId " />
                                <obout:Column ID="Column1" DataField="DepartmentFName"  SortOrder="Asc"  Visible="true" Width="450"
                                    HeaderText="Department Name" runat="server" />
                                <obout:Column ID="Column2" DataField="DepartmentSName" Visible="true" Width="430"
                                    HeaderText="Short Name" runat="server" />
                                <obout:Column ID="Column4" DataField="Description" Visible="false" Width="200" HeaderText="Description"
                                    runat="server" />
                               
                            </Columns>
                            <Templates>
                                            <obout:GridTemplate runat="server" ID="CheckTemplate">
                                                <Template>
                                                    <input  type="checkbox" id="chk_grid_<%# Container.DataItem("DepartmentId") %>" />
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
                </table>
                </fieldset>
                </td>
                
                </tr>
                
                <tr>
                <td align="right">
                    <asp:HiddenField ID="hdn_CheckedBranches" runat="server" />
                    <asp:HiddenField ID="hdn_EmployeePasword" runat="server" />
                <asp:Label ID="lbl_Error" EnableViewState="false" runat="server" Text=""></asp:Label>&nbsp;&nbsp;<asp:Button ID="btn_Update" runat="server" Text="Update" />&nbsp;&nbsp;
                </td>
                </tr>
                
            </table>
    </div>
    </form>
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
</script>
