<%@ page language="VB" autoeventwireup="false" inherits="Admin_Users2, App_Web_kueexnan" enableeventvalidation="false" %>

<%@ Register Src="~/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        record.Error = '';
        document.getElementById("<%=Hdn_UserId.ClientID %>").value = record.UserId;
        document.getElementById("<%=Hdn_UserName.ClientID %>").value = record.LoginName;
        if (confirm("Are you sure you want to delete? "))
            return true;
        else
            return false;
    }

    function OnBeforeClientInsert(record) {


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
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function OpenPopUpWindow(userid, companyids) {
            var iMyWidth;
            var iMyHeight;
            iMyWidth = (window.screen.width / 2) - (75 + 10);
            iMyHeight = (window.screen.height / 2) - (100 + 50);
            window.open("EditUserPermissions.aspx?Id=" + userid + "&CompanyIds=" + companyids + " ", "PopupChild", "status=no,height=450,width=500,resizable=yes,left=" + iMyWidth + ",top=" + iMyHeight + ",screenX=" + iMyWidth + ",screenY=" + iMyHeight + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
        }

        function ReloadGrid() {
            window.grid_SystemUsers.refresh();

        }  
    </script>
    <link display="all" href="../styles/grid/styles/premiere_blue/style.css" rel="stylesheet"
        type="text/css" />
    <link display="all" href="../styles/grid/styles/premiere_blue/interface/OboutTextBox/style.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:header ID="Header1" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                <td colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Users List
                </td>
            </tr>
            <tr style="background-color: lightsteelblue;">
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <obout:Grid ID="grid_SystemUsers" runat="server" CallbackMode="true" EnableRecordHover="true"
                        KeepSelectedRecords="true" Serialize="true" AllowFiltering="true" AutoGenerateColumns="false"
                        FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                        <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientInsert="OnBeforeClientInsert"
                            OnBeforeClientDelete="OnBeforeDelete" OnClientDelete="OnDelete" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column ID="Column0" DataField="UserId" Visible="false" Width="35" HeaderText="UserId"
                                runat="server" />
                            <obout:Column ID="Column1" DataField="LoginName" SortOrder="Asc" Visible="true" Width="400"
                                HeaderText="Login Name" runat="server" />
                            <obout:Column ID="Column2" DataField="Role" Visible="true" Width="400" HeaderText="Role Name"
                                runat="server" />
                            <obout:Column ID="Column3" DataField="IsAdmin" Visible="false" Width="300" HeaderText="IsAdmin"
                                runat="server" />
                            <obout:Column ID="Column4" DataField="AccessI" Visible="false" Width="300" HeaderText="AccessI"
                                runat="server" />
                            <obout:Column ID="Column5" DataField="CompaniesIds" Visible="false" Width="300" HeaderText="CompaniesIds"
                                runat="server" />
                            <obout:Column ID="Column6" DataField="PermissionsIds" Visible="false" Width="300"
                                HeaderText="PermissionsIds" runat="server" />
                            <obout:Column ID="Column7" DataField="LoginPassword" Visible="false" Width="300"
                                HeaderText="LoginPassword" runat="server" />
                            <obout:Column ID="Column8" DataField="IsWebAPI" Visible="false" Width="300"
                                HeaderText="IsWebAPI" runat="server" />
                            <obout:Column HeaderText="Edit" Width="90" AllowEdit="true"  AllowDelete="true">
                                <TemplateSettings TemplateId="tplEditBtn" />
                            </obout:Column>
                            <obout:Column HeaderText="Delete" Width="90" AllowEdit="false" AllowDelete="true"
                                Visible="true" />

                        </Columns>
                        <Templates>
                            <obout:GridTemplate runat="server" ID="tplEditBtn">
                                <Template>
                                    <a href="javascript: //" id="Edit_UserInfo" class="ob_gAL" onclick="OpenPopUpWindow(<%#Container.DataItem("UserId") %>,'<%#Container.DataItem("CompaniesIds") %>')">
                                        <%#CheckPermissionsEdit("Edit")%></a>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplDeleteBtn">
                                <Template>
                                    <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" class="ob_gAL">
                                        Delete</a>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplAddBtn">
                                <Template>
                                    <a href="javascript: //" runat="server" id="btAdd" onclick="attachFlyoutToLink(this,'Add')"
                                        class="ob_gAL">
                                        <%#CheckPermissions("Add")%></a>
                                </Template>
                            </obout:GridTemplate>
                        </Templates>
                    </obout:Grid>
                </td>
            </tr>
        </table>
        <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE"
            OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>System User Information</legend>
                            <table>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Login Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Login" runat="server" Width="130px" onkeydown = "return (event.keyCode!=222);" ></asp:TextBox>
                                    </td>
                                    <td style="font-weight: bold;">
                                        Password
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Password" runat="server" CssClass="WebControls" TextMode="Password"
                                            Width="130px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Role Name
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txt_RoleName" CssClass="WebControls" runat="server" Width="333px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Email&nbsp;Id
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txt_Email" AutoComplete="off" CssClass="WebControls" runat="server"
                                            Width="333px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Companies Allowed
                                    </td>
                                    <td colspan="2">
                                        Permissions Allowed
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <select id="lst_Companies" runat="server" class="WebControls" multiple="true" style="width: 190px;
                                            height: 200px">
                                        </select>
                                    </td>
                                    <td colspan="2">
                                        <div id="div_tree" runat="server" style="border-right: black 1px solid; border-top: black 1px solid;
                                            border-left: black 1px solid; border-bottom: black 1px solid;">
                                            <asp:Literal ID="TreeView" EnableViewState="true" runat="server" />
                                        </div>
                                        <select visible="false" id="lst_Permissions" class="WebControls" runat="server" multiple="true"
                                            style="width: 202px; height: 200px">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink ID="lnk_CompaniesSelectAll" Style="cursor: hand;" CssClass="WebControls"
                                            onclick="SelectAllCompanies()" runat="server">Select All</asp:HyperLink>&nbsp;&nbsp;&nbsp;
                                        <asp:HyperLink ID="lnk_CompaniesDeSelectAll" Style="cursor: hand;" CssClass="WebControls"
                                            onclick="DeSelectAllCompanies()" runat="server">Deselect All</asp:HyperLink>
                                    </td>
                                    <td colspan="2">
                                        <asp:HyperLink ID="lnk_PermissionsSelectAll" Style="cursor: hand;" CssClass="WebControls"
                                            onclick="SelectAllPermissions()" runat="server">Select All</asp:HyperLink>&nbsp;&nbsp;&nbsp;
                                        <asp:HyperLink ID="lnk_PermissionsDeSelectAll" Style="cursor: hand;" CssClass="WebControls"
                                            onclick="DeSelectAllPermissions()" runat="server">Deselect All</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chkAccessInvisible" runat="server" CssClass="WebControls" Text="Can Access Invisible Items" />
                                    </td>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chkIsAdmin" runat="server" CssClass="WebControls" Text="Is Admin" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chkIsWebAPI" runat="server" CssClass="WebControls" Text="Is Web API User" />
                                    </td>
                                    <td colspan="2">
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
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                        <asp:HiddenField ID="Hdn_UserId" runat="server" />
                        <asp:HiddenField ID="Hdn_UserName" runat="server" />
                        <asp:HiddenField ID="Hdn_LoginUserId" runat="server" />
                        <asp:HiddenField ID="Hdn_PermissionsId" runat="server" />
                        <asp:HiddenField ID="Hdn_CompaniesId" runat="server" />
                        <asp:HiddenField ID="Hdn_LoginPassword" runat="server" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
    </div>
    </form>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddUsers") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditUsers") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
    </script>
    <script type="text/javascript">
		    
		    function attachFlyoutToLink(oLink,Action)
		        {	
		            var Flyout=<%=Flyout1.getClientID()%>
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
		            document.getElementById("<%=txt_Login.ClientID %>").value = grid_SystemUsers.Rows[iRecordIndex].Cells[1].Value;
		            document.getElementById("<%=txt_Password.ClientID %>").value = '';
		            document.getElementById( "<%=txt_RoleName.ClientID %>").value = grid_SystemUsers.Rows[iRecordIndex].Cells[2].Value;
		            document.getElementById("<%=Hdn_LoginPassword.ClientID %>").value =grid_SystemUsers.Rows[iRecordIndex].Cells[7].Value;
		            document.getElementById("<%=Hdn_UserId.ClientID %>").value = grid_SystemUsers.Rows[iRecordIndex].Cells[0].Value;
		            SelectPermissions(grid_SystemUsers.Rows[iRecordIndex].Cells[6].Value);
		            SelectCompanies(grid_SystemUsers.Rows[iRecordIndex].Cells[5].Value);
		            if(grid_SystemUsers.Rows[iRecordIndex].Cells[4].Value=='-1')
		                document.getElementById("<%=chkAccessInvisible.ClientID %>").checked =true ;
		            else
		                document.getElementById("<%=chkAccessInvisible.ClientID %>").checked =false ;
		                
		            if(grid_SystemUsers.Rows[iRecordIndex].Cells[3].Value=='-1')
		                document.getElementById("<%=chkIsAdmin.ClientID %>").checked =true ;
		            else
		                document.getElementById("<%=chkIsAdmin.ClientID %>").checked =false ;

                         if(grid_SystemUsers.Rows[iRecordIndex].Cells[8].Value=='-1')
		                document.getElementById("<%=chkISWebAPI.ClientID %>").checked =true ;
		            else
		                document.getElementById("<%=chkISWebAPI.ClientID %>").checked =false ;
		            
		            
		        }
		   
		   function SelectPermissions(Permissions)
		        {
		            var PermissionArray=new Array();
                    PermissionArray = Permissions.split(',');
                    var DivObjevt=document.getElementById("<%=div_tree.ClientID %>");
		            var arrCheckboxes = DivObjevt.getElementsByTagName("INPUT");   
                   
		                for(var i=0;i<PermissionArray.length;i++)
		                {
		                    for(var j=0;j<arrCheckboxes.length;j++)
		                    {
		                        if (PermissionArray[i]==arrCheckboxes[j].name)
		                        {
		                            arrCheckboxes[j].checked=true;
		                        }
		                    }
		                }
		        }
		   
		    function SelectCompanies(Companies)
		        {
		            var CompaniesArray=new Array();
                    CompaniesArray = Companies.split(',');
                    var lnl_CompaniesId=document.getElementById("<%=lst_Companies.ClientID %>")
		                for(var i=0;i<CompaniesArray.length;i++)
		                {
		                    for(var j=0;j<lnl_CompaniesId.options.length;j++)
		                    {
		                        if (CompaniesArray[i]==lnl_CompaniesId.options[j].value)
		                        {
		                            lnl_CompaniesId.options[j].selected=true;
		                        }
		                    }
		                }
		            }
		      
		      function SelectAllCompanies()
		        {
		            var ListViewObject=document.getElementById("<%=lst_Companies.ClientID %>");
		            for(var j=0;j<ListViewObject.options.length;j++)
		                    {
		                            ListViewObject.options[j].selected=true;
		                    }
		        }
		      
		      function DeSelectAllCompanies()
		        {
		         var ListViewObject=document.getElementById("<%=lst_Companies.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=false;
		                }
		        }
		      
		       function SelectAllPermissions()
		        {
		            var DivObjevt=document.getElementById("<%=div_tree.ClientID %>");
		            var arrCheckboxes = DivObjevt.getElementsByTagName("INPUT");    
                    for(var i=0; i<arrCheckboxes.length; i++)
                     {      
                        if(arrCheckboxes[i].type == "checkbox")
                         {
                            arrCheckboxes[i].checked=true;
                        }
                    }
		        }
		        
		       
		      
		       function DeSelectAllPermissions()
		        {
		            var DivObjevt=document.getElementById("<%=div_tree.ClientID %>");
		            var arrCheckboxes = DivObjevt.getElementsByTagName("INPUT");    
                    for(var i=0; i<arrCheckboxes.length; i++)
                     {      
                        if(arrCheckboxes[i].type == "checkbox")
                         {
                            arrCheckboxes[i].checked=false;
                        }
                    }
		        }
		      
		      
		       function btn_Save_onclick()
		        {
		            document.getElementById("<%=Hdn_PermissionsId.ClientID %>").value='';
		            document.getElementById("<%=Hdn_CompaniesId.ClientID %>").value='';
		            var oRecord = new Object();
		            
		            var DivObjevt=document.getElementById("<%=div_tree.ClientID %>");
		             var arrCheckboxes = DivObjevt.getElementsByTagName("INPUT");    
                    for(var i=0; i<arrCheckboxes.length; i++)
                     {      
                        if(arrCheckboxes[i].type == "checkbox" && arrCheckboxes[i].checked==true)
                         {
	                        document.getElementById("<%=Hdn_PermissionsId.ClientID %>").value=document.getElementById("<%=Hdn_PermissionsId.ClientID %>").value+arrCheckboxes[i].name+','
                            
                        }
                    }
                    
	                
		            ListViewObject=document.getElementById("<%=lst_Companies.ClientID %>");
	                for(var k=0;k<ListViewObject.options.length;k++)
	                        {
	                                if(ListViewObject.options[k].selected==true)
	                                {
	                                    document.getElementById("<%=Hdn_CompaniesId.ClientID %>").value=document.getElementById("<%=Hdn_CompaniesId.ClientID %>").value+ListViewObject.options[k].value+','
	                                }
	                        }
	                oRecord.Login =document.getElementById("<%=txt_Login.ClientID %>").value ;
	                oRecord.Error='';
	                grid_SystemUsers.executeInsert(oRecord);
		        }
		    
            function clearFlyout() 
            {
                document.getElementById("<%=txt_Login.ClientID %>").value = '';
		        document.getElementById("<%=txt_Password.ClientID %>").value = '';
		        document.getElementById( "<%=txt_RoleName.ClientID %>").value = '';
		        document.getElementById("<%=chkAccessInvisible.ClientID %>").checked = false;
		        document.getElementById("<%=chkIsAdmin.ClientID %>").checked = false;
		        document.getElementById("<%=Hdn_UserId.ClientID %>").value = '0';
		        document.getElementById("<%=Hdn_LoginPassword.ClientID %>").value = '';
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		        DeSelectAllCompanies();
		        DeSelectAllPermissions();
		    }
    </script>
</body>
</html>
