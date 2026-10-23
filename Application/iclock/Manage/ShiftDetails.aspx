<%@ page language="VB" autoeventwireup="false" inherits="Manage_ShiftDetails, App_Web_usmjemmz" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        record.Error = '';
        var Name = record.ShiftSName;
        if (Name == 'GS') {
            alert("Shift '" + record.ShiftFName + "' can not be delete.");
            return false;
        }

        document.getElementById("<%=Hdn_ShiftId.ClientID %>").value = record.ShiftId;
        if (confirm("Are you sure you want to delete? "))
            return true;
        else
            return false;
    }

    function OnDelete(record) {
        alert(record.Error);
    }

    function OnInsert(record) {
        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = record.Error;
    }
	
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body onload="chk_PunchBeginDuartion_CheckedChange(); chk_PunchEndDuartion_CheckedChange();chk_PartialDayOn_CheckedChange();chk_GraceTime_CheckedChange();chk_FlexyShift_CheckedChange();">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                <td colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Shift List
                </td>
            </tr>
            <tr style="background-color: lightsteelblue;">
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <obout:Grid ID="Dg_Shift" runat="server" AllowFiltering="true" CallbackMode="true"
                        EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                        FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                        <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                            OnClientDelete="OnDelete" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column DataField="ShiftId" Visible="false" ReadOnly="true" HeaderText="ShiftId " />
                            <obout:Column ID="Column1" DataField="ShiftFName" SortOrder="Asc" Visible="true"
                                Width="340" HeaderText="Shift Name" runat="server" />
                            <obout:Column ID="Column2" DataField="ShiftSName" Visible="true" Width="300" HeaderText="Short Name"
                                runat="server" />
                            <obout:Column ID="Column3" DataField="BeginTime" Visible="true" Width="150" HeaderText="Begin Time"
                                runat="server" />
                            <obout:Column ID="Column4" DataField="EndTime" Visible="true" Width="150" HeaderText="End Time"
                                runat="server" />
                            <obout:Column ID="Column5" DataField="Break1" Visible="false" Width="200" HeaderText="End Time"
                                runat="server" />
                            <obout:Column ID="Column6" DataField="Break2" Visible="false" Width="200" HeaderText="End Time"
                                runat="server" />
                            <obout:Column ID="Column7" DataField="Break1BeginTime" Visible="false" Width="200"
                                HeaderText="End Time" runat="server" />
                            <obout:Column ID="Column8" DataField="Break2BeginTime" Visible="false" Width="200"
                                HeaderText="End Time" runat="server" />
                            <obout:Column ID="Column9" DataField="Break1EndTime" Visible="false" Width="200"
                                HeaderText="End Time" runat="server" />
                            <obout:Column ID="Column10" DataField="Break2EndTime" Visible="false" Width="200"
                                HeaderText="End Time" runat="server" />
                            <obout:Column ID="Column11" DataField="PunchBeginDuration" Visible="false" Width="200"
                                HeaderText="PunchBeginDuration" runat="server" />
                            <obout:Column ID="Column12" DataField="PunchEndDuration" Visible="false" Width="200"
                                HeaderText="PunchEndDuration" runat="server" />
                            <obout:Column ID="Column13" DataField="IsGraceTimeApplicable" Visible="false" Width="200"
                                HeaderText="PunchEndDuration" runat="server" />
                            <obout:Column ID="Column14" DataField="GraceTime" Visible="false" Width="200" HeaderText="PunchEndDuration"
                                runat="server" />
                            <obout:Column ID="Column15" DataField="IsPartialDayApplicable" Visible="false" Width="200"
                                HeaderText="PunchEndDuration" runat="server" />
                            <obout:Column ID="Column16" DataField="PartialDay" Visible="false" Width="200" HeaderText="PunchEndDuration"
                                runat="server" />
                            <obout:Column ID="Column17" DataField="PartialDayBeginTime" Visible="false" Width="200"
                                HeaderText="PunchEndDuration" runat="server" />
                            <obout:Column ID="Column18" DataField="PartialDayEndTime" Visible="false" Width="200"
                                HeaderText="PunchEndDuration" runat="server" />
                            <obout:Column ID="Column19" DataField="IsFlexibleShift" Visible="false" Width="200"
                                HeaderText="IsFlexibleShift" runat="server" />
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
                                        class="ob_gAL">
                                        <%#CheckPermissionsEdit("Edit")%></a>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplAddBtn">
                                <Template>
                                    <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add')" class="ob_gAL">
                                        <%#CheckPermissions("Add")%></a>
                                </Template>
                            </obout:GridTemplate>
                        </Templates>
                    </obout:Grid>
                </td>
            </tr>
        </table>
        <obout:Flyout runat="server" ID="Flyout1"  Position=BOTTOM_CENTER
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Shift Details</legend>
                            <table>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Shift Name
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_ShiftFullName" CssClass="WebControls" runat="server"></asp:TextBox>
                                    </td>
                                    <td style="font-weight: bold;">
                                        Short Name
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_ShiftShortName" runat="server" CssClass="WebControls"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Begin Time
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="msktxt_HHBeginTime" CssClass="WebControls" Width="40">
                                        </asp:DropDownList>
                                        &nbsp;:&nbsp;<asp:DropDownList runat="server" CssClass="WebControls" ID="msktxt_mmBeginTime"
                                            Width="50">
                                        </asp:DropDownList>
                                        &nbsp;HH:MM 24 hr fmt
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;End Time
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" CssClass="WebControls" ID="msktxt_HHEndTime" Width="40">
                                        </asp:DropDownList>
                                        &nbsp;:&nbsp;<asp:DropDownList runat="server" ID="msktxt_mmEndTime" CssClass="WebControls"
                                            Width="50">
                                        </asp:DropDownList>
                                        &nbsp;HH:MM 24 hr fmt
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="left">
                                        <asp:CheckBox ID="chk_Break1" CssClass="WebControls" runat="server" Text="BREAK 1"
                                            onclick="Chk_Break1_CheckedChange();" />
                                        <%--<input id="chk_Break1" runat="server" type="checkbox" value="BREAK 1"   onclick="Chk_Break1_CheckedChange()"/>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Begin Time
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" CssClass="WebControls" ID="drp_HHBreak1BeginTime"
                                            Width="40">
                                        </asp:DropDownList>
                                        &nbsp;:&nbsp;<asp:DropDownList runat="server" ID="drp_mmBreak1BeginTime" Width="50">
                                        </asp:DropDownList>
                                        &nbsp;HH:MM 24 hr fmt
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;End Time
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" CssClass="WebControls" ID="drp_HHBreak1EndTime"
                                            Width="40">
                                        </asp:DropDownList>
                                        &nbsp;:&nbsp;<asp:DropDownList runat="server" ID="drp_mmBreak1EndTime" Width="50">
                                        </asp:DropDownList>
                                        &nbsp;HH:MM 24 hr fmt
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="left">
                                        <%--<input id="chk_Break2" runat="server" type="checkbox" value="BREAK 2" onclick="Chk_Break2_CheckedChange()"/>--%>
                                        <asp:CheckBox ID="chk_Break2" CssClass="WebControls" runat="server" Text="BREAK 2"
                                            onclick="Chk_Break2_CheckedChange();" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Begin Time
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" CssClass="WebControls" ID="drp_HHBreak2BeginTime"
                                            Width="40">
                                        </asp:DropDownList>
                                        &nbsp;:&nbsp;<asp:DropDownList runat="server" ID="drp_mmBreak2BeginTime" Width="50">
                                        </asp:DropDownList>
                                        &nbsp;HH:MM 24 hr fmt
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;End Time
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" CssClass="WebControls" ID="drp_HHBreak2EndTime"
                                            Width="40">
                                        </asp:DropDownList>
                                        &nbsp;:&nbsp;<asp:DropDownList runat="server" ID="drp_mmBreak2EndTime" Width="50">
                                        </asp:DropDownList>
                                        &nbsp;HH:MM 24 hr fmt
                                    </td>
                                </tr>
                                 <tr>
                                    <td colspan="4" align="left">
                                        <asp:CheckBox ID="chk_FlexyShift" CssClass="WebControls" runat="server" Text="Is Flexible Shift"
                                            onclick="chk_FlexyShift_CheckedChange();" />
                                    </td>
                                </tr>

                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_PunchBeginDuartion" CssClass="WebControls" runat="server" onclick="chk_PunchBeginDuartion_CheckedChange();"
                            Text="Punch Begin Before" />&nbsp;&nbsp;<asp:TextBox ID="txt_punchbeginDuration"
                                Width="50px" runat="server"></asp:TextBox>&nbsp;mins (Default value comes
                        from Master Settings)
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_PunchEndDuartion" CssClass="WebControls" runat="server" onclick="chk_PunchEndDuartion_CheckedChange();"
                            Text="Punch End After" />&nbsp;<asp:TextBox ID="txt_punchEndDuration" runat="server"
                                Width="50px"></asp:TextBox>&nbsp;mins (Default is Next Day Shift Begin -
                        Punch Begin Duration)
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_GraceTime" CssClass="WebControls" runat="server" onclick="chk_GraceTime_CheckedChange();"
                            Text="Grace Time" />&nbsp;<asp:TextBox ID="txtGraceTime" runat="server" Width="50px"></asp:TextBox>&nbsp;mins
                        (Default value comes from Employee Category Settings)
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chk_PartialDayOn" CssClass="WebControls" runat="server" onclick="chk_PartialDayOn_CheckedChange();"
                            Text="Partial Day On" />&nbsp;&nbsp;<asp:DropDownList ID="drp_PartialDayOn" runat="server">
                            </asp:DropDownList>
                        &nbsp;Begins At&nbsp;<asp:DropDownList runat="server" ID="drp_PartialDayBeginTimeHH"
                            CssClass="WebControls" Width="40">
                        </asp:DropDownList>
                        &nbsp;<asp:DropDownList runat="server" CssClass="WebControls" ID="drp_PartialDayBeginTimeMM"
                            Width="50">
                        </asp:DropDownList>
                        &nbsp;End At&nbsp;<asp:DropDownList runat="server" ID="drp_PartialDayEndTimeHH" CssClass="WebControls"
                            Width="40">
                        </asp:DropDownList>
                        &nbsp;<asp:DropDownList runat="server" CssClass="WebControls" ID="drp_PartialDayEndTimeMM"
                            Width="50">
                        </asp:DropDownList>
                        &nbsp;HH:MM 24 hr fmt
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <hr />
                        <asp:Label ID="Lbl_InvalidError" ForeColor="red" runat="server" Text=""></asp:Label><input
                            id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        <asp:HiddenField ID="Hdn_ShiftId" runat="server" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
    </div>
    </form>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddShifts") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditShifts") Then
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
		    
		    function SetValueInDropDown(HHobject,mmobject,Value)
		    {
		        var Hours=Value.split(':')[0];
		        var Minutes=Value.split(':')[1];
		        
		        HHobject.value=Hours;
		        mmobject.value=Minutes;
		    }
		    	  
	
		    
		   
		    
		    function populateEditControls(iRecordIndex) 
		    {	
		        document.getElementById("<%=txt_ShiftFullName.ClientID%>").value = Dg_Shift.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=txt_ShiftShortName.ClientID%>").value = Dg_Shift.Rows[iRecordIndex].Cells[2].Value;
		        
		        if(document.getElementById("<%=txt_ShiftShortName.ClientID%>").value=='GS' || document.getElementById("<%=txt_ShiftFullName.ClientID%>").value=='General')
		        {
		            document.getElementById("<%=txt_ShiftShortName.ClientID%>").disabled=true;
		            document.getElementById("<%=txt_ShiftFullName.ClientID%>").disabled=true;
		        }
		        
		        SetValueInDropDown(document.getElementById("<%=msktxt_HHBeginTime.ClientID%>"),document.getElementById("<%=msktxt_mmBeginTime.ClientID%>"),Dg_Shift.Rows[iRecordIndex].Cells[3].Value);
		        SetValueInDropDown(document.getElementById("<%=msktxt_HHEndTime.ClientID%>"),document.getElementById("<%=msktxt_mmEndTime.ClientID%>"),Dg_Shift.Rows[iRecordIndex].Cells[4].Value);
		        
		        if(Dg_Shift.Rows[iRecordIndex].Cells[5].Value=='0')
		        {
		            document.getElementById("<%=chk_Break1.ClientID %>").checked=false;
		        }
		        else
		        {
		            document.getElementById("<%=chk_Break1.ClientID %>").checked=true;
		            SetValueInDropDown(document.getElementById("<%=drp_HHBreak1BeginTime.ClientID%>"),document.getElementById("<%=drp_mmBreak1BeginTime.ClientID%>"),Dg_Shift.Rows[iRecordIndex].Cells[7].Value);
		            SetValueInDropDown(document.getElementById("<%=drp_HHBreak1EndTime.ClientID%>"),document.getElementById("<%=drp_mmBreak1EndTime.ClientID%>"),Dg_Shift.Rows[iRecordIndex].Cells[9].Value);
		        }    
		        
		        if(Dg_Shift.Rows[iRecordIndex].Cells[6].Value=='0')
		        {
		            document.getElementById("<%=chk_Break2.ClientID %>").checked=false;
		        }    
		        else
		        {
		            document.getElementById("<%=chk_Break2.ClientID %>").checked=true;
		            SetValueInDropDown(document.getElementById("<%=drp_HHBreak2BeginTime.ClientID%>"),document.getElementById("<%=drp_mmBreak2BeginTime.ClientID%>"),Dg_Shift.Rows[iRecordIndex].Cells[8].Value);
		            SetValueInDropDown(document.getElementById("<%=drp_HHBreak2EndTime.ClientID%>"),document.getElementById("<%=drp_mmBreak2EndTime.ClientID%>"),Dg_Shift.Rows[iRecordIndex].Cells[10].Value);
		        }    
		        
		        
		        document.getElementById("<%=Hdn_ShiftId.ClientID %>").value = Dg_Shift.Rows[iRecordIndex].Cells[0].Value;  
		        Chk_Break1_CheckedChange();
		        
		        Chk_Break2_CheckedChange();
		        
		        document.getElementById("<%=txt_punchbeginDuration.ClientID%>").value=Dg_Shift.Rows[iRecordIndex].Cells[11].Value
		        if(document.getElementById("<%=txt_punchbeginDuration.ClientID%>").value=='0')
		            document.getElementById("<%=chk_PunchBeginDuartion.ClientID%>").checked=false;
		        else
		            document.getElementById("<%=chk_PunchBeginDuartion.ClientID%>").checked=true;
		            
		        document.getElementById("<%=txt_punchEndDuration.ClientID%>").value=Dg_Shift.Rows[iRecordIndex].Cells[12].Value
		        if(document.getElementById("<%=txt_punchEndDuration.ClientID%>").value=='0')
		            document.getElementById("<%=chk_PunchEndDuartion.ClientID%>").checked=false;
		        else
		            document.getElementById("<%=chk_PunchEndDuartion.ClientID%>").checked=true;
		            
		        document.getElementById("<%=txtGraceTime.ClientID%>").value=Dg_Shift.Rows[iRecordIndex].Cells[14].Value
		        if(document.getElementById("<%=txtGraceTime.ClientID%>").value=='')
		            document.getElementById("<%=chk_GraceTime.ClientID%>").checked=false;
		        else
		            document.getElementById("<%=chk_GraceTime.ClientID%>").checked=true; 
		            
		        if(Dg_Shift.Rows[iRecordIndex].Cells[15].Value=='0')    
		            document.getElementById("<%=chk_PartialDayOn.ClientID%>").checked=false;
		        else
		            {
		                document.getElementById("<%=chk_PartialDayOn.ClientID%>").checked=true;
		                document.getElementById("<%=drp_PartialDayOn.ClientID%>").value=Dg_Shift.Rows[iRecordIndex].Cells[16].Value;
		                SetValueInDropDown(document.getElementById("<%=drp_PartialDayBeginTimeHH.ClientID%>"),document.getElementById("<%=drp_PartialDayBeginTimeMM.ClientID%>"),Dg_Shift.Rows[iRecordIndex].Cells[17].Value);
		                SetValueInDropDown(document.getElementById("<%=drp_PartialDayEndTimeHH.ClientID%>"),document.getElementById("<%=drp_PartialDayEndTimeMM.ClientID%>"),Dg_Shift.Rows[iRecordIndex].Cells[18].Value);
		             }   

                      if(Dg_Shift.Rows[iRecordIndex].Cells[19].Value=='0')    
                      {
                         document.getElementById("<%=chk_FlexyShift.ClientID%>").checked=false;
                      }
                      else
                      {
                         document.getElementById("<%=chk_FlexyShift.ClientID%>").checked=true;
                      }
		            chk_PunchBeginDuartion_CheckedChange(); 
		            chk_PunchEndDuartion_CheckedChange();
		            chk_PartialDayOn_CheckedChange();
		            chk_GraceTime_CheckedChange();
                    chk_FlexyShift_CheckedChange();
		        
		   }
		   
		   function Chk_Break1_CheckedChange()
		   {
		   
		   if(document.getElementById("<%=chk_Break1.ClientID %>").checked==false)
		    {
		        if(document.getElementById("<%=chk_Break2.ClientID %>").checked)
		        {
		            alert('Break2 is possible if break1 is there.')
		            document.getElementById("<%=chk_Break2.ClientID %>").checked=false;
		            Chk_Break2_CheckedChange();
		        }
		    }
		    var Id=document.getElementById("<%=chk_Break1.ClientID %>");
		    if(Id.checked)
		    {
		        document.getElementById("<%=drp_HHBreak1BeginTime.ClientID %>").disabled = false;
		        document.getElementById("<%=drp_HHBreak1EndTime.ClientID %>").disabled = false;
		        document.getElementById("<%=drp_mmBreak1BeginTime.ClientID %>").disabled = false;
		        document.getElementById("<%=drp_mmBreak1EndTime.ClientID %>").disabled = false;
		    }
		    else
		    {
		        document.getElementById("<%=drp_HHBreak1BeginTime.ClientID %>").disabled = true;
		        document.getElementById("<%=drp_HHBreak1EndTime.ClientID %>").disabled = true;
		        document.getElementById("<%=drp_mmBreak1BeginTime.ClientID %>").disabled = true;
		        document.getElementById("<%=drp_mmBreak1EndTime.ClientID %>").disabled = true;
		    }
		   }
		   
		    function Chk_Break2_CheckedChange()
		   {
		    if(document.getElementById("<%=chk_Break1.ClientID %>").checked==false)
		    {
		        if(document.getElementById("<%=chk_Break2.ClientID %>").checked)
		        {
		            alert('Break2 is possible if break1 is there.')
		            document.getElementById("<%=chk_Break2.ClientID %>").checked=false;
		        }
		    }
		    var Id=document.getElementById("<%=chk_Break2.ClientID %>");
		    if(Id.checked)
		    {
		        document.getElementById("<%=drp_HHBreak2BeginTime.ClientID %>").disabled = false;
		        document.getElementById("<%=drp_HHBreak2EndTime.ClientID %>").disabled = false;
		        document.getElementById("<%=drp_mmBreak2BeginTime.ClientID %>").disabled = false;
		        document.getElementById("<%=drp_mmBreak2EndTime.ClientID %>").disabled = false;
		        
		    }
		    else
		    {
		        document.getElementById("<%=drp_HHBreak2BeginTime.ClientID %>").disabled = true;
		        document.getElementById("<%=drp_HHBreak2EndTime.ClientID %>").disabled = true;
		        document.getElementById("<%=drp_mmBreak2BeginTime.ClientID %>").disabled = true;
		        document.getElementById("<%=drp_mmBreak2EndTime.ClientID %>").disabled = true;
		    }
		   }
		   

		      
		       function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.ShiftId =document.getElementById("<%=Hdn_ShiftId.ClientID %>").value ;
		        Dg_Shift.executeInsert(oRecord);
		    }
		    
            function clearFlyout() 
            {
                var CurrentTime=new Date();
                document.getElementById("<%=txt_ShiftFullName.ClientID %>").value = '';
		        document.getElementById("<%=txt_ShiftShortName.ClientID %>").value = '';
		        
		        document.getElementById("<%=txt_ShiftShortName.ClientID%>").disabled=false;
		        document.getElementById("<%=txt_ShiftFullName.ClientID%>").disabled=false;
		        
		        var minutes=CurrentTime.getMinutes();
		        var hours=CurrentTime.getHours();
		        
		        if(minutes<10)
		            minutes='0'+minutes
		        
		         if(hours<10)
		            hours='0'+hours
		            
		            
		        document.getElementById("<%=msktxt_HHBeginTime.ClientID %>").value =  hours;
		        document.getElementById("<%=msktxt_mmBeginTime.ClientID %>").value =  minutes;
		        
		        document.getElementById("<%=msktxt_HHEndTime.ClientID %>").value =  hours;
		        document.getElementById("<%=msktxt_mmEndTime.ClientID %>").value =  minutes
		        
		        document.getElementById("<%=drp_HHBreak1BeginTime.ClientID %>").value = hours;
		        document.getElementById("<%=drp_mmBreak1BeginTime.ClientID %>").value =  minutes
		        
		        
		        document.getElementById("<%=drp_HHBreak2BeginTime.ClientID %>").value = hours;
		        document.getElementById("<%=drp_mmBreak2BeginTime.ClientID %>").value =  minutes
		        
		        
		        document.getElementById("<%=drp_HHBreak1EndTime.ClientID %>").value =  hours;
		        document.getElementById("<%=drp_mmBreak1EndTime.ClientID %>").value =  minutes
		        
		        
		        document.getElementById("<%=drp_HHBreak2EndTime.ClientID %>").value =  hours;
		        document.getElementById("<%=drp_mmBreak2EndTime.ClientID %>").value =  minutes
		        
		        document.getElementById("<%=chk_Break1.ClientID %>").checked = false;
		        document.getElementById("<%=chk_Break2.ClientID %>").checked = false;
		        document.getElementById("<%=Hdn_ShiftId.ClientID %>").value = '0';
		        
		        Chk_Break1_CheckedChange();
		        
		        Chk_Break2_CheckedChange();
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		        
		        document.getElementById("<%=txt_punchbeginDuration.ClientID%>").value='0';
		        document.getElementById("<%=chk_PunchBeginDuartion.ClientID%>").checked=false;
		        document.getElementById("<%=chk_GraceTime.ClientID%>").checked=false;
		        document.getElementById("<%=chk_PartialDayOn.ClientID%>").checked=false;
		        document.getElementById("<%=drp_PartialDayOn.ClientID%>").selectedindex=5;
		        
		        
		        
		        document.getElementById("<%=txt_punchEndDuration.ClientID%>").value='0';
		        document.getElementById("<%=chk_PunchEndDuartion.ClientID%>").checked=false;
                document.getElementById("<%=chk_FlexyShift.ClientID %>").checked = false;

		        chk_PunchBeginDuartion_CheckedChange(); 
		        chk_PunchEndDuartion_CheckedChange();
		        chk_PartialDayOn_CheckedChange();
		        chk_GraceTime_CheckedChange();
		        chk_FlexyShift_CheckedChange();

		    }
		    
		    function chk_PunchEndDuartion_CheckedChange()
		    {
		        var Sender=document.getElementById("<%=chk_PunchEndDuartion.ClientID%>");
		        if(Sender.checked)
		            {
		                document.getElementById("<%=txt_punchEndDuration.ClientID%>").disabled=false;
		            }
		        else
		            {
		                document.getElementById("<%=txt_punchEndDuration.ClientID%>").disabled=true;
		                document.getElementById("<%=txt_punchEndDuration.ClientID%>").value='0';
		            }    
		    }
		    
		    
		    function chk_PunchBeginDuartion_CheckedChange()
		    {
		        var Sender=document.getElementById("<%=chk_PunchBeginDuartion.ClientID%>");
		        if(Sender.checked)
		            {
		                document.getElementById("<%=txt_punchbeginDuration.ClientID%>").disabled=false;
		            }
		        else
		            {
		                document.getElementById("<%=txt_punchbeginDuration.ClientID%>").disabled=true;
		                document.getElementById("<%=txt_punchbeginDuration.ClientID%>").value='0';
		            }    
		    }
		    
		    function chk_GraceTime_CheckedChange()
		    {
		        var Sender=document.getElementById("<%=chk_GraceTime.ClientID%>");
		        if(Sender.checked)
		            {
		                document.getElementById("<%=txtGraceTime.ClientID%>").disabled=false;
		            }
		        else
		            {
		                document.getElementById("<%=txtGraceTime.ClientID%>").disabled=true;
		            }    
		    }
		    
		    
		    function chk_PartialDayOn_CheckedChange()
		    {
		        var Sender=document.getElementById("<%=chk_PartialDayOn.ClientID%>");
		        if(Sender.checked)
		            {
		                document.getElementById("<%=drp_PartialDayOn.ClientID%>").disabled=false;
		                document.getElementById("<%=drp_PartialDayBeginTimeHH.ClientID%>").disabled=false;
		                document.getElementById("<%=drp_PartialDayBeginTimeMM.ClientID%>").disabled=false;
		                document.getElementById("<%=drp_PartialDayEndTimeHH.ClientID%>").disabled=false;
		                document.getElementById("<%=drp_PartialDayEndTimeMM.ClientID%>").disabled=false;
		                
		            }
		        else
		            {
		                document.getElementById("<%=drp_PartialDayOn.ClientID%>").disabled=true;
		                document.getElementById("<%=drp_PartialDayBeginTimeHH.ClientID%>").disabled=true;
		                document.getElementById("<%=drp_PartialDayBeginTimeMM.ClientID%>").disabled=true;
		                document.getElementById("<%=drp_PartialDayEndTimeHH.ClientID%>").disabled=true;
		                document.getElementById("<%=drp_PartialDayEndTimeMM.ClientID%>").disabled=true;
		            }    
		    }
		    
		   

           function chk_FlexyShift_CheckedChange()
		   {
              var Sender=document.getElementById("<%=chk_FlexyShift.ClientID%>");
              if(Sender.checked)
		        {
                   var Break1Sender=document.getElementById("<%=chk_Break1.ClientID%>");
                   Break1Sender.checked=false;
                   document.getElementById("<%=chk_Break1.ClientID %>").disabled = true;
                   document.getElementById("<%=drp_HHBreak1BeginTime.ClientID %>").disabled = true;
		           document.getElementById("<%=drp_HHBreak1EndTime.ClientID %>").disabled = true;
		           document.getElementById("<%=drp_mmBreak1BeginTime.ClientID %>").disabled = true;
		           document.getElementById("<%=drp_mmBreak1EndTime.ClientID %>").disabled = true;

                   var Break2Sender=document.getElementById("<%=chk_Break2.ClientID%>");
                   Break2Sender.checked=false;
                   document.getElementById("<%=chk_Break2.ClientID %>").disabled = true;
                   document.getElementById("<%=drp_HHBreak2BeginTime.ClientID %>").disabled = true;
		           document.getElementById("<%=drp_HHBreak2EndTime.ClientID %>").disabled = true;
		           document.getElementById("<%=drp_mmBreak2BeginTime.ClientID %>").disabled = true;
		           document.getElementById("<%=drp_mmBreak2EndTime.ClientID %>").disabled = true;


                   var PunchBeginDuartionSender=document.getElementById("<%=chk_PunchBeginDuartion.ClientID%>");
                   PunchBeginDuartionSender.checked=false;
                   document.getElementById("<%=chk_PunchBeginDuartion.ClientID%>").disabled=true;
                   document.getElementById("<%=txt_punchbeginDuration.ClientID%>").disabled=true;
                   document.getElementById("<%=txt_punchbeginDuration.ClientID%>").value='0';
		      
                   var PunchEndDuartionSender=document.getElementById("<%=chk_PunchEndDuartion.ClientID%>");
                   PunchEndDuartionSender.checked=false;
                   document.getElementById("<%=chk_PunchEndDuartion.ClientID%>").disabled=true;	         
		           document.getElementById("<%=txt_punchEndDuration.ClientID%>").disabled=true;	         
		           document.getElementById("<%=txt_punchEndDuration.ClientID%>").value='0';

                   var GraceTimeSender=document.getElementById("<%=chk_GraceTime.ClientID%>");
                   GraceTimeSender.checked=false;
                   document.getElementById("<%=chk_GraceTime.ClientID%>").disabled=true;
                   document.getElementById("<%=txtGraceTime.ClientID%>").disabled=true;
                   document.getElementById("<%=txtGraceTime.ClientID%>").value='';


                   var PartialDayOnSender=document.getElementById("<%=chk_PartialDayOn.ClientID%>");
                   PartialDayOnSender.checked=false;
                   document.getElementById("<%=chk_PartialDayOn.ClientID%>").disabled=true;
                   document.getElementById("<%=drp_PartialDayOn.ClientID%>").disabled=true;
		           document.getElementById("<%=drp_PartialDayBeginTimeHH.ClientID%>").disabled=true;
		           document.getElementById("<%=drp_PartialDayBeginTimeMM.ClientID%>").disabled=true;
		           document.getElementById("<%=drp_PartialDayEndTimeHH.ClientID%>").disabled=true;
		           document.getElementById("<%=drp_PartialDayEndTimeMM.ClientID%>").disabled=true;

		       

                }
                else{
                   document.getElementById("<%=chk_Break1.ClientID %>").disabled = false;
                   document.getElementById("<%=drp_HHBreak1BeginTime.ClientID %>").disabled = false;
		           document.getElementById("<%=drp_HHBreak1EndTime.ClientID %>").disabled = false;
		           document.getElementById("<%=drp_mmBreak1BeginTime.ClientID %>").disabled = false;
		           document.getElementById("<%=drp_mmBreak1EndTime.ClientID %>").disabled = false;

                   document.getElementById("<%=chk_Break2.ClientID %>").disabled = false;
                   document.getElementById("<%=drp_HHBreak2BeginTime.ClientID %>").disabled = false;
		           document.getElementById("<%=drp_HHBreak2EndTime.ClientID %>").disabled = false;
		           document.getElementById("<%=drp_mmBreak2BeginTime.ClientID %>").disabled = false;
		           document.getElementById("<%=drp_mmBreak2EndTime.ClientID %>").disabled = false;

                   document.getElementById("<%=chk_PunchBeginDuartion.ClientID%>").disabled=false;
                   document.getElementById("<%=txt_punchbeginDuration.ClientID%>").disabled=false;

                   document.getElementById("<%=chk_PunchEndDuartion.ClientID %>").disabled = false;
                   document.getElementById("<%=txt_punchEndDuration.ClientID%>").disabled=false;

                   document.getElementById("<%=chk_GraceTime.ClientID%>").disabled=false;
                   document.getElementById("<%=txtGraceTime.ClientID%>").disabled=false;

                   document.getElementById("<%=chk_PartialDayOn.ClientID%>").disabled=false;
                   document.getElementById("<%=drp_PartialDayOn.ClientID%>").disabled=false;
		           document.getElementById("<%=drp_PartialDayBeginTimeHH.ClientID%>").disabled=false;
		           document.getElementById("<%=drp_PartialDayBeginTimeMM.ClientID%>").disabled=false;
		           document.getElementById("<%=drp_PartialDayEndTimeHH.ClientID%>").disabled=false;
		           document.getElementById("<%=drp_PartialDayEndTimeMM.ClientID%>").disabled=false;
		        
                }
           }
		    
    </script>
</body>
</html>
