<%@ page language="VB" autoeventwireup="false" inherits="Manage_Companies, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register Assembly="obout_FileUpload" Namespace="OboutInc.FileUpload" TagPrefix="fup" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        record.Error = '';
        document.getElementById("<%=Hdn_CompanyId.ClientID %>").value = record.CompanyId;
        var Name = record.CompanySName;
        if (Name == 'Default') {
            alert("Company '" + record.CompanySName + "' can not be delete.");
            return false;
        }

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
<body>
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                <td colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Company List
                </td>
            </tr>
            <tr style="background-color: lightsteelblue;">
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <obout:Grid ID="Dg_Company" runat="server" CallbackMode="true" EnableRecordHover="true"
                        KeepSelectedRecords="true" Serialize="true" AllowFiltering="true" AutoGenerateColumns="false"
                        FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                        <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                            OnClientDelete="OnDelete" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column ID="Column2" DataField="CompanyId" Visible="false" Width="0" HeaderText="CompanyName"
                                runat="server" />
                            <obout:Column ID="Column1" DataField="CompanyFName" SortOrder="Asc" Visible="true"
                                Width="525" HeaderText="Company Name" runat="server" />
                            <obout:Column ID="Column7" DataField="CompanySName" Visible="true" Width="380" HeaderText="Short Name"
                                runat="server" />
                            <obout:Column ID="Column3" DataField="CompanyAddress" Visible="false" Width="300"
                                HeaderText="CompanyAddress" runat="server" />
                            <obout:Column ID="Column4" DataField="CompanyIsVisible" Visible="false" Width="300"
                                HeaderText="CompanyIsVisible" runat="server" />
                            <obout:Column ID="Column5" DataField="CompanyeMail" Visible="false" Width="300" HeaderText="CompanyeMail"
                                runat="server" />
                            <obout:Column ID="Column6" DataField="CompanyWebsite" Visible="false" Width="300"
                                HeaderText="CompanyeMail" runat="server" />
                            <obout:Column Width="90" HeaderText="Logo" AllowEdit="false" AllowDelete="false"
                                Visible="true">
                                <TemplateSettings TemplateId="tplOtherDetailsBtn" />
                            </obout:Column>
                            <obout:Column HeaderText="Edit" Width="65" AllowEdit="true" AllowDelete="true">
                                <TemplateSettings TemplateId="tplEditBtn" />
                            </obout:Column>
                            <obout:Column HeaderText="Delete" Width="65" AllowEdit="false" AllowDelete="true"
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
                            <obout:GridTemplate runat="server" ID="tplOtherDetailsBtn">
                                <Template>
                                    <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissionsEdit("Logo")%>'
                                        NavigateUrl='<%# "~/manage/UpdateCompanyLogo.aspx?CompanyId=" + GetDataItemValue("CompanyId", Container)+"&CompanySName=" + GetDataItemValue("CompanySName", Container) + ""%>'
                                        ID="AA1" />
                                </Template>
                            </obout:GridTemplate>
                        </Templates>
                    </obout:Grid>
                </td>
            </tr>
        </table>
        <obout:Flyout runat="server" ID="Flyout1" Align="RIGHT" Position="BOTTOM_CENTER"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Company Information</legend>
                            <table>
                                <tr>
                                    <td style="font-weight: bold;" align="right">
                                        Company Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_companyFName" runat="server" Width="185px"></asp:TextBox>
                                    </td>
                                    <td style="font-weight: bold;" align="right">
                                        Short Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_companySName" runat="server" Width="185px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td colspan="3" align="left">
                                        <asp:CheckBox ID="chk_IsVisible" runat="server" Text="Visible To All" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;" align="right">
                                        eMail
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_eMail" runat="server" Width="185px"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        Website
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Website" runat="server" Width="185px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Address Details
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txt_addess" runat="server" TextMode="MultiLine" Width="460px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label ID="Lbl_InvalidError" ForeColor="red" runat="server" Text=""></asp:Label><input
                            id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                                id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        <asp:HiddenField ID="Hdn_CompanyId" runat="server" />
                        <asp:HiddenField ID="HiddenPath" runat="server" />
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
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddCompanies") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditCompanies") Then
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
		    
		    function populateEditControls(iRecordIndex) 
		    {	
		        document.getElementById("<%=txt_companySName.ClientID %>").value = Dg_Company.Rows[iRecordIndex].Cells[2].Value;
		        document.getElementById("<%=txt_companyFName.ClientID %>").value = Dg_Company.Rows[iRecordIndex].Cells[1].Value.replace('(InVisible)','');
		        
		        if(document.getElementById("<%=txt_companySName.ClientID%>").value=='Default' || document.getElementById("<%=txt_companyFName.ClientID%>").value=='Default')
		        {
		            document.getElementById("<%=txt_companySName.ClientID%>").disabled=true;
		            document.getElementById("<%=txt_companyFName.ClientID%>").disabled=true;
		        }
		        
		        document.getElementById( "<%=txt_addess.ClientID %>").value = Dg_Company.Rows[iRecordIndex].Cells[3].Value.replace(/<BR>/gi,'\n');;
		        if(Dg_Company.Rows[iRecordIndex].Cells[4].Value=='0')
		        document.getElementById("<%=chk_IsVisible.ClientID %>").checked =false ;
                else
		        document.getElementById("<%=chk_IsVisible.ClientID %>").checked =true ;
		        document.getElementById("<%=Hdn_CompanyId.ClientID %>").value = Dg_Company.Rows[iRecordIndex].Cells[0].Value;
                document.getElementById("<%=txt_eMail.ClientID %>").value =  Dg_Company.Rows[iRecordIndex].Cells[5].Value;
                document.getElementById("<%=txt_Website.ClientID %>").value = Dg_Company.Rows[iRecordIndex].Cells[6].Value;	        
		   }
		   
          
		      
		    function btn_Save_onclick()
		    {
		        var oRecord = new Object();         
                oRecord.CompanyId =document.getElementById("<%=Hdn_CompanyId.ClientID %>").value ;
	            oRecord.Error='';

		        Dg_Company.executeInsert(oRecord);
                
		    }

		    
            function clearFlyout() 
            {
                document.getElementById("<%=txt_companySName.ClientID %>").value = '';
		        document.getElementById("<%=txt_companyFName.ClientID %>").value = '';
		        document.getElementById("<%=txt_companySName.ClientID%>").disabled=false;
		        document.getElementById("<%=txt_companyFName.ClientID%>").disabled=false;
                document.getElementById("<%=txt_eMail.ClientID %>").value = '';
                document.getElementById("<%=txt_Website.ClientID %>").value = '';
                
		        document.getElementById( "<%=txt_addess.ClientID %>").value = '';
		        document.getElementById("<%=chk_IsVisible.ClientID %>").checked = true;
		        document.getElementById("<%=Hdn_CompanyId.ClientID %>").value = '0';
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		    }



    </script>
</body>
</html>
