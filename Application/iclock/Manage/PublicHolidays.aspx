<%@ page language="VB" autoeventwireup="false" inherits="Manage_PublicHolidays, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
		    document.getElementById("<%=Hdn_HolidayId.ClientID %>").value = record.HolidayId;
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
                <tr style=" font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; ">
                    <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                        Holiday List
                    </td>
                    <td style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">
                    Company&nbsp;<asp:DropDownList id="drp_FilterCompany" runat="server"></asp:DropDownList>
                    <asp:Button ID="btnUpdate"  runat="server" Text="Refresh" OnClientClick="SetSource(this.id)"/>
                          <asp:HiddenField ID="hidSourceID" runat="server" />

                         <script type="text/javascript">
                             function SetSource(SourceID) {
                                 var hidSourceID = document.getElementById("<%=hidSourceID.ClientID%>");
                                 hidSourceID.value = SourceID;
                             }
                  </script>
                        
                    </td>
                </tr>
                
                  <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                <tr>
                    <td colspan="2" >
            <obout:Grid id="Dg_Holiday" runat="server" CallbackMode="true" EnableRecordHover="true" AllowFiltering="true" KeepSelectedRecords="true"  Serialize="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                 OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" >
                 <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
			<TemplateSettings NewRecord_TemplateId="tplAddBtn" />
			
			<Columns>
			    <obout:Column DataField="HolidayId" Visible="false" ReadOnly="true" HeaderText="HolidayId " />
			    <obout:Column ID="Column1" DataField="HolidayName" Visible="true"  SortOrder="Asc"  Width="200" HeaderText="Holiday Name" runat="server" />
			    <obout:Column ID="Column2" DataField="CompanySName" Visible="true" Width="200" HeaderText="Company Name" runat="server" />
			    <obout:Column ID="Column3" DataField="HolidayDate" DataFormatString="{0:dd MMM yyyy}"  Visible="true" Width="150" HeaderText="Holiday Date" runat="server" />
                <obout:Column ID="Column4" DataField="Description" Visible="false" Width="200" HeaderText="Description" runat="server" />
                <obout:Column ID="Column5" DataField="CompanyId" Visible="false" Width="200" HeaderText="Description" runat="server" />
                <obout:Column ID="Column6" DataField="HolidayGroups" Visible="false" Width="250" HeaderText="HolidayGroups" runat="server" />
                <obout:Column ID="Column7"  Visible="true" Width="450" HeaderText="HolidayGroups" runat="server" >
                                     <TemplateSettings TemplateId="HolidayGroup_Template" />
                </obout:Column>                
                <obout:Column ID="Column8"  Visible="false" Width="120"  runat="server" > <TemplateSettings TemplateId="TP_HolidayDateFormat" /></obout:Column>

				<obout:Column HeaderText="Edit" Width="65" AllowEdit="true" AllowDelete="true">
				<TemplateSettings TemplateId="tplEditBtn" />
				</obout:Column>
               <obout:Column HeaderText="Delete" Width="70" AllowEdit="false" AllowDelete="true" Visible="true" />
				
			</Columns>					
			
			<Templates>
			<obout:GridTemplate runat="server" ID="tplEditBtn">
			        <Template>
			            <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')" class="ob_gAL" ><%#CheckPermissionsEdit("Edit")%></a>
			        </Template>
			 </obout:GridTemplate>
			 
			 <obout:GridTemplate runat="server" ID="HolidayGroup_Template" ControlID="" ControlPropertyName="">
                                    <Template>
                                        <%#ParseHolidayGroups(Container.DataItem.Item("HolidayGroups"))%>
                                    </Template>
                                </obout:GridTemplate>
			    
			  <obout:GridTemplate runat="server" ID="tplAddBtn">
			        <Template>
			            <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add');" class="ob_gAL"><%#CheckPermissions("Add")%></a>
			        </Template>
			    </obout:GridTemplate>
			    
			     <obout:GridTemplate runat="server" ID="TP_HolidayDateFormat">
			        <Template>
			        <%#ParseDateTime(Container.DataItem.Item("HolidayDate"))%>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		</td>
   </tr>
 </table>	
		
 <obout:Flyout runat="server" ID="Flyout1"  Position=BOTTOM_CENTER CloseEvent="NONE" OpenEvent="NONE" DelayTime="500" >
  <table class="rowEditTable">
      <tr>
         <td>
           <fieldset>
             <legend>Holiday Details</legend>
               <table>
               <tr>
                           <td  style="font-weight: bold;">
                                  Holiday Name
                           </td>
                           <td >
                                  <asp:TextBox ID="txt_HolidayName" runat="server" Width="340px"></asp:TextBox>
                           </td>
                           <td>
                               <asp:CheckBox ID="chk_RestrictedToGroup" runat="server" onclick="chk_RestrictedToGroup_onclick();" Text="Restricted to Group" />
                               
                           </td>
               </tr>    
               <tr>   
                            <td>
                                  Company Name
                            </td>
                            <td>
                                  <select runat="server" id="drp_company" style="width: 157px;">
                                  </select>
                                    Date   
                                    <select runat="server" id="drp_ddHoliday" ></select>&nbsp;<select runat="server" id="drp_MMHoliday"></select>&nbsp;<select runat="server" id="drp_YYYYHoliday" ></select></td>
                                    <td rowspan="2">
                                        <asp:ListBox ID="lst_HolidayGroup" runat="server" Height="110px" SelectionMode="Multiple">
                                        <asp:ListItem Value="0">Holiday Group 1</asp:ListItem>
                                        <asp:ListItem Value="1">Holiday Group 2</asp:ListItem>
                                        <asp:ListItem Value="2">Holiday Group 3</asp:ListItem>
                                        <asp:ListItem Value="3">Holiday Group 4</asp:ListItem>
                                        <asp:ListItem Value="4">Holiday Group 5</asp:ListItem>
                                        <asp:ListItem Value="5">Holiday Group 6</asp:ListItem>
                                        <asp:ListItem Value="6">Holiday Group 7</asp:ListItem>
                                        <asp:ListItem Value="7">Holiday Group 8</asp:ListItem>
                                        <asp:ListItem Value="8">Holiday Group 9</asp:ListItem>
                                        <asp:ListItem Value="9">Holiday Group 10</asp:ListItem>
                                        <asp:ListItem Value="10">Holiday Group 11</asp:ListItem>
                                        <asp:ListItem Value="11">Holiday Group 12</asp:ListItem>
                                        <asp:ListItem Value="12">Holiday Group 13</asp:ListItem>
                                        <asp:ListItem Value="13">Holiday Group 14</asp:ListItem>
                                        <asp:ListItem Value="14">Holiday Group 15</asp:ListItem>
                                        <asp:ListItem Value="15">Holiday Group 16</asp:ListItem>
                                        <asp:ListItem Value="16">Holiday Group 17</asp:ListItem>
                                        <asp:ListItem Value="17">Holiday Group 18</asp:ListItem>
                                        <asp:ListItem Value="18">Holiday Group 19</asp:ListItem>
                                        <asp:ListItem Value="19">Holiday Group 20</asp:ListItem>
                                        <asp:ListItem Value="20">Holiday Group 21</asp:ListItem>
                                        <asp:ListItem Value="21">Holiday Group 22</asp:ListItem>
                                        <asp:ListItem Value="22">Holiday Group 23</asp:ListItem>
                                        <asp:ListItem Value="23">Holiday Group 24</asp:ListItem>
                                        <asp:ListItem Value="24">Holiday Group 25</asp:ListItem>
                                        </asp:ListBox>
                                    </td>
                </tr>         
                <tr>       
                             <td>
                                     Description 
                             </td>
                             <td>
                                     <asp:TextBox runat="server" id="txt_Description" TextMode="MultiLine" Width="340px" Height="60px"></asp:TextBox>
                             </td>
                </tr>
            </table>
           </fieldset>
          </td>
        </tr>
                 <tr>
                              <td colspan="4" align="right">
                                  <asp:Label runat="server" foreColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;
                                  <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                                  <asp:HiddenField ID="Hdn_HolidayId" runat="server" />
                                 
                             </td>
                        
                </tr>
               </table>
