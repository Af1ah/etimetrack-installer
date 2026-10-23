<%@ page language="VB" autoeventwireup="false" inherits="Reports_GenerateMemo, App_Web_z1ac55br" enableeventvalidation="false" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     
 
    <div>
      <uctrl:header ID="MyHeader" runat="server" />
      
        
             
           <table id="tble_Memo"  cellpadding="1" class="Table" style="height:100%;border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
           <tr>
           <td>
           <table class="Table" style="height:100%;border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
           <tr>
           <td>
           <fieldset>
           <legend>Generate Memo</legend>
           <table>
                      
           <tr>
             <td>Select Status</td>
             <td>
                 <asp:DropDownList ID="drp_Status" runat="server"  CssClass="WebControls" AutoPostBack="true">  </asp:DropDownList> </td>
                 <td>Company</td>
                 <td>  <asp:DropDownList ID="drp_Company" runat="server" CssClass="WebControls" Width="150px" >  </asp:DropDownList> </td>
                 <td>Department</td>
                 <td><asp:DropDownList ID="drp_Department" runat="server"  CssClass="WebControls" Width="150px" >  </asp:DropDownList></td>
                 <td>Date</td>
                 <td> <asp:DropDownList ID="Drp_DateDD" runat="server" CssClass="WebControls"> </asp:DropDownList>
                <asp:DropDownList ID="Drp_DateMM" runat="server" CssClass="WebControls"></asp:DropDownList>
                <asp:DropDownList ID="Drp_DateYYYY" runat="server" CssClass="WebControls"> </asp:DropDownList></td>
                <td>
                    <asp:Button ID="btn_ListEmployees" runat="server" Text="List Employees"   CssClass="WebControls"/>
                    </td>
                  </tr>
             
                  
                  <tr>
                  <td  colspan="9">
                  <hr />
                  <table>
                  <tr>
                  <td> Subject&nbsp; </td>
                  <td> <asp:TextBox ID="txt_Subject" runat="server" Width="500"   CssClass="WebControls"></asp:TextBox></td>
                  <td  rowspan="2">Signature</td>
                  <td  rowspan="2"><asp:TextBox ID="txt_Signature"    runat="server" Height="100" Width="330"  TextMode="MultiLine"></asp:TextBox></td>
                  
                  </tr>
                  <tr>
                  <td> Memo Text&nbsp; </td>
                  <td> <asp:TextBox ID="txt_MemoText" runat="server"  Width="500" Height="80"   CssClass="WebControls" TextMode="MultiLine" Text=""></asp:TextBox></td>
                  </tr>
                
                <tr>
                <td>
                </td>
                 
                </tr>
                </table>
                <table>
                  <tr></tr>
                  </table>
                  </td>
                  </tr>
                  
                  <tr>
                  <td colspan="9">
                  <hr />
                  <obout:Grid ID="Dg_Employees" runat="server" CallbackMode="true" Serialize="true"
                                        AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                        AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false" GenerateRecordIds="true" AllowFiltering="true">
                                        <ClientSideEvents OnClientCallback="assignEventsToCheckboxes" />
                                        <Columns>
                                            <obout:Column ID="Column10" HeaderText="Select" runat="server">
			                                        <TemplateSettings TemplateID="CheckTemplate" HeaderTemplateID="CheckAllTemplate"/>
			                                 </obout:Column>
                                            <obout:Column ID="Column2" Align="left" DataField="EmployeeId" Visible="false" Width="100"
                                                HeaderText="ShiftId" runat="server" />
                                            <obout:Column ID="Column1" DataField="EmployeeCode" Visible="true" Width="165" HeaderText="Emp Code"
                                                runat="server" />
                                            <obout:Column ID="Column7" DataField="EmployeeName" Visible="true" Width="280" HeaderText="Emp Name"
                                                runat="server" />
                                            <obout:Column ID="Column3" DataField="CompanySName" Visible="true" Width="200" HeaderText="Company"
                                                runat="server" />
                                            <obout:Column ID="Column4" DataField="DepartmentSName" Visible="true" Width="180"
                                                HeaderText="Department" runat="server" />
                                            <obout:Column ID="Column5" DataField="InTime" Visible="false" Width="180"
                                                HeaderText="Department" runat="server" />
                                            <obout:Column ID="Column6" DataField="OutTime" Visible="false" Width="180"
                                                HeaderText="Department" runat="server" />
                                            
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
                 <td colspan="4"> 
                 <asp:RadioButtonList ID="rbtn_FileFormat" RepeatDirection="Horizontal" runat="server">
                 <asp:ListItem Selected="True">Individual</asp:ListItem>
                 <asp:ListItem >Summary</asp:ListItem>
                 </asp:RadioButtonList> 
                   </td>
                 <td colspan="5" align="right" ><asp:LinkButton ID="lnk_DisplayError" runat="server" Enabled="false" OnClientClick="return attachFlyoutToLink(this);">Display Error</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_GenerateReport"   CssClass="WebControls"  runat="server" Text="Save Memo Details & Generate Memo (Preview)" OnClientClick="javascript:document.getElementById('ReportProtoType_lblStatus').innerHTML='';"/>
                  &nbsp;<asp:Button ID="btn_SendMail"   CssClass="WebControls"  runat="server" Text="Send Mail"  OnClientClick="return btn_SendMailOnClientClick();" />
                 &nbsp;&nbsp;</td> 
                 </tr>
                 
                 <tr>
       <td colspan="9">
       <hr />
       <asp:Label ID="lblStatus" EnableViewState="false"    runat="server" CssClass="WebControls"  ForeColor="Red"   Height="20px"></asp:Label>
       </td>
       </tr>
           </table>
           </fieldset>
           </td>
           </tr>
           </table>
           </td>
            </tr>
             </table>
             
             
       <owd:Window ID="ConfirmWindow" runat="server" IsModal="true"  Height="70" Width="450"
            StyleFolder="~/Styles/mainwindow/blue"  Title="Confirm"  
             VisibleOnLoad="false" ShowCloseButton="false"   Left="350"  Top="200" ShowStatusBar="False"  > 
             
             <table>
             <tr>
             <td>
                 <asp:Label ID="lbl_Confirm" runat="server" Text="Are you sure you want to send memo eMail to selected Employees?"></asp:Label></td>
             </tr>
                 
                 <tr>
                 <td align="center">
                 <input id="Btn_DeleteYes" type="button" value="Yes" runat="server" />&nbsp;<input id="Btn_DeleteNo" type="button" value="No" runat="server" onclick="javascript:CloseConfirmwindow();" />
                 </td>
                 </tr>
             
             
             
             </table> 
             
             
             </owd:Window>
             
       <owd:Window ID="SummaryMemo" runat="server" IsModal="true"  Height="115" Width="300"
             StyleFolder="~/Styles/mainwindow/blue"  Title="Send email"   
             VisibleOnLoad="false"  ShowCloseButton="true"   Left="350"  Top="200" ShowStatusBar="False">
             
             <table>
             <tr>
             <td colspan="2">
             
              <fieldset >
                
                
                <table cellpadding="1">
                  <tr>
                    <td>
                 <asp:Label ID="Label1" runat="server" Text="To emailid"></asp:Label></td>
             <td>
             <asp:TextBox ID="txt_email" runat="server"  Width="200"></asp:TextBox>
             </td>            
                  </tr>
                  
                  </table>
                </fieldset>
                 </td>
             
             </tr>
            
             <tr>
                  <td align="right">
            <input id="btn_Send" type="button" value="Send" runat="server" />&nbsp;
            
            <input id="btn_SummaryClose" type="button" value="Close" runat="server" onclick="javascript:CloseSummaryMemowindow();" /> </td>
                  </tr>
                  <tr>
                  <td><asp:Label ID="lbl_Msg" runat="server" ForeColor="red" EnableViewState="false"></asp:Label></td>
                  </tr>
             
             
             </table>
             
             
             </owd:Window>
             
              
             
             
            <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE"
                OpenEvent="NONE" DelayTime="500" AttachTo="lnk_DisplayError" zIndex="100000">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ReadOnly="true" BorderStyle="None" Wrap="true" Width="400px"  CssClass="WebControls" BackColor="#EEEEEE" Height="150px" TextMode="MultiLine" BorderWidth="0" ID="lbl_DisplayError"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                                <input id="Button1" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        </td>
                    </tr>
                    
                </table>
            </obout:Flyout>
    
    </div>
    
     <div>
        
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;background-color:White; " runat="server" id="tblReport">
                <tr id="trHeader" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                        padding: 5px; color: white;">
                        Report View
                    </td>
                    <td align="right">
                        <input id="btnDisplayReportForm" type="button" onclick="ReportProtoType.Open();" value="Regenerate Report" />&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div style="">
                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BorderColor="Black" BackColor="White"
                                Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana"
                                WaitMessageFont-Size="14pt" Width="1000px" Height="1000px" AsyncRendering="true"
                                SizeToReportContent="true">
                            </rsweb:ReportViewer>
                             <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </div>
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


    
           function btn_SendMailOnClientClick()
               {
                    var Count=Dg_Employees.PageSelectedRecords.length;
                    var Status=document.getElementById('rbtn_FileFormat_0').checked;
                    
                    if(Status)
                        {
                            return confirm("Are you sure you want to send memo eMail to this '" +Count  + "' selected Employees?");
                            CloseSummaryMemowindow();
                        }
                     else
                        {
                            document.getElementById('<%=lbl_Msg.ClientID %>').innerHTML='';
                            SummaryMemo.Open();
                        }   
                          return false;   
                }

           
           function CloseSummaryMemowindow()
		     {
		         try
		         {
		         document.getElementById("<%=txt_email.ClientID %>").value = '';
		        SummaryMemo.Close();
		         }
		         catch(ex)
		         {
		            alert(ex.message);
		         }  
		    }
		    
		     function attachFlyoutToLink(oLink)
		        {	
		            if(oLink.disabled==false)
		            {
	                    <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	                    <%=Flyout1.getClientID()%>.Open();
	                }
	                return false;
		        }
		        
		         function closeFlyout() 
		        {
		            <%=Flyout1.getClientID()%>.Close();
		        }
		    
           
            function CloseConfirmwindow()
		     {
		         try
		         {
		        ConfirmWindow.Close();
		         }
		         catch(ex)
		         {
		            alert(ex.message);
		         }  
		    }
		    
		    
		    
		    
		    
           
</script>
