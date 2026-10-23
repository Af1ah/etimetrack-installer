<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeeAttendanceLogs, App_Web_usmjemmz" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

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
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="">
                <tr style="font-size: 0;">
                    <td style="width: 403px; height:100% ">
                        <img alt="Logo" src="../images/logo.gif" border="0" />
                    </td>
                    <td align="right" style="width: 100%; height:100% ">
                        <img alt="Top Header Image" src="../images/tophimg.gif" border="0" />
                    </td>
                </tr>
                
                
                
                <tr style="background-image: url(../Images/mid.gif); background-repeat: repeat-x">
                    <td colspan="2">
                    <table>
                    <tr>
                    <td style="width: 95%"  align="center">
                        <marquee><asp:Label ID="lbl_EmpBirthMessage" Font-Size="15px"    runat="server" Text="" Font-Italic="true"  ForeColor="BlueViolet"></asp:Label></marquee>
                    </td>
                    <td style="width: 74px">
                    |<a href="#" id="lnk_LogOff" class="LogOffButton" onclick="window.parent.location.href='../EmployeeLogin.aspx';">Log Off</a>|
                        
                    </td>
                    </tr>
                    </table>
                    </td>
                </tr>
                
                   
                  <tr >
                    <td colspan="2">
                    
                    </td>
                </tr>
                  <tr >
                    <td colspan="2">
                    
                    </td>
                </tr>
                 
                  <tr >
                    <td colspan="2">
                    
                    </td>
                </tr>
                  <tr >
                    <td colspan="2">
                    
                    </td>
                </tr>
                 
                  <tr >
                    <td colspan="2">
                    
                    </td>
                </tr>
                  <tr >
                    <td colspan="2">
                    
                    </td>
                </tr>
                
            </table>
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td colspan="2">
                        Attendence Logs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        From Date&nbsp;<asp:DropDownList runat="server" ID="drp_FromddDate" AutoPostBack="true">
                        </asp:DropDownList>&nbsp;
                        <asp:DropDownList runat="server" ID="drp_FromMMDate" AutoPostBack="true">
                        </asp:DropDownList>&nbsp;
                        <asp:DropDownList runat="server" ID="drp_FromYYYYDate" AutoPostBack="true">
                        </asp:DropDownList>
                        &nbsp;To Date&nbsp;<asp:DropDownList runat="server" ID="drp_ToddDate" AutoPostBack="true">
                        </asp:DropDownList>&nbsp;
                        <asp:DropDownList runat="server" ID="drp_ToMMDate" AutoPostBack="true">
                        </asp:DropDownList>&nbsp;
                        <asp:DropDownList runat="server" ID="drp_ToYYYYDate" AutoPostBack="true">
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
                        <obout:Grid ID="dg_EmployeeAttendeanceLogs" runat="server" AllowFiltering="true"
                            CallbackMode="true" EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true"
                            AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                            AllowAddingRecords="true" ShowLoadingMessage="false" OnRebind="RebindGrid" OnInsertCommand="InsertRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column ID="Column0" DataField="AttendanceLogId" Visible="false" HeaderText="AttendanceLogId"
                                    runat="server" />
                                <obout:Column ID="Column1" DataField="AttendanceDate" Visible="true" DataFormatString="{0:dd MMM yyyy}"
                                    Width="145" HeaderText="Attendance Date" runat="server" />
                                <obout:Column ID="Column2" DataField="EmployeeCode" Visible="true" Width="110" HeaderText="Emp Code"
                                    runat="server" />
                                <obout:Column ID="Column3" DataField="EmployeeName" Visible="true" Width="145" HeaderText="Emp Name"
                                    runat="server" />
                                <obout:Column ID="Column5" DataField="InTime" Visible="true" Width="90" HeaderText="InTime"
                                    runat="server" />
                                <obout:Column ID="Column6" DataField="OutTime" Visible="true" Width="100" HeaderText="OutTime"
                                    runat="server" />
                                <obout:Column ID="Column7" DataField="ShiftSName" Visible="true" Width="100" HeaderText="Shift"
                                    runat="server" />
                                <obout:Column ID="Column8" DataField="Duration" Visible="true" Width="100" HeaderText="Duration"
                                    runat="server" />
                                <obout:Column ID="Column9" DataField="OverTime" Visible="true" Width="110" HeaderText="Over Time"
                                    runat="server" />
                                <obout:Column ID="Column10" DataField="LateBy" Visible="true" Width="88" HeaderText="LateBy"
                                    runat="server" />
                                <obout:Column ID="Column11" DataField="EarlyBy" Visible="true" Width="88" HeaderText="EarlyBy"
                                    runat="server" />
                                <obout:Column ID="Column13" DataField="IsOnLeave" Visible="true" Width="100" HeaderText="OnLeave"
                                    runat="server" />
                                <obout:Column ID="Column14" DataField="IsonSpecialOff" Visible="false" Width="78"
                                    HeaderText="OnOD" runat="server" />
                                <obout:Column ID="Column15" DataField="PunchRecords" Visible="false" Width="160"
                                    HeaderText="PunchRecords" runat="server" />
                                <obout:Column ID="Column4" DataField="StatusCode" Visible="true" Width="105" HeaderText="Status"
                                    runat="server" />
                            </Columns>
                            <Templates>
                                <obout:GridTemplate runat="server" ID="tplEditBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                            class="ob_gAL">
                                            <%#CheckPermissions("Edit OT") %>
                                        </a>
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
                                <legend>Update Over Time</legend>
                                <table>
                                    <tr>
                                        <td>
                                            Over Time</td>
                                        <td>
                                            <asp:TextBox ID="txt_OverTime" runat="server" Width="310px"></asp:TextBox>&nbsp;mins
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="chk_PreservedOverTime" runat="server" Text="Preserve OverTime Value while Attendance Recalculation" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input
                                id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;<input
                                    id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" /><asp:HiddenField
                                        ID="hdn_AttendanceLogId" runat="server" />
                        </td>
                    </tr>
                </table>
            </obout:Flyout>
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
	            document.getElementById("<%=hdn_AttendanceLogId.ClientID %>").value = dg_EmployeeAttendeanceLogs.Rows[iRecordIndex].Cells[0].Value;
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

</body>
</html>
