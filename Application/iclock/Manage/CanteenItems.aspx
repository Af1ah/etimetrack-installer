<%@ page language="VB" autoeventwireup="false" inherits="Manage_CanteenItems, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
	        var Name = record.CanteenItemName;

	        document.getElementById("<%=Hdn_CanteenItemId.ClientID %>").value = record.CanteenItemId;
	        document.getElementById("<%=Hdn_CanteenItemName.ClientID %>").value = record.CanteenItemName;
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
                    <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;padding:5px; color: white;">
                        Canteen Item List
                    </td>
                </tr>
                
                <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                
                <tr>
                    <td colspan="2">
                        <obout:Grid ID="Dg_CanteenItems" runat="server" AllowFiltering="true" CallbackMode="true"
                            EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                            FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                            OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column DataField="CanteenItemId" Visible="false" ReadOnly="true" HeaderText="CanteenItemId "
                                    Index="0" />
                                <obout:Column ID="Column1" DataField="CanteenItemName" SortOrder="Asc" Visible="true"
                                    Width="450" HeaderText="Canteen Item Name" runat="server" Index="1" />
                                <obout:Column ID="Column2" DataField="CanteenItemSName" Visible="false" Width="430"
                                    HeaderText="CanteenItemSName" runat="server" Index="2" />
                                <obout:Column ID="Column4" DataField="CanteenItemCode" Visible="true" Width="200"
                                    HeaderText="CanteenItemCode" runat="server" Index="3" />
                                <obout:Column ID="Column3" DataField="EmployeeContribution" Visible="true" Width="200"
                                    HeaderText="EmployeeContribution" runat="server" Index="4" />
                                <obout:Column ID="Column5" DataField="EmployerContribution" Visible="true" Width="200"
                                    HeaderText="EmployerContribution" runat="server" Index="5" />
                                <obout:Column HeaderText="Edit" Width="65" AllowEdit="true" AllowDelete="true" Index="6">
                                    <TemplateSettings TemplateId="tplEditBtn" />
                                </obout:Column>
                                <obout:Column HeaderText="Delete" Width="70" AllowEdit="false" AllowDelete="true"
                                    Visible="true" Index="7" />
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
            
            <obout:Flyout runat="server" ID="Flyout_CanteenItems" Align="left" Position="BOTTOM_left"
                CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Canteen Item Details</legend>
                                <table>
                                    <tr>
                                        <td   style="font-weight: bold;">
                                            Item Name
                                        </td>
                                        <td >
                                            <asp:TextBox ID="txt_ItemFullName" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  style="font-weight: bold;">
                                            Item Short Name
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txt_ItemShortName" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold;">
                                            Item Code
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txt_ItemCode" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Employee Contribution
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox runat="server" ID="txt_EmployeeContribution"  Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            Employer Contribution
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox runat="server" ID="txt_EmployerContribution"  Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" foreColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input
                                id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                            <asp:HiddenField ID="Hdn_CanteenItemId" runat="server" />
                             <asp:HiddenField ID="Hdn_CanteenItemName" runat="server" />
                        </td>
                    </tr>
                </table>
            </obout:Flyout>
        </div>
    </form>
    
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                Return Action
                'If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddDepartments") Then
                '    Return Action
                'End If
                'Return ""
            End If
        End Function
        
         Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                 Return Action
                'If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditDepartments") Then
                '    Return Action
                'End If
                'Return ""
            End If
        End Function
        
    </script>

    
    <script type="text/javascript">
		   
		    function attachFlyoutToLink(oLink,Action)
		     {	
		       <%=Flyout_CanteenItems.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_CanteenItems.getClientID()%>.Open();
		        clearFlyout();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout_CanteenItems.getClientID()%>.Close();
		    }
		    

	  function populateEditControls(iRecordIndex) 
		   {	
		        document.getElementById("<%=txt_ItemFullName.ClientID%>").value = Dg_CanteenItems.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=txt_ItemShortName.ClientID%>").value = Dg_CanteenItems.Rows[iRecordIndex].Cells[2].Value;
		        document.getElementById("<%=txt_ItemCode.ClientID%>").value = Dg_CanteenItems.Rows[iRecordIndex].Cells[3].Value;
                document.getElementById("<%=txt_EmployeeContribution.ClientID%>").value = Dg_CanteenItems.Rows[iRecordIndex].Cells[4].Value;
                document.getElementById("<%=txt_EmployerContribution.ClientID%>").value = Dg_CanteenItems.Rows[iRecordIndex].Cells[5].Value;
                document.getElementById("<%=Hdn_CanteenItemId.ClientID %>").value = Dg_CanteenItems.Rows[iRecordIndex].Cells[0].Value;  
		   }
		   
       function btn_Save_onclick()
         {
            var oRecord = new Object();
            oRecord.CanteenItemId =document.getElementById("<%=Hdn_CanteenItemId.ClientID %>").value;
            oRecord.Error='';
            Dg_CanteenItems.executeInsert(oRecord);
         }
		    
        function clearFlyout() 
        {
            document.getElementById("<%=txt_ItemFullName.ClientID %>").value = '';
	        document.getElementById("<%=txt_ItemShortName.ClientID %>").value = '';    
	        document.getElementById("<%=txt_ItemCode.ClientID %>").value =  '';
            document.getElementById("<%=txt_EmployeeContribution.ClientID %>").value =  '';
            document.getElementById("<%=txt_EmployerContribution.ClientID %>").value =  '';
	        document.getElementById("<%=Hdn_CanteenItemId.ClientID %>").value = '0';
            document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
	    }
	    
    </script>

</body>
</html>
