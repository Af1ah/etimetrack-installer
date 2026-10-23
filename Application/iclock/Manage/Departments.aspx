<%@ page language="VB" autoeventwireup="false" inherits="Manage_Departments, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
		    var Name=record.DepartmentSName;
		    if(Name=='Default')
		        {
		            alert("Department '"+record.DepartmentSName+"' can not be delete.");
	                return false;
		        }
	            document.getElementById("<%=Hdn_DepartmentId.ClientID %>").value = record.DepartmentId;
	            document.getElementById("<%=Hdn_DepartmentName.ClientID %>").value = record.DepartmentSName;
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
                        Department List
                    </td>
                </tr>
                
                <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                
                <tr>
                    <td colspan="2">
                        <obout:Grid ID="Dg_Department" runat="server" AllowFiltering="true" CallbackMode="true"
                            EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                            FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                            OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column DataField="DepartmentId" Visible="false" ReadOnly="true" HeaderText="DepartmentId " />
                                <obout:Column ID="Column1" DataField="DepartmentFName"  SortOrder="Asc"  Visible="true" Width="450"
                                    HeaderText="Department Name" runat="server" />
                                <obout:Column ID="Column2" DataField="DepartmentSName" Visible="true" Width="430"
                                    HeaderText="Short Name" runat="server" />
                                <obout:Column ID="Column4" DataField="Description" Visible="false" Width="200" HeaderText="Description"
                                    runat="server" />
                                <obout:Column Width="90" HeaderText="Edit" AllowEdit="false" AllowDelete="false"
                                    Visible="true" >
                                    <TemplateSettings TemplateId="tplDeptHeads" />
                                </obout:Column>
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
                                <obout:GridTemplate runat="server" ID="tplDeptHeads">
                                    <Template>
                                        <a class="ob_gAL" href="AddEditDepartmentHeads.aspx?Code=<%#Container.DataItem.Item("DepartmentId")%>&Name=<%#Container.DataItem.Item("DepartmentSName")%>">
                                            <%#CheckPermissions("Heads")%></a>
                                    </Template>
                                </obout:GridTemplate>

                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
            
            <obout:Flyout runat="server" ID="Flyout_Department"  Position=BOTTOM_CENTER
                CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Department Details</legend>
                                <table>
                                    <tr>
                                        <td   style="font-weight: bold;">
                                            Department Name
                                        </td>
                                        <td >
                                            <asp:TextBox ID="txt_DepartmentFullName" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  style="font-weight: bold;">
                                            Short Name
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txt_DepartmentShortName" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Description
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox runat="server" ID="txt_Description"   TextMode="MultiLine" Width="250px"></asp:TextBox>
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
                            <asp:HiddenField ID="Hdn_DepartmentId" runat="server" />
                             <asp:HiddenField ID="Hdn_DepartmentName" runat="server" />
                        </td>
                    </tr>
                </table>
            </obout:Flyout>
        </div>
    </form>
    
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddDepartments") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
         Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditDepartments") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
    </script>

    
    <script type="text/javascript">
		   
		    function attachFlyoutToLink(oLink,Action)
		     {	
		       <%=Flyout_Department.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_Department.getClientID()%>.Open();
		        clearFlyout();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout_Department.getClientID()%>.Close();
		    }
		    

	  function populateEditControls(iRecordIndex) 
		   {	
		        document.getElementById("<%=txt_DepartmentFullName.ClientID%>").value = Dg_Department.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=txt_DepartmentShortName.ClientID%>").value = Dg_Department.Rows[iRecordIndex].Cells[2].Value;
		        
		        if(document.getElementById("<%=txt_DepartmentShortName.ClientID%>").value=='Default' || document.getElementById("<%=txt_DepartmentFullName.ClientID%>").value=='Default')
		        {
		            document.getElementById("<%=txt_DepartmentShortName.ClientID%>").disabled=true;
		            document.getElementById("<%=txt_DepartmentFullName.ClientID%>").disabled=true;
		        }
		        
		        document.getElementById("<%=txt_Description.ClientID%>").value=Dg_Department.Rows[iRecordIndex].Cells[3].Value.replace(/<BR>/gi,'\n');
                document.getElementById("<%=Hdn_DepartmentId.ClientID %>").value = Dg_Department.Rows[iRecordIndex].Cells[0].Value;  
		   }
		   
       function btn_Save_onclick()
         {
            var oRecord = new Object();
            oRecord.DepartmentId =document.getElementById("<%=Hdn_DepartmentId.ClientID %>").value;
            oRecord.Error='';
            Dg_Department.executeInsert(oRecord);
         }
		    
        function clearFlyout() 
        {
            document.getElementById("<%=txt_DepartmentFullName.ClientID %>").value = '';
	        document.getElementById("<%=txt_DepartmentShortName.ClientID %>").value = '';
	        
	        document.getElementById("<%=txt_DepartmentFullName.ClientID%>").disabled=false;
		        document.getElementById("<%=txt_DepartmentShortName.ClientID%>").disabled=false;
		        
	        document.getElementById("<%=txt_Description.ClientID %>").value =  '';
	        document.getElementById("<%=Hdn_DepartmentId.ClientID %>").value = '0';
            document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
	    }
	    
    </script>

</body>
</html>
