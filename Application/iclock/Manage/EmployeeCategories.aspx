<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeeCategories, App_Web_kgq5n2bg" debug="true" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        var Name = record.CategorySName;
        if (Name == 'Default') {
            alert("Category '" + record.CategorySName + "' can not be delete.");
            return false;
        }
        document.getElementById("<%=Hdn_CategoryId.ClientID %>").value = record.CategoryId;
        document.getElementById("<%=Hdn_CategoryName.ClientID %>").value = record.CategorySName;
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
<body onload="WeeklyOff1_OnClick(); WeeklyOff2_OnClick();chk_CalculateHalfDayifWorkDurationislessthan_onclick(); chk_CalculateAbsentDayifWorkDurationislessthan_onclick();Chk_MarkHalfDayLate_onclick();chk_MarkEarlyGoing_onclick();chk_MarkAbsentWhenLate_onclick();">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                <td colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Category List
                </td>
            </tr>
            <tr style="background-color: lightsteelblue;">
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 323px; text-align: top;" valign="top">
                    <obout:Grid ID="Dg_Category" align="top" AllowFiltering="true" runat="server" CallbackMode="true"
                        EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                        FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                        <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                            OnClientDelete="OnDelete" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column ID="Column0" DataField="CategoryId" Visible="false" Width="300" HeaderText="CategoryId"
                                runat="server" />
                            <obout:Column ID="Column1" DataField="CategoryFName" SortOrder="Asc" Visible="true"
                                Width="500" HeaderText="Full Name" runat="server" />
                            <obout:Column ID="Column2" DataField="CategorySName" Visible="true" Width="480" HeaderText="Category Name"
                                runat="server" />
                            <obout:Column ID="Column3" DataField="OTFormula" Visible="false" Width="100" HeaderText="OvertimeFormula"
                                runat="server" />
                            <obout:Column ID="Column4" DataField="MinOT" Visible="false" Width="100" HeaderText="MinOT"
                                runat="server" />
                            <obout:Column ID="Column5" DataField="ForMissedPunch" Visible="false" Width="100"
                                HeaderText="ForMissedPunch" runat="server" />
                            <obout:Column ID="Column6" DataField="GraceTime" Visible="false" Width="110 " HeaderText="GraceTime"
                                runat="server" />
                            <obout:Column ID="Column7" DataField="WeeklyOff1" Visible="false" Width="100" HeaderText="WeeklyOff1"
                                runat="server" />
                            <obout:Column ID="Column8" DataField="SundayWeeklyOff" Visible="false" Width="100"
                                HeaderText="WeeklyOff2" runat="server" />
                            <obout:Column ID="Column9" DataField="WeeklyOff2" Visible="false" Width="100" HeaderText="WhichSaturday"
                                runat="server" />
                            <obout:Column ID="Column10" DataField="SaturdayWeeklyOff" Visible="false" Width="100"
                                HeaderText="SaturdayWeeklyOff" runat="server" />
                            <obout:Column ID="Column11" DataField="WhichSaturday" Visible="false" Width="100"
                                HeaderText="WhichSaturday" runat="server" />
                            <obout:Column ID="Column12" DataField="ConsiderEarlyPunch" Visible="false" Width="100"
                                HeaderText="ConsiderEarlyPunch" runat="server" />
                            <obout:Column ID="Column13" DataField="ConsiderLatePunch" Visible="false" Width="100"
                                HeaderText="ConsiderLatePunch" runat="server" />
                            <obout:Column ID="Column14" DataField="ConsiderFirstLastPunch" Visible="false" Width="100"
                                HeaderText="ConsiderFirstLastPunch" runat="server" />
                            <obout:Column ID="Column15" DataField="DeductBreakHours" Visible="false" Width="100"
                                HeaderText="DeductBreakHours" runat="server" />
                            <obout:Column ID="Column16" DataField="CalculateHalfDay" Visible="false" Width="100"
                                HeaderText="CalculateHalfDay" runat="server" />
                            <obout:Column ID="Column17" DataField="CalculateAbsentDay" Visible="false" Width="100"
                                HeaderText="CalculateAbsentDay" runat="server" />
                            <obout:Column ID="Column18" DataField="AbsentDayMins" Visible="false" Width="100"
                                HeaderText="CalculateAbsentDay" runat="server" />
                            <obout:Column ID="Column19" DataField="HalfDayMins" Visible="false" Width="100" HeaderText="CalculateAbsentDay"
                                runat="server" />
                            <obout:Column ID="Column20" DataField="MarkWOandHAsAbsent" Visible="false" Width="100"
                                HeaderText="MarkWOandHAsAbsent" runat="server" />
                            <obout:Column ID="Column21" DataField="MarkAsAbsentForLate" Visible="false" Width="100"
                                HeaderText="MarkAsAbsentForLate" runat="server" />
                            <obout:Column ID="Column22" DataField="ContiousLateDay" Visible="false" Width="100"
                                HeaderText="ContiousLateDay" runat="server" />
                            <obout:Column ID="Column23" DataField="AbsentDayType" Visible="false" Width="100"
                                HeaderText="AbsentDayType" runat="server" />
                            <obout:Column ID="Column24" DataField="MarkWOandHAsPreDayAbsent" Visible="false"
                                Width="100" HeaderText="MarkWOandHAsPreDayAbsent" runat="server" />
                            <obout:Column ID="Column25" DataField="PHalfDayMins" Visible="false" Width="100"
                                HeaderText="PHalfDayMins" runat="server" />
                            <obout:Column ID="Column26" DataField="PAbsentDayMins" Visible="false" Width="100"
                                HeaderText="PAbsentDayMins" runat="server" />
                            <obout:Column ID="Column27" DataField="MarkWOandHAsBothDayAbsent" Visible="false"
                                Width="100" HeaderText="PAbsentDayMins" runat="server" />
                            <obout:Column ID="Column28" DataField="MaxOT" Visible="false" Width="100" HeaderText="MinOT"
                                runat="server" />
                            <obout:Column ID="Column29" DataField="EarlyGoingGraceTime" Visible="false" Width="100"
                                HeaderText="EarlyGoingGraceTime" runat="server" />
                            <%-- edited by sagarika--%>
                            <obout:Column ID="Column30" DataField="MarkHalfDayForLate" Visible="false" Width="100"
                                HeaderText="EarlyGoingGraceTime" runat="server" />
                            <obout:Column ID="Column31" DataField="MarkHalfdayForEarlyGoing" Visible="false"
                                Width="100" HeaderText="EarlyGoingGraceTime" runat="server" />
                            <obout:Column ID="Column32" DataField="HalfDayLateByMins" Visible="false" Width="100"
                                HeaderText="EarlyGoingGraceTime" runat="server" />
                            <obout:Column ID="Column33" DataField="HalfDayEarlyGoingMins" Visible="false" Width="100"
                                HeaderText="EarlyGoingGraceTime" runat="server" />
                            <%-- end--%>
                            <obout:Column HeaderText="Edit" Width="90" AllowEdit="true" AllowDelete="true">
                                <TemplateSettings TemplateId="tplEditBtn" />
                            </obout:Column>
                            <obout:Column HeaderText="Delete" Width="90" AllowEdit="false" AllowDelete="true"
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
        <obout:Flyout runat="server" ID="Flyout1"  Position=BOTTOM_CENTER CloseEvent="NONE"
            OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Category Details</legend>
                            <table>
                                <tr align="left">
                                    <td>
                                        Category Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_CategoryFName" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td colspan="2">
                                        Short Name&nbsp;<asp:TextBox ID="txt_CategorySName" Width="175px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        OT Formula
                                    </td>
                                    <td>
                                        <select runat="server" id="drp_OTFormula" class="WebControls" style="width: 155px;">
                                        </select>
                                    </td>
                                    <td colspan="2">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Min OT&nbsp;
                                        <asp:TextBox ID="txt_MinOT" runat="server" Style="width: 30px"></asp:TextBox>
                                        Mins&nbsp;
                                        <asp:CheckBox ID="chk_MaxOT" runat="server" Text="Max OT " /><asp:TextBox ID="txt_MaxOT"
                                            runat="server" Style="width: 30px"></asp:TextBox>&nbsp;Mins
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_NeglectLastInPunch" runat="server" Text="Neglect Last InPunch(For Missed OutPunch)" />
                                    </td>
                                    <td>
                                        Grace Time For Late Coming
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_graceTime" Style="width: 60px" runat="server"></asp:TextBox>
                                        Mins
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                    </td>
                                    <td>
                                        Grace Time For Early Going
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_graceTimeEarlyGoing" Style="width: 60px" runat="server"></asp:TextBox>
                                        Mins
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_WeeklyOff1" runat="server" Text="Weekly Off 1" onclick="WeeklyOff1_OnClick();" />&nbsp;<asp:DropDownList
                                            ID="drp_WeeklyOff1" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_WeeklyOff2" runat="server" Text="Weekly Off 2" onclick="WeeklyOff2_OnClick();" />&nbsp;<asp:DropDownList
                                            ID="drp_weeklyOff2" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="4" align="right">
                                        <asp:CheckBox ID="chk_Is1WeeklyOff2" runat="server" Text="1st" />
                                        &nbsp;<asp:CheckBox ID="chk_Is2WeeklyOff2" runat="server" Text="2nd" />
                                        &nbsp;<asp:CheckBox ID="chk_Is3WeeklyOff2" runat="server" Text="3rd" />
                                        &nbsp;<asp:CheckBox ID="chk_Is4WeeklyOff2" runat="server" Text="4th" />
                                        &nbsp;&nbsp;<asp:CheckBox ID="chk_Is5WeeklyOff2" runat="server" Text="5th" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_DonotconsiderEarlycomingpunch" runat="server" Text="Consider Early Coming Punch" />
                                    </td>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chk_DonotconsiderLateGoingpunch" runat="server" Text="Consider Late Going Punch" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_ConsiderOnlyFirstandLastPunchinAttCalculatuions" runat="server"
                                            Text="Consider only First And Last Punch In Att Calculation" />
                                    </td>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chk_DeductBreakHoursfromWorkDuration" runat="server" Text="Deduct BreakHours From WorkDurattion" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_CalculateHalfDayifWorkDurationislessthan" onclick="chk_CalculateHalfDayifWorkDurationislessthan_onclick()"
                                            runat="server" Text="Calculate HalfDay If Work Duration Is Less Than" />
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_halfDayMins" runat="server"></asp:TextBox>&nbsp;&nbsp; Mins
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_CalculateAbsentDayifWorkDurationislessthan" runat="server"
                                            onclick="chk_CalculateAbsentDayifWorkDurationislessthan_onclick();" Text="Calculate Absent If Work Duration Is Less Than" />
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_AbsentDayMins" runat="server"></asp:TextBox>&nbsp;&nbsp; Mins
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_CalculatePartialDayHalfDayifWorkDurationislessthan" onclick="chk_OnPartialDayCalculateHalfDayifWorkDurationislessthan_onclick()"
                                            runat="server" Text="On Partial Day Calculate HalfDay If Work Duration Is Less Than" />
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_CalculatePartialDayHalfDayifWorkDurationislessthan" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                        Mins
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_CalculatePartialDayAbsentDayifWorkDurationislessthan" runat="server"
                                            onclick="chk_OnPartialDayCalculateAbsentifWorkDurationislessthan_onclick();"
                                            Text="On Partial Day Calculate Absent If Work Duration Is Less Than" />
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_CalculatePartialDayAbsentDayifWorkDurationislessthan" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                        Mins
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="4" align="left">
                                        <asp:CheckBox ID="chk_MarkWOandHAsAbsent" runat="server" Text="Mark Weekly Off and Holiday as Absent for Prefix Day is Absent" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="4" align="left">
                                        <asp:CheckBox ID="chk_MarkWOandHAsAbsentSuffix" runat="server" Text="Mark Weekly Off and Holiday as Absent for Suffix Day is Absent" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="4" align="left">
                                        <asp:CheckBox ID="chk_MarkWOandHAsAbsentForSuffixAndPrefix" runat="server" Text="Mark Weekly Off and Holiday as Absent if both Suffix Day and Prefix Day is Absent" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="4" align="left">
                                        <asp:CheckBox ID="chk_MarkAbsentForContinuos" onclick="chk_MarkAbsentWhenLate_onclick();"
                                            runat="server" Text="" />&nbsp;Mark&nbsp;<asp:DropDownList ID="drp_ContionuosAbsent"
                                                runat="server">
                                                <asp:ListItem>Half Day</asp:ListItem>
                                                <asp:ListItem>Full Day</asp:ListItem>
                                            </asp:DropDownList>
                                        &nbsp;Absent When Late For&nbsp;
                                        <asp:DropDownList ID="Drp_Days" runat="server">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp; Days&nbsp;
                                    </td>
                                </tr>
                                <%--edited by sagarika--%>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="Chk_MarkHalfDayLate" onclick="Chk_MarkHalfDayLate_onclick()" runat="server"
                                            Text="Mark Half Day If late by" />
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_MarkHalfDayLateMins" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                        Mins
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2" align="left">
                                        <asp:CheckBox ID="chk_MarkEarlyGoing" onclick="chk_MarkEarlyGoing_onclick()" runat="server"
                                            Text="Mark Half Day If Early Going by" />
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_MarkEarlyGoingMins" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                        Mins
                                    </td>
                                </tr>
                                <%-- end --%>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                        <input id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;
                        <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        <asp:HiddenField ID="Hdn_CategoryId" runat="server" />
                         <asp:HiddenField ID="Hdn_CategoryName" runat="server" />
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
        </obout:Flyout>
    </div>
    </form>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddEmpCategories") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditEmpCategories") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
    </script>
    <script type="text/javascript">
    
           function WeeklyOff1_OnClick()
            {
                var Sender=document.getElementById("<%=chk_WeeklyOff1.ClientID%>");
                if(Sender.checked)
                
                    document.getElementById("<%=drp_WeeklyOff1.ClientID%>").disabled=false;
                else
                    document.getElementById("<%=drp_WeeklyOff1.ClientID%>").disabled=true;
                
            }
            
            
            
            
            function WeeklyOff2_OnClick()
            {
                
                var Sender=document.getElementById("<%=chk_WeeklyOff2.ClientID%>");
                if(Sender.checked)
                    {
                        document.getElementById("<%=drp_WeeklyOff2.ClientID%>").disabled=false;
                        document.getElementById("<%=chk_Is1WeeklyOff2.ClientID%>").disabled=false;
                        document.getElementById("<%=chk_Is2WeeklyOff2.ClientID%>").disabled=false;
                        document.getElementById("<%=chk_Is3WeeklyOff2.ClientID%>").disabled=false;
                        document.getElementById("<%=chk_Is4WeeklyOff2.ClientID%>").disabled=false;
                        document.getElementById("<%=chk_Is5WeeklyOff2.ClientID%>").disabled=false;
                        
                    }
                else
                    {
                        document.getElementById("<%=drp_WeeklyOff2.ClientID%>").disabled=true;
                        document.getElementById("<%=chk_Is1WeeklyOff2.ClientID%>").disabled=true;
                        document.getElementById("<%=chk_Is2WeeklyOff2.ClientID%>").disabled=true;
                        document.getElementById("<%=chk_Is3WeeklyOff2.ClientID%>").disabled=true;
                        document.getElementById("<%=chk_Is4WeeklyOff2.ClientID%>").disabled=true;
                        document.getElementById("<%=chk_Is5WeeklyOff2.ClientID%>").disabled=true;
                        
                    }
            }
    
		    
		   function attachFlyoutToLink(oLink,Action)
		     {	
		        <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout1.getClientID()%>.Open();
		        clearFlyout();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
             }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout1.getClientID()%>.Close();
		    }
		    	    
		
		    	  
	
		function populateEditControls(iRecordIndex) 
		    {	
               document.getElementById("<%=Hdn_CategoryId.ClientID %>").value = Dg_Category.Rows[iRecordIndex].Cells[0].Value;
	           document.getElementById("<%=txt_CategoryFName.ClientID%>").value = Dg_Category.Rows[iRecordIndex].Cells[1].Value;
               document.getElementById("<%=txt_CategorySName.ClientID%>").value = Dg_Category.Rows[iRecordIndex].Cells[2].Value;
               document.getElementById("<%=txt_graceTimeEarlyGoing.ClientID%>").value = Dg_Category.Rows[iRecordIndex].Cells[29].Value;
               
                if(document.getElementById("<%=txt_CategorySName.ClientID%>").value=='Default' || document.getElementById("<%=txt_CategoryFName.ClientID%>").value=='Default')
		        {
		            document.getElementById("<%=txt_CategorySName.ClientID%>").disabled=true;
		            document.getElementById("<%=txt_CategoryFName.ClientID%>").disabled=true;
		        }
		        
		        
               document.getElementById("<%=drp_OTFormula.ClientID %>").value = Dg_Category.Rows[iRecordIndex].Cells[3].Value;
               document.getElementById("<%=txt_MinOT.ClientID%>").value = Dg_Category.Rows[iRecordIndex].Cells[4].Value;
               
               
               document.getElementById("<%=txt_MaxOT.ClientID%>").value = Dg_Category.Rows[iRecordIndex].Cells[28].Value;
               
               var MaxDoneOT=Dg_Category.Rows[iRecordIndex].Cells[28].Value;
               document.getElementById("<%=chk_MaxOT.ClientID%>").checked = false;
               if(MaxDoneOT>0)
               {
               document.getElementById("<%=chk_MaxOT.ClientID%>").checked = true;
               }
               
               
               if(Dg_Category.Rows[iRecordIndex].Cells[5].Value=='0')
                    document.getElementById("<%=chk_NeglectLastInPunch.ClientID%>").checked = false;
               else
                    document.getElementById("<%=chk_NeglectLastInPunch.ClientID%>").checked = true;
                    document.getElementById("<%=txt_graceTime.ClientID%>").value = Dg_Category.Rows[iRecordIndex].Cells[6].Value;
               
              
    
               
               
               if(Dg_Category.Rows[iRecordIndex].Cells[12].Value=='0')
                document.getElementById("<%=chk_DonotconsiderEarlycomingpunch.ClientID%>").checked =false; 
               else
                document.getElementById("<%=chk_DonotconsiderEarlycomingpunch.ClientID%>").checked =true
                
                if(Dg_Category.Rows[iRecordIndex].Cells[24].Value=='0')
                document.getElementById("<%=chk_MarkWOandHAsAbsentSuffix.ClientID%>").checked =false; 
               else
                document.getElementById("<%=chk_MarkWOandHAsAbsentSuffix.ClientID%>").checked =true
                
                 if(Dg_Category.Rows[iRecordIndex].Cells[27].Value=='0')
                document.getElementById("<%=chk_MarkWOandHAsAbsentForSuffixAndPrefix.ClientID%>").checked =false; 
               else
                document.getElementById("<%=chk_MarkWOandHAsAbsentForSuffixAndPrefix.ClientID%>").checked =true
                
                
                
               
               if(Dg_Category.Rows[iRecordIndex].Cells[13].Value=='0')
                document.getElementById("<%=chk_DonotconsiderLateGoingpunch.ClientID%>").checked =false; 
               else
                document.getElementById("<%=chk_DonotconsiderLateGoingpunch.ClientID%>").checked =true; 
                
               if(Dg_Category.Rows[iRecordIndex].Cells[14].Value=='0')
                    document.getElementById("<%=chk_ConsiderOnlyFirstandLastPunchinAttCalculatuions.ClientID%>").checked =false; 
               else
                    document.getElementById("<%=chk_ConsiderOnlyFirstandLastPunchinAttCalculatuions.ClientID%>").checked =true; 
              
                if(Dg_Category.Rows[iRecordIndex].Cells[15].Value=='0')
                    document.getElementById("<%=chk_DeductBreakHoursfromWorkDuration.ClientID%>").checked =false; 
                else
                    document.getElementById("<%=chk_DeductBreakHoursfromWorkDuration.ClientID%>").checked =true; 
                    
                if(Dg_Category.Rows[iRecordIndex].Cells[16].Value=='0')    
                    document.getElementById("<%=chk_CalculateHalfDayifWorkDurationislessthan.ClientID%>").checked =false; 
                 else
                    document.getElementById("<%=chk_CalculateHalfDayifWorkDurationislessthan.ClientID%>").checked =true; 
                    
//                    edited by sagarika
                 if(Dg_Category.Rows[iRecordIndex].Cells[30].Value=='0')    
                    document.getElementById("<%=Chk_MarkHalfDayLate.ClientID%>").checked =false; 
                 else
                    document.getElementById("<%=Chk_MarkHalfDayLate.ClientID%>").checked =true;
                    document.getElementById("<%=txt_MarkHalfDayLateMins.ClientID%>").value = Dg_Category.Rows[iRecordIndex].Cells[32].Value;
                    
                    
                  if(Dg_Category.Rows[iRecordIndex].Cells[31].Value=='0')    
                    document.getElementById("<%=chk_MarkEarlyGoing.ClientID%>").checked =false; 
                 else
                    document.getElementById("<%=chk_MarkEarlyGoing.ClientID%>").checked =true;
                    document.getElementById("<%=txt_MarkEarlyGoingMins.ClientID%>").value = Dg_Category.Rows[iRecordIndex].Cells[33].Value;
                    
                    // end
                    
                 if(Dg_Category.Rows[iRecordIndex].Cells[17].Value=='0')
                    document.getElementById("<%=chk_CalculateAbsentDayifWorkDurationislessthan.ClientID%>").checked=false;
                 else
                    document.getElementById("<%=chk_CalculateAbsentDayifWorkDurationislessthan.ClientID%>").checked=true;
                    
                 document.getElementById("<%=txt_AbsentDayMins.ClientID%>").value =Dg_Category.Rows[iRecordIndex].Cells[18].Value; 
                 document.getElementById("<%=txt_halfDayMins.ClientID%>").value =Dg_Category.Rows[iRecordIndex].Cells[19].Value; 
                 
                 if(Dg_Category.Rows[iRecordIndex].Cells[20].Value=='0')
                    document.getElementById("<%=chk_MarkWOandHAsAbsent.ClientID%>").checked =false; 
                 else
                    document.getElementById("<%=chk_MarkWOandHAsAbsent.ClientID%>").checked =true; 
                    
                    
                     //Set Values in WeeklyOf
                var WeeklyOff1=Dg_Category.Rows[iRecordIndex].Cells[8].Value;
                var WeeklyOff1Day=Dg_Category.Rows[iRecordIndex].Cells[7].Value;
                if(WeeklyOff1=='-1')
                {
                    document.getElementById("<%=chk_weeklyOff1.ClientID%>").checked=true;
                    document.getElementById("<%=drp_weeklyOff1.ClientID%>").value=WeeklyOff1Day;
                }    
                else
                    document.getElementById("<%=chk_weeklyOff1.ClientID%>").checked=false;
    		        
    		        
    		    var WeeklyOff2=Dg_Category.Rows[iRecordIndex].Cells[10].Value;
                var WeeklyOff2Day=Dg_Category.Rows[iRecordIndex].Cells[9].Value;
                var SaturdayWeeklyOff=Dg_Category.Rows[iRecordIndex].Cells[11].Value;
                var MarkAsAbsentForLate=Dg_Category.Rows[iRecordIndex].Cells[21].Value;
                
                
                var PAbsentDayMins=Dg_Category.Rows[iRecordIndex].Cells[26].Value;
                var PHalfDayMins=Dg_Category.Rows[iRecordIndex].Cells[25].Value;
                 
                if(PAbsentDayMins=='0')
                {
                    document.getElementById("<%=chk_CalculatePartialDayAbsentDayifWorkDurationislessthan.ClientID%>").checked=false;
                    document.getElementById("<%=txt_CalculatePartialDayAbsentDayifWorkDurationislessthan.ClientID%>").value='0';
                }
                else
                {
                    document.getElementById("<%=chk_CalculatePartialDayAbsentDayifWorkDurationislessthan.ClientID%>").checked=true;
                    document.getElementById("<%=txt_CalculatePartialDayAbsentDayifWorkDurationislessthan.ClientID%>").value=PAbsentDayMins;
                }
                    
                if(PHalfDayMins=='0')
                {
                    document.getElementById("<%=chk_CalculatePartialDayHalfDayifWorkDurationislessthan.ClientID%>").checked=false;
                    document.getElementById("<%=txt_CalculatePartialDayHalfDayifWorkDurationislessthan.ClientID%>").value='0';
                }
                else
                {
                    document.getElementById("<%=chk_CalculatePartialDayHalfDayifWorkDurationislessthan.ClientID%>").checked=true;
                    document.getElementById("<%=txt_CalculatePartialDayHalfDayifWorkDurationislessthan.ClientID%>").value=PHalfDayMins;
                }
                 
                
                if(MarkAsAbsentForLate=='-1')
                {
                    document.getElementById("<%=chk_MarkAbsentForContinuos.ClientID%>").checked=true;
                    document.getElementById("<%=drp_ContionuosAbsent.ClientID%>").value=Dg_Category.Rows[iRecordIndex].Cells[23].Value;
                    document.getElementById("<%=Drp_Days.ClientID%>").value=Dg_Category.Rows[iRecordIndex].Cells[22].Value;
                }
                else
                {
                    document.getElementById("<%=chk_MarkAbsentForContinuos.ClientID%>").checked=false;
                }
                
                
                if(WeeklyOff2=='-1')
                    {
                    document.getElementById("<%=chk_weeklyOff2.ClientID%>").checked=true;
                    document.getElementById("<%=drp_weeklyOff2.ClientID%>").value=WeeklyOff2Day;
                     var SaturdayWeeklyOffArray=new Array();
                    SaturdayWeeklyOffArray = SaturdayWeeklyOff.split(',');
                   for(var j=0;j<SaturdayWeeklyOffArray.length;j++)
		                    {
		                        switch(SaturdayWeeklyOffArray[j])
		                        {
		                        case "1":
		                             document.getElementById("<%=chk_Is1WeeklyOff2.ClientID%>").checked=true;
		                             break;
		                        case "2":
                                    document.getElementById("<%=chk_Is2WeeklyOff2.ClientID%>").checked=true;
		                            break;
		                        case "3":
                                    document.getElementById("<%=chk_Is3WeeklyOff2.ClientID%>").checked=true;
		                            break;
		                        case "4":
                                    document.getElementById("<%=chk_Is4WeeklyOff2.ClientID%>").checked=true;
		                            break;
		                        case "5":
                                    document.getElementById("<%=chk_Is5WeeklyOff2.ClientID%>").checked=true;
		                            break;
		                        }
		                    }
                    
                   }
                else
                    document.getElementById("<%=chk_weeklyOff2.ClientID%>").checked=false;
                    
                    WeeklyOff1_OnClick();
                    WeeklyOff2_OnClick();
                    chk_CalculateHalfDayifWorkDurationislessthan_onclick();
                    Chk_MarkHalfDayLate_onclick();
                    chk_MarkEarlyGoing_onclick();
                    chk_CalculateAbsentDayifWorkDurationislessthan_onclick();
                    chk_MarkAbsentWhenLate_onclick();
                   
		   }

	   function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.CategoryId =document.getElementById("<%=Hdn_CategoryId.ClientID %>").value ;
		        oRecord.Error='';
		        Dg_Category.executeInsert(oRecord);
		    }
		    
	      function clearFlyout()
	    {
            document.getElementById("<%=Hdn_CategoryId.ClientID %>").value = '0';
            document.getElementById("<%=txt_CategoryFName.ClientID%>").value = '';
            document.getElementById("<%=txt_CategorySName.ClientID%>").value = '';
            document.getElementById("<%=txt_CategorySName.ClientID%>").disabled=false;
		    document.getElementById("<%=txt_CategoryFName.ClientID%>").disabled=false;
            document.getElementById("<%=drp_OTFormula.ClientID %>").selectedindex=0;
            document.getElementById("<%=txt_MinOT.ClientID%>").value = '30';
            document.getElementById("<%=txt_MaxOT.ClientID%>").value = '30';
            document.getElementById("<%=chk_NeglectLastInPunch.ClientID%>").checked = false;
            document.getElementById("<%=txt_graceTime.ClientID%>").value = '15';
            document.getElementById("<%=txt_graceTimeEarlyGoing.ClientID%>").value = '15';
            document.getElementById("<%=chk_weeklyOff1.ClientID%>").checked=true;
            document.getElementById("<%=drp_weeklyOff1.ClientID%>").selectedindex=0;
            document.getElementById("<%=chk_weeklyOff2.ClientID%>").checked=true;
            document.getElementById("<%=drp_weeklyOff2.ClientID%>").selectedindex=6;
		    document.getElementById("<%=chk_Is1WeeklyOff2.ClientID%>").checked=false;
		    document.getElementById("<%=chk_Is2WeeklyOff2.ClientID%>").checked=false;
		    document.getElementById("<%=chk_Is3WeeklyOff2.ClientID%>").checked=false;
		    document.getElementById("<%=chk_Is4WeeklyOff2.ClientID%>").checked=false;
		    document.getElementById("<%=chk_Is5WeeklyOff2.ClientID%>").checked=false;
            
            document.getElementById("<%=chk_DonotconsiderEarlycomingpunch.ClientID%>").checked =false; 
            document.getElementById("<%=chk_DonotconsiderLateGoingpunch.ClientID%>").checked =true; 
            document.getElementById("<%=chk_ConsiderOnlyFirstandLastPunchinAttCalculatuions.ClientID%>").checked =true; 
            document.getElementById("<%=chk_DeductBreakHoursfromWorkDuration.ClientID%>").checked =false; 
            document.getElementById("<%=chk_CalculateHalfDayifWorkDurationislessthan.ClientID%>").checked =true; 
            document.getElementById("<%=chk_CalculateAbsentDayifWorkDurationislessthan.ClientID%>").checked=true;
            document.getElementById("<%=txt_AbsentDayMins.ClientID%>").value ='120'; 
            document.getElementById("<%=txt_halfDayMins.ClientID%>").value ='240'; 
            document.getElementById("<%=txt_CalculatePartialDayAbsentDayifWorkDurationislessthan.ClientID%>").value ='60'; 
            document.getElementById("<%=txt_CalculatePartialDayHalfDayifWorkDurationislessthan.ClientID%>").value ='120'; 
            document.getElementById("<%=chk_MarkWOandHAsAbsent.ClientID%>").checked =false; 
            document.getElementById("<%=chk_MarkWOandHAsAbsentSuffix.ClientID%>").checked =false ;
            document.getElementById("<%=chk_MarkWOandHAsAbsentForSuffixAndPrefix.ClientID%>").checked =false ;
	        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
	        WeeklyOff1_OnClick();
            WeeklyOff2_OnClick();
            chk_CalculateHalfDayifWorkDurationislessthan_onclick();
            Chk_MarkHalfDayLate_onclick();
            chk_MarkEarlyGoing_onclick();
            chk_CalculateAbsentDayifWorkDurationislessthan_onclick();
            document.getElementById("<%=chk_MarkAbsentForContinuos.ClientID%>").checked=false;
            chk_MarkAbsentWhenLate_onclick();
	    }
	    
	    
	    function chk_CalculateHalfDayifWorkDurationislessthan_onclick()
            {
                var Sender=document.getElementById("<%=chk_CalculateHalfDayifWorkDurationislessthan.ClientID%>");
                if(Sender.checked)
                
                    document.getElementById("<%=txt_halfDayMins.ClientID%>").disabled=false;
                else
                    document.getElementById("<%=txt_halfDayMins.ClientID%>").disabled=true;
            }
