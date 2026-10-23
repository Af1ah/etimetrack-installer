<%@ page language="VB" autoeventwireup="false" inherits="Admin_ShiftCalenders, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
		    document.getElementById("<%=Hdn_ShiftCalenderId.ClientID %>").value = record.ShiftId;
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
                        Shift Calendar List
                    </td>
                </tr>
                
                 <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                
                <tr>
                    <td colspan="2" >
    <obout:Grid id="Dg_ShiftCalendar" runat="server" CallbackMode="true" EnableRecordHover="true" KeepSelectedRecords="true"  Serialize="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                 OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord"  AllowFiltering="true" >
                 <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
			<TemplateSettings NewRecord_TemplateId="tplAddBtn" />
			
			<Columns>
				<obout:Column ID="Column2" DataField="ShiftId" Visible="false" Width="300" HeaderText="ShiftId" runat="server" />
				<obout:Column ID="Column1" DataField="ShiftFName" Visible="true"  SortOrder="Asc"  Width="340" HeaderText="ShiftFName" runat="server" />
                <obout:Column ID="Column7" DataField="ShiftSName" Visible="true" Width="330" HeaderText="ShiftSName" runat="server" />
                <obout:Column  Width="90" AllowEdit="false"  HeaderText="Schedule"  AllowDelete="false" Visible="true" ><TemplateSettings TemplateId="tplScheduleBtn" /></obout:Column>
				<obout:Column  Width="65" AllowEdit="true" HeaderText="Edit" AllowDelete="true"><TemplateSettings TemplateId="tplEditBtn" /></obout:Column>
                <obout:Column  Width="70" AllowEdit="false" HeaderText="Delete"  AllowDelete="true" Visible="true" />
				
			</Columns>					
			<Templates>
			<obout:GridTemplate runat="server" ID="tplEditBtn">
			        <Template>
			            <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')" class="ob_gAL"><%#CheckPermissionsEdit("Edit")%></a>
			        </Template>
			 </obout:GridTemplate>
			    
			  <obout:GridTemplate runat="server" ID="tplAddBtn">
			        <Template>
			            <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add')" class="ob_gAL"><%#CheckPermissions("Add")%></a>
			        </Template>
			    </obout:GridTemplate>
			    
			     <obout:GridTemplate runat="server" ID="tplScheduleBtn">
			        <Template>
			        <asp:Hyperlink runat="server" CssClass="ob_gAL" Text=<%#CheckPermissionsEdit("Schedule")%> NavigateUrl='<%# "~/manage/ShiftCalendarShedular.aspx?Id=" + GetDataItemValue("ShiftId", Container)+"&ShiftCalenderSName="+GetDataItemValue("ShiftSName", Container)+"&ShiftCalenderFName="+GetDataItemValue("ShiftFName", Container)%>' ID="AA1" />
			        
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
                                <legend>Shift Calendar Details</legend>
                                <table>
                                    <tr>
                                        <td  style="font-weight: bold;">
                                            Shift Calendar Name</td>
                                        <td >
                                            <asp:TextBox ID="txt_ShiftCalendarFullName" runat="server" Width="256px"   ></asp:TextBox>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                    <td style="font-weight: bold;">
                                    Short Name
                                    </td>
                                    <td>
                                            <asp:TextBox ID="txt_ShiftCalendarShortName" runat="server" Width="220px"  ></asp:TextBox>
                                    
                                    </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                                id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; &nbsp; &nbsp;
                           <asp:Label runat="server" foreColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><asp:HiddenField ID="Hdn_ShiftCalenderId" runat="server" />
                                
                        </td>
                    </tr>
                </table>
			</obout:Flyout>
			
    </div>
    </form>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddShiftCalendars") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        
        Function GetDataItemValue(ByVal fieldname As String, ByVal Container As Obout.Grid.TemplateContainer) As String
            
            
            If Container.DataItem(fieldname) Is Nothing Then
                Return Container.DataItem(fieldname.ToUpper)
              
                
            End If
            
            
            Return Container.DataItem(fieldname)
            
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditShiftCalendars") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
		            
		    
        
        
    </script>
    <script type="text/javascript">
            function lnk_Schedule_onclick(oLink)
            {
                  var iRecordIndex=oLink.id.toString().replace("grid_link_", "");
	              document.getElementById("<%=Hdn_ShiftCalenderId.ClientID %>").value = Dg_ShiftCalendar.Rows[iRecordIndex].Cells[0].Value;
	              return true;
            }
            
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
		        document.getElementById("<%=txt_ShiftCalendarFullName.ClientID %>").value = Dg_ShiftCalendar.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById( "<%=txt_ShiftCalendarShortName.ClientID %>").value = Dg_ShiftCalendar.Rows[iRecordIndex].Cells[2].Value;
		        document.getElementById("<%=Hdn_ShiftCalenderId.ClientID %>").value = Dg_ShiftCalendar.Rows[iRecordIndex].Cells[0].Value;
		    }
		   
		      
		     function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.Login =document.getElementById("<%=txt_ShiftCalendarFullName.ClientID %>").value ;
		        oRecord.Error='';
		        Dg_ShiftCalendar.executeInsert(oRecord);
		     }
		    
            function clearFlyout() 
            {
                document.getElementById("<%=txt_ShiftCalendarFullName.ClientID %>").value = '';
		        document.getElementById("<%=txt_ShiftCalendarShortName.ClientID %>").value = '';
		        document.getElementById("<%=Hdn_ShiftCalenderId.ClientID %>").value = '0';
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		    }
		    
		    
		
    </script>
</body>

</html>
