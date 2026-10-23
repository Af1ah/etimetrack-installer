<%@ page language="VB" autoeventwireup="false" inherits="Manage_DeviceGreetings, App_Web_kgq5n2bg" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
		    document.getElementById("<%=Hdn_DeviceGreetingId.ClientID %>").value = record.DeviceGreetingId;
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
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;padding:5px; color: white;">
                        Device Greeting List
                    </td>
                </tr>
                
                <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                
                <tr>
                    <td colspan="2" >
                    <div id="div_Employees">
                    
    <obout:Grid id="Dg_DeviceGreeting" runat="server" CallbackMode="true" EnableRecordHover="true" KeepSelectedRecords="true"  Serialize="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                 OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord"  AllowFiltering="true" >
                 <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
			<TemplateSettings NewRecord_TemplateId="tplAddBtn" />
			<Columns>
				<obout:Column ID="Column0" DataField="DeviceGreetingId" Visible="false" Width="150" HeaderText="DeviceGreetingId" runat="server" />
                <obout:Column ID="Column1" DataField="GreetingType" Visible="true" Width="120" HeaderText="Greeting Type" runat="server" />
				<obout:Column ID="Column2" DataField="StartTime" Visible="true" DataFormatString="{0:dd-MMM-yyyy HH:mm}"  SortOrder="Desc"  Width="160" HeaderText="StartTime" runat="server" />
                <obout:Column ID="Column3" DataField="ValidMinutes" Visible="true" Width="130" HeaderText="Valid Mins" runat="server" />
                <obout:Column ID="Column4" DataField="DeviceSName" Visible="true" Width="150" HeaderText="Device" runat="server" />
                <obout:Column ID="Column5" DataField="Content" Visible="true" Width="250" HeaderText="Content" runat="server" />
                <obout:Column ID="Column6" DataField="DeviceId" Visible="false" Width="330" HeaderText="DeviceId" runat="server" />
				<obout:Column  Width="65" AllowEdit="true" HeaderText="" AllowDelete="true"><TemplateSettings TemplateId="tplEditBtn" /></obout:Column>
                <obout:Column  Width="70" AllowEdit="false" HeaderText=""  AllowDelete="true" Visible="true" />
			</Columns>					
			<Templates>
			<obout:GridTemplate runat="server" ID="tplEditBtn">
			        <Template>
			            <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')" class="ob_gAL">Edit</a>
			        </Template>
			 </obout:GridTemplate>
			    
			  <obout:GridTemplate runat="server" ID="tplAddBtn">
			        <Template>
			            <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add')" class="ob_gAL">Add</a>
			        </Template>
			    </obout:GridTemplate>
			    
			</Templates>
		</obout:Grid>
	</div>	
	
	</td>
                </tr>
            </table>
            
            <oem:EasyMenu ID="EasyMenu1" runat="server" StyleFolder="~/styles/EasyMenu/Styles/vsnet"
            IconsFolder="MenuIcons" Width="210" UseIcons="true" AttachTo="div_Employees"
            ShowEvent="ContextMenu" Align="Cursor">
            <Components>
                 <oem:MenuItem ID="menuItem6" runat="server" >
                    <a id="A1" href="#" runat="server" style="width:100%;" onserverclick="btn_UploadGreetingToEmployees_onserverclick" >Assign Greeting To Employees</a>
                </oem:MenuItem>
                <oem:MenuSeparator ID="menuSeparator6" InnerHtml="&amp;nbsp;" AllowsIcon="true"> </oem:MenuSeparator>
            </Components>
        </oem:EasyMenu>
        	
            
            <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
		    <table class="rowEditTable">
                    <tr>
                        <td >
                            <fieldset>
                                <legend>Device Greeting Details</legend>
                                <table>
                                    <tr>
                                        <td  style="font-weight: bold;">
                                            Greeting Type</td>
                                        <td>
                                            <asp:DropDownList ID="drp_GreetingType" runat="server"  CssClass="WebControls">
                                            <asp:ListItem Value="253" Selected="True">Public</asp:ListItem>
                                            <asp:ListItem Value="254">Personal</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>Valid Mins</td>
                                        <td><asp:TextBox ID="txt_ValidMins" runat="server" Width="82px"></asp:TextBox>
                                            Minute</td>
                                            
                                    </tr>
                                    
                                    <tr>
                                    <td>
                                    Start Time
                                    </td>
                                    <td colspan="3">
                                      <asp:DropDownList ID="drp_ToDateday"  runat="server"   CssClass="WebControls"></asp:DropDownList>&nbsp;&nbsp;
                                      <asp:DropDownList ID="drp_ToDatemonth" runat="server"  CssClass="WebControls"></asp:DropDownList>&nbsp;&nbsp;
                                      <asp:DropDownList ID="drp_ToDateYear" runat="server"  CssClass="WebControls" ></asp:DropDownList>&nbsp;&nbsp;
                                     <asp:DropDownList runat="server" ID="msktxt_HHBeginTime" CssClass="WebControls"  Width="40" ></asp:DropDownList>&nbsp;:&nbsp;
                                     <asp:DropDownList runat="server" CssClass="WebControls" ID="msktxt_mmBeginTime" Width="50"></asp:DropDownList>
                                    </td>
                                    </tr>
                                    
                                    <tr>
                                    <td style="font-weight: bold;">
                                   Device
                                    </td>
                                    <td colspan="3">
                                           <asp:DropDownList runat="server" ID="drp_Device" CssClass="WebControls"  ></asp:DropDownList>
                                    </td>
                                    </tr>
                                    
                                    <tr>
                                    <td>
                                    Content
                                    </td>
                                    <td colspan="3">
                                            <asp:TextBox ID="txt_Content" runat="server" Width="280px" TextMode="MultiLine"  ></asp:TextBox>
                                    </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" foreColor="red" Text=""  ID="Lbl_InvalidError"></asp:Label><asp:HiddenField ID="Hdn_DeviceGreetingId" runat="server" /><input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;<input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                                
                        </td>
                    </tr>
                </table>
			</obout:Flyout>
			
    </div>
    </form>
    
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
		    
		    function populateEditControls(iRecordIndex) 
		    {	
		        document.getElementById("<%=Hdn_DeviceGreetingId.ClientID %>").value = Dg_DeviceGreeting.Rows[iRecordIndex].Cells[0].Value;
		        if(Dg_DeviceGreeting.Rows[iRecordIndex].Cells[1].Value=='Personal')
		        {
		            document.getElementById("<%=drp_GreetingType.ClientID %>").value = '254';
		        }
		        else
		        {
		            document.getElementById("<%=drp_GreetingType.ClientID %>").value = '253';
		        }
		        document.getElementById("<%=txt_ValidMins.ClientID %>").value = Dg_DeviceGreeting.Rows[iRecordIndex].Cells[3].Value;
		        document.getElementById("<%=drp_Device.ClientID %>").value = Dg_DeviceGreeting.Rows[iRecordIndex].Cells[6].Value;
		        document.getElementById("<%=txt_Content.ClientID %>").value = Dg_DeviceGreeting.Rows[iRecordIndex].Cells[5].Value;
		        document.getElementById( "<%=drp_ToDateday.ClientID %>").value = Dg_DeviceGreeting.Rows[iRecordIndex].Cells[2].Value.split('/')[0].replace(/^[0]+/g,"");
		        document.getElementById( "<%=drp_ToDatemonth.ClientID %>").value = Dg_DeviceGreeting.Rows[iRecordIndex].Cells[2].Value.split('/')[1].replace(/^[0]+/g,"");
		        document.getElementById( "<%=drp_ToDateYear.ClientID %>").value = Dg_DeviceGreeting.Rows[iRecordIndex].Cells[2].Value.split('/')[2].split(' ')[0];
		        var HourValue=Dg_DeviceGreeting.Rows[iRecordIndex].Cells[2].Value.split('/')[2].split(' ')[1].split(':')[0];
		        
		        if(Dg_DeviceGreeting.Rows[iRecordIndex].Cells[2].Value.search('PM')>=0)
		        {
		        HourValue=12+Number(HourValue);
		        }
		        if(HourValue=='1' || HourValue=='2' || HourValue=='3' || HourValue=='4' || HourValue=='5' || HourValue=='6' || HourValue=='7' || HourValue=='8' || HourValue=='9')
		        {
		            HourValue='0'+HourValue;
		        }
		        document.getElementById( "<%=msktxt_HHBeginTime.ClientID %>").value =HourValue ;
		        document.getElementById( "<%=msktxt_mmBeginTime.ClientID %>").value = Dg_DeviceGreeting.Rows[iRecordIndex].Cells[2].Value.split('/')[2].split(' ')[1].split(':')[1];
		    }
		    
 function SetValueInDropDown(ddobject,mmobject,yyobject,value)
		    {
		         var myDate = new Date(value);
		        var Day=myDate.getDate();
		        var Month=myDate.getMonth()+1;
		        var Year=myDate.getFullYear();
		        
		        
		        ddobject.value='';
		        mmobject.value='';
		        yyobject.value='';
		        
		        ddobject.value=Day;
		        mmobject.value=Month;
		        yyobject.value=Year;
		    }
		   
		    
		    
		     function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.Error='';
		        Dg_DeviceGreeting.executeInsert(oRecord);
		     }
		    
            function clearFlyout() 
            {
		        document.getElementById("<%=Hdn_DeviceGreetingId.ClientID %>").value = 0;
		        document.getElementById("<%=drp_GreetingType.ClientID %>").value = "253";
		        document.getElementById("<%=txt_ValidMins.ClientID %>").value = '0';
		        document.getElementById("<%=txt_Content.ClientID %>").value ='';
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		    }
    </script>
</body>

</html>
