<%@ page language="VB" autoeventwireup="false" enableeventvalidation="false" inherits="Manage_EmployeeDeviceLogs, App_Web_kgq5n2bg" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	    if(record.DeviceId>2)
	            {
	              
	                alert("Only Manual Entry can be delete.");
	                return false;
	            }
	            
	            
	            
	        record.Error='';
		    document.getElementById("<%=hdn_EmployeeManulEntryId.ClientID %>").value = record.DeviceLogId;
		    document.getElementById("<%=hdn_LogTableName.ClientID %>").value = record.TableName;
		    
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

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
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
                    <td style="font-weight: bold;">
                        Employee Logs Record
                    </td>
                   
                    <td align="right">
                         <input type="button" class="tdText" value="Refresh" onclick="Dg_EmployeeLogRecords.refresh()" id="btn_Refresh" />
                        &nbsp;Device&nbsp;<asp:DropDownList ID="drp_FilterDevice" AutoPostBack="true" runat="server"> </asp:DropDownList>&nbsp;&nbsp;
                        Month
                    <asp:DropDownList ID="drp_SelectMonth" runat="server" Width="48px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>&nbsp; Year
                    <asp:TextBox ID="txt_Year" runat="server" Width="128px"></asp:TextBox>&nbsp;
                    <asp:Button ID="btn_Go" runat="server" Text="Filter" />
                    </td>
                </tr>
                 <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr /><asp:Label runat="server" foreColor="red" EnableViewState="false" ID="lblError"></asp:Label>
                </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <obout:Grid ID="Dg_EmployeeLogRecords" runat="server" ShowLoadingMessage="true" EnableRecordHover="true" KeepSelectedRecords="true"
                            Serialize="false" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                            AllowAddingRecords="true"  OnRebind="RebindGrid" OnInsertCommand="InsertRecord"
                            AllowFiltering="true" OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column ID="Column0" DataField="DeviceLogId" Visible="False" Width="100" HeaderText="DeviceLogId"
                                    ConvertEmptyStringToNull="False" Index="0" />
                                <obout:Column ID="Column1" SortOrder="Desc" Width="155" HeaderText="Log Date" DataField="LogDate"
                                    DataFormatString="{0:dd-MMM-yyyy HH:mm}" ConvertEmptyStringToNull="False" DataFormatString_GroupHeader="{0:dd-MMM-yyyy HH:mm}"
                                    Index="1" />
                                <obout:Column ID="Column2" DataField="DeviceSName" Width="100" HeaderText="Device"
                                    ConvertEmptyStringToNull="False" Index="2" />
                                <obout:Column ID="Column3" DataField="DeviceId" Visible="False" Width="80" HeaderText="DeviceId"
                                    ConvertEmptyStringToNull="False" Index="3" />
                                <obout:Column ID="Column4" DataField="Direction" Width="95" HeaderText="Direction"
                                    ConvertEmptyStringToNull="False" Index="4" />
                                <obout:Column ID="Column5" DataField="WorkCode" Width="105" HeaderText="Work Code"
                                    ConvertEmptyStringToNull="False" Index="5" />
                                <obout:Column ID="Column6" DataField="EmployeeCode" Width="105" HeaderText="Emp Code"
                                    ConvertEmptyStringToNull="False" Index="6" />
                                <obout:Column ID="Column7" DataField="EmployeeName" Width="130" HeaderText="Emp Name"
                                    ConvertEmptyStringToNull="False" Index="7" />
                                <obout:Column ID="Column8" DataField="CompanyId" Width="130" HeaderText="Company"
                                    ConvertEmptyStringToNull="False" Index="8" Visible="False" />
                                <obout:Column ID="Column9" DataField="DepartmentId" Width="130" HeaderText="Department"
                                    ConvertEmptyStringToNull="False" Index="9" Visible="False" />
                                <obout:Column ID="Column10" DataField="Designation" Visible="False" Width="100" HeaderText="Designation"
                                    ConvertEmptyStringToNull="False" Index="10" />
                                <obout:Column ID="Column11" DataField="CategoryId" Visible="False" Width="100"
                                    HeaderText="Category" ConvertEmptyStringToNull="False" Index="11" />
                                <obout:Column ID="Column12" DataField="EmployeesStatus" Visible="False" Width="80"
                                    HeaderText="Status" ConvertEmptyStringToNull="False" Index="12" />
                                <obout:Column ID="Column13" DataField="EmployementType" Visible="False" Width="85"
                                    HeaderText="Emp Type" ConvertEmptyStringToNull="False" Index="13" />
                                <obout:Column ID="Column14" Visible="False" Width="155" HeaderText="Log Date" ConvertEmptyStringToNull="False"
                                    Index="14" TemplateId="TP_LogDateFormat">
                                    <TemplateSettings TemplateId="TP_LogDateFormat" />
                                </obout:Column>
                                <obout:Column Width="65" HeaderText="Edit" ConvertEmptyStringToNull="False" Index="15"
                                    TemplateId="tplEditActualLeavesBtn">
                                    <TemplateSettings TemplateId="tplEditActualLeavesBtn" />
                                </obout:Column>
                                <obout:Column Width="70" AllowDelete="True" HeaderText="Delete" ConvertEmptyStringToNull="False"
                                    Index="16" />
                                <obout:Column ConvertEmptyStringToNull="False" DataField="C2" HeaderText="ApprovedBy"
                                    Visible="False" Index="17">
                                </obout:Column>
                                <obout:Column ConvertEmptyStringToNull="False" DataField="C3" HeaderText="Status"
                                    Visible="False" Index="18">
                                </obout:Column>
                                <obout:Column ConvertEmptyStringToNull="False" DataField="TableName" HeaderText="TableName"
                                    Visible="False" Index="19">
                                </obout:Column>
                                <obout:Column ID="C4" DataField="C4" Width="130" HeaderText="Att State" ConvertEmptyStringToNull="False"
                                   Index="20" >
                               </obout:Column>
                               <obout:Column ID="C5" DataField="C5" Width="130" HeaderText="Verify Mode" ConvertEmptyStringToNull="False"
                                   Index="21" >
                              </obout:Column>
                            </Columns>
                            <Templates>
                            <obout:GridTemplate runat="server" ID="TP_LogDateFormat"><Template><%#ParseDateTime(Container.DataItem.Item("LogDate"))%></Template></obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplEditActualLeavesBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                            class="ob_gAL">
                                            <%#CheckPermissionsEdit("Edit", Container.DataItem("DeviceId"))%>
                                        </a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplAddBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissions("Assign Manual Entries")%>'
                                            NavigateUrl='<%# "~/manage/AssignEmployeeDeviceLogs.aspx"%>' ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
            <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE"
                OpenEvent="NONE" DelayTime="500">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Update Employee Log Entry</legend>
                                <table>
                                    <tr>
                                        <td>
                                            Employee Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_EmployeeName" runat="server" Width="150px" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td>
                                            Employee Code
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_EmployeeCode" runat="server" Width="130px" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Work Code
                                            
                                        </td>
                                        <td>
                                        <asp:DropDownList ID="drp_WorkCode" runat="server"><asp:ListItem>999</asp:ListItem></asp:DropDownList>
                                        </td>
                                        <td>
                                            Device
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drp_DeviceName" runat="server" Width="140px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            &nbsp;&nbsp;&nbsp;DateTime&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select
                                                id="drp_Day" runat="server"></select><select id="drp_Month" runat="server"></select><select
                                                    id="drp_Year" runat="server"></select><asp:DropDownList ID="drp_Hour" runat="server"
                                                        Width="48px">
                                                    </asp:DropDownList><asp:DropDownList ID="drp_Minuts" runat="server" Width="49px">
                                                    </asp:DropDownList>&nbsp;&nbsp;Direction&nbsp;
                                            <select id="drp_Direcion" runat="server" width="69px" enableviewstate="true">
                                                <option selected="selected" value="in">In</option>
                                                <option value="out">out</option>
                                                <option value="breakin">Break In</option>
                                                <option value="breakout">Break out</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td colspan="4">
                                     Approved&nbsp;By
                                    <asp:TextBox ID="txtApprovedBy"  Width="127px" runat="server"></asp:TextBox>&nbsp;Status&nbsp;
                                    <asp:TextBox ID="txtStatus" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input
                                id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                                    id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                            <asp:HiddenField ID="hdn_EmployeeManulEntryId" runat="server" />
                            <asp:HiddenField ID="hdn_LogTableName" runat="server" />
                        </td>
                    </tr>
                </table>
            </obout:Flyout>
        </div>
    </form>

    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddLogRecords") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
         
        Function CheckPermissionsEdit(ByVal Action As String, ByVal DeviceId As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditLogRecords") And (DeviceId = "1" or DeviceId = "2") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function ParseDateTime(ByVal DateValue As Date) As String
            Return DateValue.ToString("yyyy-MM-dd HH:mm")
        End Function
        
    </script>

    <script type="text/javascript">
            
	    function attachFlyoutToLink(oLink,Action)
	     {	
	       <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	       <%=Flyout1.getClientID()%>.Open();
	       populateEditControls(oLink.id.toString().replace("grid_link_", ""));
         }
		    
		function closeFlyout() 
		    {
		        <%=Flyout1.getClientID()%>.Close();
		    }
		    
	    function populateEditControls(iRecordIndex) 
	    {	
	        var LogDate=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[14].Value;
	        var DeviceId=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[3].Value;
	        var Direction=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[4].Value.toLowerCase(); 
	        var EmployeeName=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[7].Value;
	        var EmployeeCode=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[6].Value;
	        var ApprovedBy=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[17].Value;
	        var Status=Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[18].Value;
            document.getElementById( "<%=txt_EmployeeName.ClientID %>").value =EmployeeName;
            document.getElementById( "<%=txt_EmployeeCode.ClientID %>").value=EmployeeCode;
            document.getElementById( "<%=drp_DeviceName.ClientID %>").value=DeviceId;
            if(Direction=='')
            {
                document.getElementById( "<%=drp_Direcion.ClientID %>").value='in';
            }
            else
            {
             document.getElementById( "<%=drp_Direcion.ClientID %>").value=Direction;   
            }
            
            document.getElementById( "<%=Lbl_InvalidError.ClientID %>").innerHTML='';
            SetValueInDropDown(document.getElementById("<%=drp_Day.ClientID %>"),document.getElementById("<%=drp_Month.ClientID %>"),document.getElementById("<%=drp_Year.ClientID %>"),document.getElementById("<%=drp_Hour.ClientID %>"),document.getElementById("<%=drp_Minuts.ClientID %>"),LogDate);
            document.getElementById("<%=hdn_EmployeeManulEntryId.ClientID %>").value = Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[0].Value;
            document.getElementById("<%=hdn_LogTableName.ClientID %>").value = Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[19].Value;
            document.getElementById("<%=drp_WorkCode.ClientID %>").value = Dg_EmployeeLogRecords.Rows[iRecordIndex].Cells[5].Value;
            document.getElementById( "<%=txtApprovedBy.ClientID %>").value =ApprovedBy;
            document.getElementById( "<%=txtStatus.ClientID %>").value =Status;
	    }
	    
	        
	    
 function SetValueInDropDown(ddobject,mmobject,yyobject,HHobject,MMobject,value)
		    {
                var Day=value.split(' ')[0].split('-')[2];
	            var Month=value.split(' ')[0].split('-')[1];
	            var Year=value.split(' ')[0].split('-')[0];
		        var Hour=value.split(' ')[1].split(':')[0];
		        var Minute=value.split(' ')[1].split(':')[1];
		        
		        yyobject.value=Year;
		        mmobject.value=Month;
		        ddobject.value=Day;
		        HHobject.value=Hour;
		        MMobject.value=Minute;
		        
		    }
	      
	     function btn_Save_onclick()
	     {
	          var oRecord = new Object();
              oRecord.Id=document.getElementById("<%=hdn_EmployeeManulEntryId.ClientID %>").value 
              oRecord.Error='';
	          Dg_EmployeeLogRecords.executeInsert(oRecord);
	     }
	     
	    function RefreshDataGrid()
        {
            Dg_EmployeeLogRecords.refresh();
            window.setTimeout('RefreshDataGrid()', 60000);
        }
            //window.setTimeout('RefreshDataGrid()', 60000);
    </script>
    
    

</body>
</html>