//            edited by sagarika
           
              function Chk_MarkHalfDayLate_onclick()
            {
                var Sender=document.getElementById("<%=Chk_MarkHalfDayLate.ClientID%>");
                if(Sender.checked)
                
                    document.getElementById("<%=txt_MarkHalfDayLateMins.ClientID%>").disabled=false;
                else
                    document.getElementById("<%=txt_MarkHalfDayLateMins.ClientID%>").disabled=true;
            }
             function chk_MarkEarlyGoing_onclick()
            {
                var Sender=document.getElementById("<%=chk_MarkEarlyGoing.ClientID%>");
                if(Sender.checked)
                
                    document.getElementById("<%=txt_MarkEarlyGoingMins.ClientID%>").disabled=false;
                else
                    document.getElementById("<%=txt_MarkEarlyGoingMins.ClientID%>").disabled=true;
            }
            
//            end
             function chk_OnPartialDayCalculateHalfDayifWorkDurationislessthan_onclick()
            {
                var Sender=document.getElementById("<%=chk_CalculatePartialDayHalfDayifWorkDurationislessthan.ClientID%>");
                if(Sender.checked)
                
                    document.getElementById("<%=txt_CalculatePartialDayHalfDayifWorkDurationislessthan.ClientID%>").disabled=false;
                else
                    document.getElementById("<%=txt_CalculatePartialDayHalfDayifWorkDurationislessthan.ClientID%>").disabled=true;
            }
            
            
             function chk_OnPartialDayCalculateAbsentifWorkDurationislessthan_onclick()
            {
                var Sender=document.getElementById("<%=chk_CalculatePartialDayAbsentDayifWorkDurationislessthan.ClientID%>");
                if(Sender.checked)
                
                    document.getElementById("<%=txt_CalculatePartialDayAbsentDayifWorkDurationislessthan.ClientID%>").disabled=false;
                else
                    document.getElementById("<%=txt_CalculatePartialDayAbsentDayifWorkDurationislessthan.ClientID%>").disabled=true;
            }
            
            
              function chk_CalculateAbsentDayifWorkDurationislessthan_onclick()
                {
                    var Sender=document.getElementById("<%=chk_CalculateAbsentDayifWorkDurationislessthan.ClientID%>");
                    if(Sender.checked)
                    
                        document.getElementById("<%=txt_AbsentDayMins.ClientID%>").disabled=false;
                    else
                        document.getElementById("<%=txt_AbsentDayMins.ClientID%>").disabled=true;
                }
                
                function chk_MarkAbsentWhenLate_onclick()
                {
                    var Sender=document.getElementById("<%=chk_MarkAbsentForContinuos.ClientID%>");
                    if(Sender.checked)
                        {
                            document.getElementById("<%=drp_ContionuosAbsent.ClientID%>").disabled=false;
                            document.getElementById("<%=Drp_Days.ClientID%>").disabled=false;
                        }
                    else
                        {
                            document.getElementById("<%=drp_ContionuosAbsent.ClientID%>").disabled=true;
                            document.getElementById("<%=Drp_Days.ClientID%>").disabled=true;
                        }
                }
            
            
            
            
    </script>
</body>
</html>
