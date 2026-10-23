<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeePayDetails, App_Web_4fhf4tum" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
		    document.getElementById("<%=Hdn_SalaryStructureId.ClientID %>").value = record.SalaryStructureId;
	        if(confirm("Are you sure you want to delete? "))
	            return true;
	        else
	            return false;
	    }
	
	function OnDelete(record) 
	{
	    alert(record.Error);
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
            <table width="100px" cellpadding="0" cellspacing="0" style="border-right: gray 1px solid;
                border-top: gray 1px solid; border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="background-color: lightsteelblue; padding-left: 5px; padding-top: 3px;
                    padding-bottom: 3px; color: white;">
                    <td colspan="2">
                        <table>
                            <tr style="font-family: Verdana; font-size: 14px; font-weight: bold; color: #0c416f;">
                                <td colspan="3">
                                    <asp:Label ID="lbl_EmployeeName" runat="server" Text="Sumit:Sumit007"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                            <tr style="font-family: Verdana; font-size: 11px; color: #0c416f;">
                                <td>
                                    <table>
                                        <tr>
                                            <td style="font-family: Verdana; font-size: 11px; color: #0c416f;">
                                                Payment Type</td>
                                            <td style="font-family: Verdana; font-size: 11px; color: #0c416f;">
                                                <asp:RadioButtonList ID="rbtn_PaymentType" Font-Names="Verdana" Font-Size="11 px" ForeColor="#0c416f" RepeatDirection="Horizontal" runat="server">
                                                    <asp:ListItem Selected="True">Bank Transfer</asp:ListItem>
                                                    <asp:ListItem>Cheque/DD</asp:ListItem>
                                                    <asp:ListItem>Cash</asp:ListItem>
                                                </asp:RadioButtonList></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    PAN Card Number&nbsp;<asp:TextBox ID="txt_PANCARDNumber" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr style="font-family: Verdana; font-size: 11px; color: #0c416f;">
                                <td>
                                <table>
                                <tr>
                                <td style="font-family: Verdana; font-size: 11px; color: #0c416f;">&nbsp;&nbsp;Bank Name</td>
                                <td><obout:Combobox Validate="false" ID="Drp_Bankname" CssClass="WebControls" runat="server"
                                        Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                    </obout:Combobox></td>
                                </tr>
                                </table>
                                    
                                    
                                </td>
                                <td>
                                    Bank A/C Number&nbsp;<asp:TextBox ID="txt_bankAccountNo" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    IFSCE Code&nbsp;<asp:TextBox ID="txt_IFSECode" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="font-family: Verdana; font-size: 11px; color: #0c416f;">
                                <td>
                                    ESIC Number&nbsp;<asp:TextBox ID="txt_ESICNumber" runat="server" Width="214px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; PF Number&nbsp;<asp:TextBox ID="txt_PFno"
                                        runat="server"></asp:TextBox>
                                </td>
                                <td>
                                
                                <table>
                                <tr>
                                <td style="font-family: Verdana; font-size: 11px; color: #0c416f;">PF Scheme</td>
                                <td><obout:Combobox Validate="false" ID="drp_PFScheme" CssClass="WebControls" runat="server"
                                        Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                    </obout:Combobox></td>
                                </tr>
                                </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right">
                                <hr />
                                    <asp:HiddenField ID="Hdn_SalaryStructureId" runat="server" />
                                    <asp:HiddenField ID="Hdn_EmployeePayDetailsId" runat="server" />
                                    <asp:Label ID="lbl_Error" runat="server" style="font-family: Verdana; font-size: 11px; color: Red;"></asp:Label><asp:Button ID="btn_Update"
                                        runat="server" Text="Update" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                    <obout:Grid ID="dg_EmployeeSalary" runat="server" 
                                        AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue" AllowRecordSelection="true"
                                        AllowAddingRecords="true" PageSize="10" OnDeleteCommand="DeleteRecord"
                                         GenerateRecordIds="true" AllowFiltering="true"  OnRebind="RebindGrid" >
                                        <ClientSideEvents OnBeforeClientDelete="OnBeforeDelete" OnClientDelete="OnDelete" />
                                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                                        <Columns>
                                            <obout:Column ID="Column0" DataField="SalaryStructureId" Visible="false" Width="120" HeaderText="SalaryStructureId"
                                                runat="server" />
                                            <obout:Column ID="Column1"  DataFormatString="{0:dd MMM yyyy}"   DataField="EffectiveDate" Visible="true" Width="120" HeaderText="Effective Date"
                                                runat="server" />
                                            <obout:Column ID="Column2" DataField="Basic" Visible="true" Width="100" HeaderText="Basic"
                                                runat="server" />
                                            <obout:Column ID="Column3" DataField="HRA" Visible="true" Width="100" HeaderText="HRA"
                                                runat="server" />
                                            <obout:Column ID="Column4" DataField="DA" Visible="true" Width="100" HeaderText="DA"
                                                runat="server" />
                                            <obout:Column ID="Column5" DataField="Conveyance" Visible="true" Width="130" HeaderText="Conveyance"
                                                runat="server" />
                                            <obout:Column ID="Column6" DataField="OTPerHour" Visible="true" Width="140" HeaderText="OT Per Hour"
                                                runat="server" />
                                            <obout:Column ID="Column7" DataField="LOP" Visible="true" Width="140" HeaderText="LOP per Day"
                                                runat="server" />
                                            <obout:Column HeaderText="Edit" Width="70" AllowEdit="true" AllowDelete="true">
                                                <TemplateSettings TemplateId="tplEditBtn" />
                                            </obout:Column>
                                             <obout:Column HeaderText="Delete" Width="70" AllowEdit="false" AllowDelete="true" Visible="true" />
                                        </Columns>
                                        <Templates>
                                            <obout:GridTemplate runat="server" ID="tplEditBtn">
                                                <Template>
                                                <a href='#' id="AA2" onserverclick="Edit_onserverclick" runat="server" class="ob_gAL">Edit</a>
                                                </Template>
                                            </obout:GridTemplate>
                                            <obout:GridTemplate runat="server" ID="tplAddBtn">
                                                <Template>
                                                    <asp:HyperLink runat="server" CssClass="ob_gAL" Text="Add" NavigateUrl='<%# "~/PayRoll/EmployeeSalaryStructure.aspx?SalaryStructureId=" + "0"+"&EmployeeId=" + Request.QueryString("EmployeeId")+"&EmployeeCode="+Request.QueryString("EmployeeCode")+"&EmployeeName="+Request.QueryString("EmployeeName")+"&Action=EmployeePayDetails"%>'
                                                        ID="AA1" />
                                                </Template>
                                            </obout:GridTemplate>
                                        </Templates>
                                    </obout:Grid>
                                </td>
                            </tr>
                            <tr style="background-color: lightsteelblue; padding-left: 5px;font-size:11px; padding-top: 3px;padding-bottom: 3px;" >
                                <td colspan="3"  align="left">
                                <hr />
                                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Manage/Employees.aspx" runat="server"><< Go To Employees</asp:HyperLink>
                                </td>
                             </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script runat="server">
        
        Function GetDataItemValue(ByVal fieldname As String, ByVal Container As Obout.Grid.TemplateContainer) As String
            If Container.DataItem(fieldname) Is Nothing Then
                Return Container.DataItem(fieldname.ToUpper)
            End If
            Return Container.DataItem(fieldname)
        End Function
        
    </script>

</body>
</html>
