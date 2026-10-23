<%@ page language="VB" autoeventwireup="false" inherits="Manage_WorkCode, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        var WorkCodeId=record.WorkCode;
	        if(WorkCodeId=='0')
	            {
	                alert("Work Code '0' Can not be delete");
	                return false;    
	            }
	    
	        record.Error='';
		    document.getElementById("<%=Hdn_WorkCodeId.ClientID %>").value = record.WorkCode;
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
                        Work Code List
                    </td>
                </tr>
                
                <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                
                <tr>
                    <td colspan="2" >
    <obout:Grid id="Dg_WorkCode" runat="server" CallbackMode="true" EnableRecordHover="true" KeepSelectedRecords="true"  Serialize="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                 OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord"  AllowFiltering="true" >
                 <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
			<TemplateSettings NewRecord_TemplateId="tplAddBtn" />
			
			<Columns>
				<obout:Column ID="Column2" DataField="WorkCode" Visible="true" Width="150" HeaderText="Work Code" runat="server" />
				<obout:Column ID="Column1" DataField="WorkCodeName" Visible="true"  SortOrder="Asc"  Width="300" HeaderText="Work Code Name" runat="server" />
                <obout:Column ID="Column7" DataField="Description" Visible="true" Width="330" HeaderText="Description" runat="server" />
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
	
	</td>
                </tr>
            </table>	
            
            <obout:Flyout runat="server" ID="Flyout1" Position="BOTTOM_CENTER" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
		    <table class="rowEditTable">
                    <tr>
                        <td >
                            <fieldset>
                                <legend>Work Code Details</legend>
                                <table>
                                    <tr>
                                        <td  style="font-weight: bold;">
                                            Work Code</td>
                                        <td>
                                            <asp:DropDownList ID="drp_WorkCode" runat="server"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                    <td style="font-weight: bold;">
                                    Work Code Name
                                    </td>
                                    <td>
                                            <asp:TextBox ID="txt_WorkCodeName" runat="server" Width="280px"  ></asp:TextBox>
                                    </td>
                                    </tr>
                                    
                                    <tr>
                                    <td>
                                    Description
                                    </td>
                                    <td>
                                            <asp:TextBox ID="txt_Description" runat="server" Width="280px" TextMode="MultiLine"  ></asp:TextBox>
                                    </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" foreColor="red" Text=""  ID="Lbl_InvalidError"></asp:Label><asp:HiddenField ID="Hdn_WorkCodeId" runat="server" /><input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;<input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                                
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
		        document.getElementById("<%=Hdn_WorkCodeId.ClientID %>").value = Dg_WorkCode.Rows[iRecordIndex].Cells[0].Value;
		        document.getElementById("<%=drp_WorkCode.ClientID %>").value = Dg_WorkCode.Rows[iRecordIndex].Cells[0].Value;
		        document.getElementById( "<%=txt_WorkCodeName.ClientID %>").value = Dg_WorkCode.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=txt_Description.ClientID %>").value = Dg_WorkCode.Rows[iRecordIndex].Cells[2].Value.replace(/<BR>/gi,'\n');;
		        document.getElementById("<%=drp_WorkCode.ClientID %>").disabled=true;
		    }
		   
		      
		     function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.Error='';
		        Dg_WorkCode.executeInsert(oRecord);
		     }
		    
            function clearFlyout() 
            {
		        document.getElementById("<%=Hdn_WorkCodeId.ClientID %>").value = '';
                document.getElementById("<%=drp_WorkCode.ClientID %>").selectedindex=0;
		        document.getElementById( "<%=txt_WorkCodeName.ClientID %>").value = '';
		        document.getElementById("<%=txt_Description.ClientID %>").value = '';
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		        document.getElementById("<%=drp_WorkCode.ClientID %>").disabled=false;
		        
		    }
		    
		    
		
    </script>
</body>

</html>