</obout:Flyout>
</div>
</form>
<script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddHolidays") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditHolidays") Then
                    Return Action
                End If
                Return ""
            End If
    End Function
    
    Function ParseHolidayGroups(ByVal HolidayGroups As String) As String
        If Not Session.Item("LoginUser") Is Nothing Then
           
            If HolidayGroups <> "" Then
                HolidayGroups = HolidayGroups.TrimEnd(",")
                Dim ParseHoliday As String = ""
                For Each HolidayGroup As String In HolidayGroups.Split(",")
                    ParseHoliday = ParseHoliday + "Holiday Group " + CStr(CInt(HolidayGroup) + 1) + ","
                Next
                Return ParseHoliday.Remove(ParseHoliday.LastIndexOf(","))
            End If
        End If
        Return ""
    End Function
    
    Function ParseDateTime(ByVal DateValue As Date) As String
        Return DateValue.ToString("yyyy-MM-dd")
    End Function
        
    </script>
 
    <script type="text/javascript" >
		    
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
		   document.getElementById("<%=txt_HolidayName.ClientID%>").value = Dg_Holiday.Rows[iRecordIndex].Cells[1].Value;
	       document.getElementById("<%=drp_company.ClientID%>").value = Dg_Holiday.Rows[iRecordIndex].Cells[5].Value;
           SetValueInDropDown(document.getElementById("<%=drp_ddHoliday.ClientID%>"),document.getElementById("<%=drp_MMHoliday.ClientID%>"),document.getElementById("<%=drp_YYYYHoliday.ClientID%>"),Dg_Holiday.Rows[iRecordIndex].Cells[8].Value); 
	       document.getElementById("<%=txt_Description.ClientID%>").value=Dg_Holiday.Rows[iRecordIndex].Cells[4].Value.replace(/<BR>/gi,'\n');
           document.getElementById("<%=Hdn_HolidayId.ClientID %>").value = Dg_Holiday.Rows[iRecordIndex].Cells[0].Value;  
           var HolidayGroup=Dg_Holiday.Rows[iRecordIndex].Cells[6].Value;  
           var HolidayGroupArray=new Array();
            HolidayGroupArray=HolidayGroup.split(',');
            for(var i=0;i<HolidayGroupArray.length;i++)
            {
                document.getElementById('<%=lst_HolidayGroup.ClientID %>').options[HolidayGroupArray[i]].selected=true;
            document.getElementById("<%=chk_RestrictedToGroup.ClientID%>").checked=true;
            }
            chk_RestrictedToGroup_onclick();
		 }
		   
         	   
          function SetValueInDropDown(ddobject,mmobject,yyobject,value)
		    {
                var Day=value.split('-')[2].replace(/^\s+|\s+$/g,"");
	            var Month=value.split('-')[1].replace(/^\s+|\s+$/g,"");
	            
	            if(Month.length <2)
	            {
	              Month="0" + Month;
	            }
	            var Year=value.split('-')[0].replace(/^\s+|\s+$/g,"");
		        
                ddobject.value=Day;
                mmobject.value=Month;
                yyobject.value=Year;
		    }


  
		    
       function chk_RestrictedToGroup_onclick()
         {
           var objCheckBox;
           objCheckBox =document.getElementById("<%=chk_RestrictedToGroup.ClientID %>");
		   if(objCheckBox.checked)
		   {
		      document.getElementById('<%=lst_HolidayGroup.ClientID %>').disabled=false; 
		   }
		   else
		   {
		      document.getElementById('<%=lst_HolidayGroup.ClientID %>').disabled=true; 
		   }
         }
         
         function btn_Save_onclick()
         {
           var oRecord = new Object();
           oRecord.HolidayId =document.getElementById("<%=Hdn_HolidayId.ClientID %>").value;
		   oRecord.Error='';
		   oRecord.HolidayGroups='';
		   var HolidayGroup=document.getElementById("<%=lst_HolidayGroup.ClientID %>");
		   if(document.getElementById("<%=chk_RestrictedToGroup.ClientID%>").checked)
		      {
		         for(var j=0;j<HolidayGroup.options.length;j++)
		                {
		                        if(HolidayGroup.options[j].selected)
		                        {
		                            oRecord.HolidayGroups=oRecord.HolidayGroups+HolidayGroup.options[j].value+','
		                        }
		                }
              }
              
           Dg_Holiday.executeInsert(oRecord);
         }
    
   function clearFlyout() 
    {
      var CurrentDate=new Date();
      document.getElementById("<%=txt_HolidayName.ClientID %>").value = '';
      document.getElementById("<%=drp_company.ClientID %>").selectedindex =  0;
      document.getElementById("<%=drp_ddHoliday.ClientID%>").value='';
      document.getElementById("<%=drp_MMHoliday.ClientID%>").value='';
      document.getElementById("<%=drp_YYYYHoliday.ClientID%>").value='';
      document.getElementById("<%=chk_RestrictedToGroup.ClientID%>").checked=false;
        var now=new Date();
                var NowDay=now.getDate();
		        var NowMonth=now.getMonth()+1;
		    
		        var NowYear=now.getFullYear();
		        var value=NowYear+'-'+NowMonth + "-" + NowDay;
      SetValueInDropDown(document.getElementById("<%=drp_ddHoliday.ClientID%>"),document.getElementById("<%=drp_MMHoliday.ClientID%>"),document.getElementById("<%=drp_YYYYHoliday.ClientID%>"),value); 
      document.getElementById("<%=txt_Description.ClientID %>").value =  '';
      document.getElementById("<%=Hdn_HolidayId.ClientID %>").value = '0';
      document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
      document.getElementById("<%=chk_RestrictedToGroup.ClientID%>").checked=false;
      var HolidayGroup=document.getElementById("<%=lst_HolidayGroup.ClientID %>");
		         for(var j=0;j<HolidayGroup.options.length;j++)
		                {
		                        HolidayGroup.options[j].selected=false;
		                }
	chk_RestrictedToGroup_onclick();	                
    }
</script>
    
</body>
</html>


