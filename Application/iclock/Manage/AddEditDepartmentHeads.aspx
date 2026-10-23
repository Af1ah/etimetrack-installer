<%@ page language="VB" autoeventwireup="false" inherits="Manage_AddEditDepartmentHeads, App_Web_usmjemmz" enableEventValidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        record.Error = '';
        document.getElementById("<%=hdn_EmployeeId.ClientID %>").value = record.EmployeeId;
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
                <td style="font-weight: bold;">
                    Department Heads&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label
                        runat="server" ID="lbl_DepartmentName" Style="font-family: Verdana; font-size: 13px;
                        color: #0c416f; font-weight: normal;"></asp:Label>
                </td>
                <td align="right">
                </td>
            </tr>
            <tr style="padding-right: 5px; padding-left: 1px; padding-bottom: 1px; padding-top: 1px;
                background-color: lightsteelblue;">
                <td colspan="2">
                    <hr />
                    <obout:Grid ID="Dg_DepartmentHeads" runat="server" CallbackMode="true" EnableRecordHover="true"
                        AllowFiltering="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                        FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                        <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                            OnClientDelete="OnDelete" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column ID="Column0" DataField="EmployeeId" Visible="False" Width="100" HeaderText="EmployeeId"
                                ConvertEmptyStringToNull="False" Index="0" />
                            <obout:Column ID="Column3" DataField="EmployeeCode" Width="150" HeaderText="Emp Code"
                                ConvertEmptyStringToNull="False" Index="1" />
                            <obout:Column ID="Column4" DataField="EmployeeName" Width="200" HeaderText="Emp Name"
                                ConvertEmptyStringToNull="False" Index="2" />
                            <obout:Column ID="Column5" DataField="Designation" Width="150" HeaderText="Designation"
                                ConvertEmptyStringToNull="False" Index="3" />
                            <obout:Column ID="Column6" DataField="EmployementType" Width="200" HeaderText="Employement Type"
                                ConvertEmptyStringToNull="False" Index="4" />
                            <obout:Column ID="Column7" DataField="ContactNo" Width="140" HeaderText="Contact No"
                                ConvertEmptyStringToNull="False" Index="5" />
                            <obout:Column ID="Column8" DataField="Email" Width="200" HeaderText="Email" ConvertEmptyStringToNull="False"
                                Index="6" />
                            <obout:Column ID="Column9" DataField="Status" Visible="False" Width="110" HeaderText="Status"
                                ConvertEmptyStringToNull="False" Index="7" />
                            <obout:Column ID="Column1" DataField="DepartmentId" Visible="false" Width="140" HeaderText="DepartmentId"
                                ConvertEmptyStringToNull="False" Index="8" />
                            <obout:Column ID="Column2" DataField="DepartmentSName" Visible="false" Width="140"
                                HeaderText="DepartmentSName" ConvertEmptyStringToNull="False" Index="9" />
                            <obout:Column Width="90" HeaderText="Delete" AllowDelete="True" ConvertEmptyStringToNull="False"
                                Index="10">
                            </obout:Column>
                        </Columns>
                        <Templates>
                            <obout:GridTemplate runat="server" ID="tplAddBtn">
                                <Template>
                                    
                                         <asp:HyperLink runat="server" CssClass="ob_gAL" Text='Assign Department Head'
                                            NavigateUrl='<%# "~/manage/AssignDepartmentHeads.aspx?DeptId=" + GetDataItemValue("DepartmentId")+"&DeptName=" + GetDataItemValue("DepartmentSName") + ""%>'
                                            ID="AA1" />
                                </Template>
                            </obout:GridTemplate>
                        </Templates>
                    </obout:Grid>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="background-color: lightsteelblue; padding-bottom: 5px;">
                    <hr />
                    &nbsp;&nbsp;<a style="font-family: Verdana; font-size: 13px; color: #0c416f;" href="Departments.aspx">«
                        Go to Departments</a>&nbsp;&nbsp;
                    <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                    <asp:HiddenField ID="hdn_DepartmentId" runat="server" />
                    <asp:HiddenField ID="hdn_DepartmentName" runat="server" />
                    <asp:HiddenField ID="hdn_EmployeeId" runat="server" />
                    <asp:HiddenField ID="hdn_LoginEmpName" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <script runat="server">
        Function GetDataItemValue(ByVal fieldname As String) As String
            If fieldname = "DepartmentId" Then
                Return hdn_DepartmentId.Value
            End If
            Return hdn_DepartmentName.Value
        End Function
    </script>

    </form>
</body>
</html>
