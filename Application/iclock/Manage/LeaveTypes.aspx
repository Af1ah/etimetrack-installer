<%@ page language="VB" autoeventwireup="false" inherits="Manage_LeaveTypes, App_Web_usmjemmz" enableeventvalidation="true" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
	        if(record.LeaveTypeSName=='CL' || record.LeaveTypeSName=='PL' || record.LeaveTypeSName=='SL')
	            {
	                alert("Leave Type '"+record.LeaveTypeSName+"' can not be delete.");
	                return false;
	            }
	            document.getElementById("<%=Hdn_LeaveTypeId.ClientID %>").value = record.LeaveTypeId;
	            document.getElementById("<%=Hdn_LeaveTypeName.ClientID %>").value = record.LeaveTypeSName;

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
                    <td colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;padding:5px; color: white;">
                        Leave Type List
                    </td>
                </tr>
                
                 <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
                <tr>
                    <td colspan="2">
                        <obout:Grid ID="Dg_Leave" runat="server" CallbackMode="true" EnableRecordHover="true"
                            KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                            AllowAddingRecords="true" ShowLoadingMessage="false" OnRebind="RebindGrid" AllowFiltering="true"
                            OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column DataField="LeaveTypeId" Visible="false" ReadOnly="true" HeaderText="LeaveTypeId " />
                                <obout:Column ID="Column1" DataField="LeaveTypeSName"  SortOrder="Asc"  Visible="true" Width="330"
                                    HeaderText="Leave Type Name" runat="server" />
                                <obout:Column ID="Column2" DataField="LeaveTypeFName" Visible="false" Width="300"
                                    HeaderText="Leave Type Name" runat="server" />
                                <obout:Column ID="Column3" DataField="YearlyLimit" Visible="true" Width="200" HeaderText="Yearly Limit"
                                    runat="server" />
                                <obout:Column ID="Column4" DataField="CarryForwardLimit" Visible="true" Width="200"
                                    HeaderText="Carry Forward Limit" runat="server" />
                                <obout:Column ID="Column5" DataField="Gender" Visible="true" Width="200" HeaderText="Gender"
                                    runat="server" />
                                <obout:Column ID="Column6" DataField="MarkedAs" Visible="false" Width="200" HeaderText="End Time"
                                    runat="server" />
                                <obout:Column ID="Column7" DataField="ConsiderWeeklyOff" Visible="false" Width="200"
                                    HeaderText="End Time" runat="server" />
                                <obout:Column ID="Column8" DataField="ConsiderHoliday" Visible="false" Width="200"
                                    HeaderText="End Time" runat="server" />
                                <obout:Column ID="Column9" DataField="Description" Visible="false" Width="200" HeaderText="End Time"
                                    runat="server" />
                                <obout:Column ID="Column10" DataField="IsAllowNegativeBalance" Visible="false" Width="200" HeaderText="IsAllowNegativeBalance"
                                    runat="server" />    
                                
                                <obout:Column HeaderText="Edit" Width="65" AllowEdit="true" AllowDelete="true">
                                    <TemplateSettings TemplateId="tplEditBtn" />
                                </obout:Column>
                                <obout:Column HeaderText="Delete" Width="70" AllowEdit="false" AllowDelete="true"
                                    Visible="true" />
                            </Columns>
                            <Templates>
                                <obout:GridTemplate runat="server" ID="tplEditBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                            class="ob_gAL"><%#CheckPermissionsEdit("Edit")%></a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplAddBtn">
                                    <Template>
                                        <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add');" class="ob_gAL">
                                            <%#CheckPermissions("Add")%></a>
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
            
            <obout:Flyout runat="server" ID="Flyout_LeaveTypes"  Position="BOTTOM_CENTER"
                CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Leave Type Details</legend>
                                <table>
                                    <tr>
                                        <td  style="font-weight: bold;">
                                            LeaveTypeName
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_LeaveFName" runat="server"></asp:TextBox>
                                        </td>
                                        <td  style="font-weight: bold;">
                                            Short Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_LeaveSName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  style="font-weight: bold;">
                                            Yearly Limit
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txt_YearlyLimit"></asp:TextBox>
                                        </td>
                                        <td  style="font-weight: bold;">
                                            Carry Forward
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txt_CarryForwordLimit"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td>
                                    Applicable To
                                    </td>
                                    <td colspan="3">
                                    <asp:RadioButtonList ID="rbtnlst_Gender" RepeatDirection="Horizontal" runat="server">
                                                <asp:ListItem Selected="True">All</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                                <asp:ListItem>Male</asp:ListItem>
                                            </asp:RadioButtonList>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Consider As
                                        </td>
                                        <td>
                                            <select id="drp_markedAs" runat="server">
                                                <option selected="selected" value="Leave">Leave With Pay</option>
                                                <option  value="Absent">Leave Without Pay</option>
                                            </select>
                                        </td>
                                        <td colspan="2">
                                            <asp:CheckBox ID="chk_NegativeBalance" runat="server" Text="Allow Negative Leave Balance"/>&nbsp;<asp:CheckBox ID="Chk_considerWeeklyOff" runat="server" Text="Consider Weekly Off" Visible="false" />&nbsp;<asp:CheckBox ID="Chk_considerHoliday" runat="server" Text="Consider Holiday"  Visible="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Description
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox runat="server" ID="txt_Description" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" foreColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                            <asp:HiddenField ID="Hdn_LeaveTypeId" runat="server" />
                            <asp:HiddenField ID="Hdn_LeaveTypeName" runat="server" />
                        </td>
                    </tr>
                </table>
            </obout:Flyout>
        </div>
    </form>
    
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddLeaveTypes") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditLeaveTypes") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
      
        
    </script>

    <script type="text/javascript">
		    
		   
		    function attachFlyoutToLink(oLink,Action)
		     {	
		       <%=Flyout_LeaveTypes.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_LeaveTypes.getClientID()%>.Open();
		        clearFlyout();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout_LeaveTypes.getClientID()%>.Close();
		    }
		    

	  function populateEditControls(iRecordIndex) 
		    {	  
		        document.getElementById("<%=txt_LeaveSName.ClientID%>").value = Dg_Leave.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=txt_LeaveFName.ClientID%>").value = Dg_Leave.Rows[iRecordIndex].Cells[2].Value;
		        
		        if(document.getElementById("<%=txt_LeaveSName.ClientID%>").value=='SL' || document.getElementById("<%=txt_LeaveSName.ClientID%>").value=='CL' || document.getElementById("<%=txt_LeaveSName.ClientID%>").value=='PL')
		        {
		            document.getElementById("<%=txt_LeaveSName.ClientID%>").disabled=true;
		            document.getElementById("<%=txt_LeaveFName.ClientID%>").disabled=true;
		        }
                document.getElementById("<%=txt_YearlyLimit.ClientID%>").value=Dg_Leave.Rows[iRecordIndex].Cells[3].Value;
                document.getElementById("<%=txt_CarryForwordLimit.ClientID%>").value=Dg_Leave.Rows[iRecordIndex].Cells[4].Value;
                var Gender=Dg_Leave.Rows[iRecordIndex].Cells[5].Value;
                if(Gender=='All')
                document.getElementById("Flyout_LeaveTypes_rbtnlst_Gender_0").checked=true;
                else if(Gender=='Female')
                document.getElementById("Flyout_LeaveTypes_rbtnlst_Gender_1").checked=true;
                else if(Gender=='Male')
                document.getElementById("Flyout_LeaveTypes_rbtnlst_Gender_2").checked=true;
                document.getElementById("<%=drp_markedAs.ClientID%>").value=Dg_Leave.Rows[iRecordIndex].Cells[6].Value;
		        document.getElementById("<%=txt_Description.ClientID%>").innerText = Dg_Leave.Rows[iRecordIndex].Cells[9].Value.replace(/<BR>/gi,'\n');;
		        document.getElementById("<%=Hdn_LeaveTypeId.ClientID %>").value = Dg_Leave.Rows[iRecordIndex].Cells[0].Value;  
		        var IsNegativeBalance =Dg_Leave.Rows[iRecordIndex].Cells[10].Value;
		        if(IsNegativeBalance==-1)
                    document.getElementById("<%=chk_NegativeBalance.ClientID %>").checked =  true;
               else
                    document.getElementById("<%=chk_NegativeBalance.ClientID %>").checked =  false;
	                
		            
		        
		   }
		   
		    function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.LeaveTypeId =document.getElementById("<%=Hdn_LeaveTypeId.ClientID %>").value ;
		        if(document.getElementById("Flyout_LeaveTypes_rbtnlst_Gender_0").checked ==  true)
		        oRecord.Gender='All';
		        else if(document.getElementById("Flyout_LeaveTypes_rbtnlst_Gender_1").checked ==  true)
		        oRecord.Gender='Female';
		        else if(document.getElementById("Flyout_LeaveTypes_rbtnlst_Gender_2").checked ==  true)
		        oRecord.Gender='Male';
		        oRecord.Error='';
		        Dg_Leave.executeInsert(oRecord);
		    }
		    
            function clearFlyout() 
            {
                document.getElementById("<%=txt_LeaveSName.ClientID%>").disabled=false;
		        document.getElementById("<%=txt_LeaveFName.ClientID%>").disabled=false;
		        
                document.getElementById("<%=txt_LeaveSName.ClientID %>").value = '';
                document.getElementById("<%=txt_CarryForwordLimit.ClientID %>").value =  '0';
                document.getElementById("<%=txt_YearlyLimit.ClientID %>").value =  '0';
	            document.getElementById("<%=txt_LeaveFName.ClientID %>").value = '';
                document.getElementById("Flyout_LeaveTypes_rbtnlst_Gender_0").checked =  true;
	            document.getElementById("Flyout_LeaveTypes_rbtnlst_Gender_1").checked =  false;
	            document.getElementById("Flyout_LeaveTypes_rbtnlst_Gender_2").checked =  false;
	            document.getElementById("<%=chk_NegativeBalance.ClientID %>").checked =  false;
	            document.getElementById("<%=drp_markedAs.ClientID %>").selectedindex =  '0';
	            document.getElementById("<%=txt_Description.ClientID %>").value =  '';
	            document.getElementById("<%=Hdn_LeaveTypeId.ClientID %>").value = '0';
	            document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		   }
		    
		    
    </script>

</body>
</html>
