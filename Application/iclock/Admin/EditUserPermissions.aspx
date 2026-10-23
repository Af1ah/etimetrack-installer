<%@ page language="VB" autoeventwireup="false" inherits="Manage_EditUserPermissions, App_Web_kueexnan" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Edit User Details</title>
        <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
        
        <script type="text/javascript">
            function SelectAllCompanies()
		        {
		            var ListViewObject=document.getElementById("<%=lst_EditCompanies.ClientID %>");
		            for(var j=0;j<ListViewObject.options.length;j++)
		                    {
		                            ListViewObject.options[j].selected=true;
		                    }
		        }
		      
		      function DeSelectAllCompanies()
		        {
		         var ListViewObject=document.getElementById("<%=lst_EditCompanies.ClientID %>");
		         for(var j=0;j<ListViewObject.options.length;j++)
		                {
		                        ListViewObject.options[j].selected=false;
		                }
		        }
		      
		       function SelectAllPermissions()
		        {
		            var DivObjevt=document.getElementById("<%=div_Edittree.ClientID %>");
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
		            var DivObjevt=document.getElementById("<%=div_Edittree.ClientID %>");
		            var arrCheckboxes = DivObjevt.getElementsByTagName("INPUT");    
                    for(var i=0; i<arrCheckboxes.length; i++)
                     {      
                        if(arrCheckboxes[i].type == "checkbox")
                         {
                            arrCheckboxes[i].checked=false;
                        }
                    }
		        }
		        
		        function SelectPermissions()
		        {
		            var listString = document.getElementById('Hdn_EditPermissionsId').value;
                    var PermissionArray=new Array();
                    PermissionArray = listString.split(',');
                    var DivObjevt=document.getElementById("<%=div_Edittree.ClientID %>");
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
		        
		        
		        function btn_Save_onclick()
		        {
		            document.getElementById("<%=Hdn_EditPermissionsId.ClientID %>").value='';
		            document.getElementById("<%=Hdn_EditCompaniesId.ClientID %>").value='';
		            var oRecord = new Object();
		            
		            var DivObjevt=document.getElementById("<%=div_Edittree.ClientID %>");
		             var arrCheckboxes = DivObjevt.getElementsByTagName("INPUT");    
                    for(var i=0; i<arrCheckboxes.length; i++)
                     {      
                        if(arrCheckboxes[i].type == "checkbox" && arrCheckboxes[i].checked==true)
                         {
	                        document.getElementById("<%=Hdn_EditPermissionsId.ClientID %>").value=document.getElementById("<%=Hdn_EditPermissionsId.ClientID %>").value+arrCheckboxes[i].name+','
                            
                        }
                    }
                    
	                
		            var ListViewObject=document.getElementById("<%=lst_EditCompanies.ClientID %>");
	                for(var k=0;k<ListViewObject.options.length;k++)
	                        {
	                                if(ListViewObject.options[k].selected==true)
	                                {
	                                    document.getElementById("<%=Hdn_EditCompaniesId.ClientID %>").value=document.getElementById("<%=Hdn_EditCompaniesId.ClientID %>").value+ListViewObject.options[k].value+','
	                                }
	                        }
	               
		        }
		        
		        function Close() {  
                   opener.ReloadGrid();  
                   self.close();  
                } 
		      
        
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="rowEditTable">
            <tr>
                <td>
                    <fieldset>
                        <legend>System User Information</legend>
                        <table>
                            <tr>
                                <td style="font-weight: bold;">
                                    Login&nbsp;Name</td>
                                <td>
                                    <asp:TextBox ID="txt_EditLogin" runat="server" Width="130px" onkeydown = "return (event.keyCode!=222);"></asp:TextBox>
                                </td>
                                <td style="font-weight: bold;">
                                    Password
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_EditPassword" runat="server" CssClass="WebControls" TextMode="Password"
                                        Width="130px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Role Name
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txt_EditRoleName" CssClass="WebControls" runat="server" Width="333px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight: bold;">
                                    Email&nbsp;Id
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txt_Email" AutoComplete="off" CssClass="WebControls" runat="server" Width="333px"></asp:TextBox>
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
                                    <select id="lst_EditCompanies" runat="server" class="WebControls" multiple="true"
                                        style="width: 190px; height: 200px">
                                    </select>
                                </td>
                                <td colspan="2">
                                    <div id="div_Edittree" runat="server" style="border-right: black 1px solid; border-top: black 1px solid;
                                        border-left: black 1px solid; border-bottom: black 1px solid;">
                                        <asp:Literal ID="EditTreeview" EnableViewState="true" runat="server" />
                                    </div>
                                    <select visible="false" id="lst_EditPermissions" class="WebControls" runat="server"
                                        multiple="true" style="width: 202px; height: 200px">
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:HyperLink ID="lnk_EditCompaniesSelectAll" Style="cursor: hand;" CssClass="WebControls"
                                        onclick="SelectAllCompanies()" runat="server">Select All</asp:HyperLink>&nbsp;&nbsp;&nbsp;
                                    <asp:HyperLink ID="lnk_EditCompaniesDeSelectAll" Style="cursor: hand;" CssClass="WebControls"
                                        onclick="DeSelectAllCompanies()" runat="server">Deselect All</asp:HyperLink>
                                </td>
                                <td colspan="2">
                                    <asp:HyperLink ID="lnk_EditPermissionsSelectAll" Style="cursor: hand;" CssClass="WebControls"
                                        onclick="SelectAllPermissions()" runat="server">Select All</asp:HyperLink>&nbsp;&nbsp;&nbsp;
                                    <asp:HyperLink ID="lnk_EditPermissionsDeSelectAll" Style="cursor: hand;" CssClass="WebControls"
                                        onclick="DeSelectAllPermissions()" runat="server">Deselect All</asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="chkEditAccessInvisible" runat="server" CssClass="WebControls" Text="Can Access Invisible Items" />
                                </td>
                                <td colspan="2">
                                    <asp:CheckBox ID="chkEditIsAdmin" runat="server" CssClass="WebControls" Text="Is Admin" />
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
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClientClick="btn_Save_onclick()"  />
                    <input
                        id="btn_EditCancel" type="button" value="Close" onclick="Close();" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp; &nbsp; &nbsp;
                    <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Label1"></asp:Label>
                    <asp:HiddenField ID="Hdn_EditUserId" runat="server" />
                    <asp:HiddenField ID="Hdn_EditLoginUserId" runat="server" />
                    <asp:HiddenField ID="Hdn_EditPermissionsId" runat="server" />
                    <asp:HiddenField ID="Hdn_EditCompaniesId" runat="server" />
                    <asp:HiddenField ID="Hdn_EditLoginPassword" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
