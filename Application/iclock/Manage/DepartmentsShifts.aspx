<%@ page language="VB" autoeventwireup="false" inherits="Manage_DepartmentsShifts, App_Web_kgq5n2bg" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
		    document.getElementById("<%=Hdn_CompanyDepartmentShiftId.ClientID %>").value = record.CompanyDepartmentShiftId;
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
<body onload="LoadShiftOrShiftCalndar();">
    <form id="form1" runat="server">
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;padding:5px; color: white;">
                        Department Shift List
                    </td>
                </tr>
                
                 <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <obout:Grid ID="Dg_DepartmentShift" AllowFiltering="true" runat="server" Width="500"
                            CallbackMode="true" EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true"
                            AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                            AllowAddingRecords="true" ShowLoadingMessage="false" OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column  ID="Column0"  DataField="CompanyDepartmentShiftId" Visible="false" Width="300" HeaderText="DepartmentShiftId" runat="server" />
                                <obout:Column ID="Column1" DataField="CompanyId" Visible="false" Width="120" HeaderText="Company" runat="server" />
                                <obout:Column ID="Column2" DataField="DepartmentId" Visible="false" Width="120" HeaderText="Department"  runat="server" />
                                <obout:Column ID="Column3" DataField="CompanySName" Visible="true" Width="140" HeaderText="Company"  runat="server" />
                                <obout:Column ID="Column4" DataField="DepartmentSName" Visible="true" Width="140" HeaderText="Department" runat="server" />
                                <obout:Column ID="Column5" DataField="ShiftType" Visible="true" Width="100" HeaderText="Shift Type" runat="server" />
                                <obout:Column ID="Column6" DataField="ShiftSName" Visible="true" Width="140" HeaderText="Shift" runat="server" />
                                <obout:Column ID="Column7" DataField="ShiftId" Visible="false" Width="120" HeaderText="Department"   runat="server" />
                                <obout:Column ID="Column8" Visible="false"  Width="90" HeaderText="From Date" runat="server"> <TemplateSettings TemplateId="TP_FromDateFormat" /></obout:Column>
                                <obout:Column ID="Column9" Visible="false" Width="90" HeaderText="To Date" runat="server"> <TemplateSettings TemplateId="TP_ToDateFormat" /></obout:Column>
                                <obout:Column ID="Column10" Visible="true" DataField="FromDate" DataFormatString="{0:dd-MMM-yyyy}"  Width="90" HeaderText="From Date" runat="server"/>
                                <obout:Column ID="Column11" Visible="true" DataField="ToDate" DataFormatString="{0:dd-MMM-yyyy}"    Width="90" HeaderText="To Date" runat="server"/> 
                                <obout:Column ID="Column12" DataField="LastModifiedDate" Visible="true" DataFormatString="{0:dd MMM yyyy HH:mm}"  Width="160" HeaderText="Last Modified Date" runat="server" />
                                <obout:Column HeaderText="Edit" Width="65" AllowEdit="true" AllowDelete="true"> <TemplateSettings TemplateId="tplEditBtn" /> </obout:Column>
                                <obout:Column HeaderText="Delete" Width="70" AllowEdit="false" AllowDelete="true"  Visible="true" />
                            </Columns>
                            <Templates>
                            <obout:GridTemplate runat="server" ID="TP_FromDateFormat">
			                    <Template>
			                        <%#ParseDateTime(Container.DataItem.Item("FromDate"))%>
			                    </Template>
			                </obout:GridTemplate>
			                
			                 <obout:GridTemplate runat="server" ID="TP_ToDateFormat">
			                    <Template>
			                        <%#ParseDateTime(Container.DataItem.Item("ToDate"))%>
			                    </Template>
			                </obout:GridTemplate>
			                
                                <obout:GridTemplate runat="server" ID="tplEditBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                            class="ob_gAL"><%#CheckPermissionsEdit("Edit")%></a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplAddBtn">
                                    <Template>
                                        <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add')" class="ob_gAL">
                                            <%#CheckPermissions("Assign Department Shift")%></a>
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
            <obout:Flyout runat="server" ID="Flyout1"  Position="BOTTOM_CENTER" CloseEvent="NONE"
                OpenEvent="NONE" DelayTime="500">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Department Shift Details</legend>
                                <table>
                                    <tr>
                                        <td>
                                            Company
                                        </td>
                                        <td>
                                            <select runat="server" id="drp_company" style="width: 300px">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Department
                                        </td>
                                        <td>
                                            <select runat="server" id="drp_Department" style="width: 300px">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:RadioButtonList  ID="rbtnlst_ShiftType" EnableViewState="true" RepeatDirection="Horizontal"
                                                runat="server">
                                                <asp:ListItem Selected="True" onclick="LoadShiftOrShiftCalndar();">Shift</asp:ListItem>
                                                <asp:ListItem onclick="LoadShiftOrShiftCalndar();">Shift Calendar</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Shift
                                        </td>
                                        <td>
                                            <select runat="server" id="drp_Shift" style="width: 300px">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            From Date
                                        </td>
                                        <td>
                                            <select runat="server" id="drp_FromddDate">
                                            </select>
                                            &nbsp;
                                            <select runat="server" id="drp_FromMMDate">
                                            </select>
                                            &nbsp;
                                            <select runat="server" id="drp_FromYYYYDate">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            To Date
                                        </td>
                                        <td>
                                            <select runat="server" id="drp_ToddDate">
                                            </select>
                                            &nbsp;
                                            <select runat="server" id="drp_ToMMDate">
                                            </select>
                                            &nbsp;
                                            <select runat="server" id="drp_ToYYYYDate">
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input
                                id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                            <asp:HiddenField ID="Hdn_CompanyDepartmentShiftId" runat="server" />
                            <asp:HiddenField ID="hdn_ShifttsIds" runat="server" />
                            <asp:HiddenField ID="hdn_Shiftts" runat="server" />
                            <asp:HiddenField ID="hdn_ShifttCalendarIds" runat="server" />
                            <asp:HiddenField ID="hdn_ShifttCalendar" runat="server" />
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
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddDepartmentShifts") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditDepartmentShifts") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function ParseDateTime(ByVal DateValue As Date) As String
            Return DateValue.ToString("yyyy-MM-dd")
        End Function
    </script>

    <script type="text/javascript">
		    
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
		    
		      function SetValueInDropDown(ddobject,mmobject,yyobject,value)
		    {
		        var Day=value.split('-')[2].replace(/^\s+|\s+$/g,"");
	            var Month=value.split('-')[1].replace(/^\s+|\s+$/g,"");
	            var Year=value.split('-')[0].replace(/^\s+|\s+$/g,"");
		        
		            
	            if(Month.length <2)
	            {
	              Month="0" + Month;
	            }
	            
                ddobject.value=Day;
                mmobject.value=Month;
                yyobject.value=Year;
		    }
		    	    
		
		    	  
	
		 function populateEditControls(iRecordIndex) 
		    {	
	          document.getElementById("<%=drp_company.ClientID%>").value = Dg_DepartmentShift.Rows[iRecordIndex].Cells[1].Value;
		      document.getElementById("<%=drp_Department.ClientID%>").value = Dg_DepartmentShift.Rows[iRecordIndex].Cells[2].Value;
		      var ShiftType=Dg_DepartmentShift.Rows[iRecordIndex].Cells[5].Value;
              if(ShiftType=='Shift')
                       document.getElementById("Flyout1_rbtnlst_ShiftType_0").checked=true;
              else if(ShiftType=='ShiftCalendar')
                       document.getElementById("Flyout1_rbtnlst_ShiftType_1").checked=true;
               LoadShiftOrShiftCalndar();
               document.getElementById( "<%=drp_Shift.ClientID %>").value = Dg_DepartmentShift.Rows[iRecordIndex].Cells[7].Value;
               SetValueInDropDown(document.getElementById("<%=drp_FromddDate.ClientID%>"),document.getElementById("<%=drp_FromMMDate.ClientID%>"),document.getElementById("<%=drp_FromYYYYDate.ClientID%>"),Dg_DepartmentShift.Rows[iRecordIndex].Cells[8].Value); 
               SetValueInDropDown(document.getElementById("<%=drp_ToddDate.ClientID%>"),document.getElementById("<%=drp_ToMMDate.ClientID%>"),document.getElementById("<%=drp_ToYYYYDate.ClientID%>"),Dg_DepartmentShift.Rows[iRecordIndex].Cells[9].Value); 
		       document.getElementById("<%=Hdn_CompanyDepartmentShiftId.ClientID %>").value = Dg_DepartmentShift.Rows[iRecordIndex].Cells[0].Value;
		   }

	   function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.ShiftId =document.getElementById("<%=drp_Shift.ClientID %>").value ;
		        oRecord.Error ='';
		        if(document.getElementById("Flyout1_rbtnlst_ShiftType_0").checked ==  true)
		        oRecord.ShiftType='Shift';
		        else if(document.getElementById("Flyout1_rbtnlst_ShiftType_1").checked ==  true)
		        oRecord.ShiftType='Shift Calender';
		        Dg_DepartmentShift.executeInsert(oRecord);
		    }
		    
            function clearFlyout() 
            {
                var CurrentDate=new Date();
                var now=new Date();
                document.getElementById("<%=drp_company.ClientID %>").selectedindex = 0;
		        document.getElementById("<%=drp_Department.ClientID %>").selectedindex = 0;
		        document.getElementById("Flyout1_rbtnlst_ShiftType_0").checked =true  ;
		        document.getElementById("Flyout1_rbtnlst_ShiftType_1").checked =  false;
		        LoadShiftOrShiftCalndar();
		        document.getElementById("<%=drp_Shift.ClientID %>").selectedindex = 0;
		        document.getElementById("<%=drp_FromddDate.ClientID%>").value='';
		        document.getElementById("<%=drp_FromMMDate.ClientID%>").value='';
		        document.getElementById("<%=drp_FromYYYYDate.ClientID%>").value='';
		        document.getElementById("<%=drp_ToddDate.ClientID%>").value='';
		        document.getElementById("<%=drp_ToMMDate.ClientID%>").value='';
		        document.getElementById("<%=drp_ToYYYYDate.ClientID%>").value='';
		        
		        var NowDay=now.getDate();
		        var NowMonth=now.getMonth()+1;
		        var NowYear=now.getFullYear();
		        
		        var value=NowYear+'-'+NowMonth + "-" + NowDay;
		        
		        SetValueInDropDown(document.getElementById("<%=drp_FromddDate.ClientID%>"),document.getElementById("<%=drp_FromMMDate.ClientID%>"),document.getElementById("<%=drp_FromYYYYDate.ClientID%>"),value); 
		        SetValueInDropDown(document.getElementById("<%=drp_ToddDate.ClientID%>"),document.getElementById("<%=drp_ToMMDate.ClientID%>"),document.getElementById("<%=drp_ToYYYYDate.ClientID%>"),value);  
                document.getElementById("<%=Hdn_CompanyDepartmentShiftId.ClientID %>").value = '0';
                document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		    }
		    
		    function LoadShiftOrShiftCalndar()
		    {
		        var ShiftIds=document.getElementById("<%=hdn_ShifttsIds.ClientID %>").value;
		        var Shift=document.getElementById("<%=hdn_Shiftts.ClientID %>").value;
		        var ShiftCalendarIds=document.getElementById("<%=hdn_ShifttCalendarIds.ClientID %>").value;
		        var ShiftCalendars=document.getElementById("<%=hdn_ShifttCalendar.ClientID %>").value;
                if(document.getElementById("Flyout1_rbtnlst_ShiftType_0").checked)
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
		        for(var i=0;i<ShiftId.length-1;i++)
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
		        for(var i=0;i<ShiftCalendarId.length-1;i++)
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
