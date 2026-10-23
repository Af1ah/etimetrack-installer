<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeeSalaryStructure, App_Web_4fhf4tum" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    function OnBeforeDeleteEarnings(record) {
        document.getElementById("<%=Hdn_TypeId.ClientID %>").value = record.SalaryStructureEarningId;
        if (confirm("Are you sure you want to delete? "))
            return true;
        else
            return false;
    }

    function OnBeforeDeleteDeduction(record) {
        document.getElementById("<%=Hdn_TypeId.ClientID %>").value = record.SalaryStructureDeductionId;
        if (confirm("Are you sure you want to delete? "))
            return true;
        else
            return false;
    }

    function OnDeleteEarnings(record) {
        alert(record.Error);
    }

    function OnDeleteDeduction(record) {
        alert(record.Error);
    }

    function OnInsertEarnings(record) {
        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = record.Error;
    }

    function OnInsertDeduction(record) {
        document.getElementById("<%=lbl_DeductionError.ClientID %>").innerHTML = record.Error;
    }
	
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <link display="all" href="~/styles/default/style.css" rel="stylesheet" type="text/css" />
    <link display="all" href="" rel="stylesheet" type="text/css" />
</head>
<body onload="EnableDisableTextBox();">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table width="100%" cellpadding="0" cellspacing="0" style="background-color: Whitesmoke;">
            <tr>
                <td align="left" style="padding: 5px; height: 32px;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_EmpName" runat="server" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <obout:Combobox Validate="false" ID="drp_EmployeeCode" CssClass="WebControls" runat="server"
                                    Width="200" FolderStyle="~/styles/default" SelectedIndex="0">
                                </obout:Combobox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="right" style="padding: 5px; height: 32px;">
                    Effective Date&nbsp;<asp:DropDownList ID="drp_Month" runat="server">
                    </asp:DropDownList>
                    &nbsp;<asp:DropDownList ID="drp_Year" runat="server">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                </td>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" style="background-color: Whitesmoke;">
            <tr>
                <td>
                    <hr />
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" style="background-color: whitesmoke;">
            <tr>
                <td style="width: 1160px">
                    <fieldset style="margin: 5px;">
                        <legend>Standard Earnings</legend>
                        <table>
                            <tr>
                                <td>
                                    &nbsp;Basic&nbsp;<asp:TextBox ID="txt_Basic" runat="server" onkeyup="EvaluateExpression();"
                                        onkeypress="ValidateTextBoxForNumericValue();" Width="180px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;HRA&nbsp;<asp:TextBox ID="txt_HRA" runat="server" onkeyup="EvaluateExpression();"
                                        onkeypress="ValidateTextBoxForNumericValue();" Width="180px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;DA&nbsp;<asp:TextBox ID="txt_DA" runat="server" onkeyup="EvaluateExpression();"
                                        onkeypress="ValidateTextBoxForNumericValue();" Width="180px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;Conveyance&nbsp;<asp:TextBox ID="txt_Conveyance" onkeyup="EvaluateExpression();"
                                        onkeypress="ValidateTextBoxForNumericValue();" runat="server" Width="180px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:CheckBox ID="chk_OTperHour" onclick="EnableDisableTextBox();" Text="OT per Hour"
                                        runat="server" />&nbsp;<asp:TextBox ID="txt_OTperHour" onkeyup="EvaluateExpression();"
                                            onkeypress="ValidateTextBoxForNumericValue();" runat="server" Width="123px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" style="background-color: whitesmoke;">
            <tr>
                <td style="width: 1160px">
                    <fieldset style="margin: 5px;">
                        <legend>Standard Deduction</legend>
                        <table>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_TDS" onclick="EnableDisableTextBox();" Text="TDS" runat="server" />&nbsp;<asp:TextBox
                                        ID="txt_TDS" onkeyup="EvaluateExpression();" onkeypress="ValidateTextBoxForNumericValue();"
                                        runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_ESIC" onclick="EnableDisableTextBox();" Text="ESIC" runat="server" />&nbsp;&nbsp;
                                    &nbsp; &nbsp; Employee Contribution to ESIC&nbsp;<asp:TextBox ID="txt_ESIC" onkeyup="EvaluateExpression();"
                                        onkeypress="ValidateTextBoxForNumericValue();" runat="server" Width="100px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp; &nbsp;&nbsp; Employer Contribution to ESIC&nbsp;<asp:TextBox ID="txt_EmployerESICContribution"
                                        onkeyup="EvaluateExpression();" runat="server" onkeypress="ValidateTextBoxForNumericValue();"
                                        Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chk_PT" Text="PT" onclick="EnableDisableTextBox();" runat="server" />&nbsp;&nbsp;&nbsp;<asp:TextBox
                                        ID="txt_PT" onkeyup="EvaluateExpression();" onkeypress="ValidateTextBoxForNumericValue();"
                                        runat="server" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                   
                                    <asp:CheckBox ID="chk_PF" Text="PF" onclick="EnableDisableTextBox();" runat="server" />&nbsp;&nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; Employee Contribution to PF&nbsp; &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txt_PF"
                                        onkeyup="EvaluateExpression();" onkeypress="ValidateTextBoxForNumericValue();"
                                        runat="server" Width="100px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Employer Contribution to PF&nbsp;<asp:TextBox ID="txt_EmployerPFContribution"
                                        runat="server" onkeyup="EvaluateExpression();" onkeypress="ValidateTextBoxForNumericValue();"
                                        Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:CheckBox ID="chk_LOP" onclick="EnableDisableTextBox();" Text="LOP" runat="server" />&nbsp;<asp:TextBox
                                        ID="txt_LOP" onkeyup="EvaluateExpression();" onkeypress="ValidateTextBoxForNumericValue();"
                                        runat="server" Width="200px"></asp:TextBox>&nbsp;Per Day&nbsp;
                                    <asp:RadioButtonList ID="rbtn_FixedOrFloatingLOP" runat="server" RepeatDirection="Horizontal"
                                        RepeatLayout="Flow">
                                        <asp:ListItem Selected="True" Value="-1">Fixed</asp:ListItem>
                                        <asp:ListItem Value="0">Floating</asp:ListItem>
                                    </asp:RadioButtonList>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chk_FloatingPF" Text="Floating PF" runat="server" />&nbsp;&nbsp;<asp:CheckBox
                                        ID="chk_FloatingPT" Text="FLoating PT" runat="server" />&nbsp;&nbsp;<asp:CheckBox
                                            ID="chk_FloatingESIC" Text="Floating ESIC" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" style="background-color: whitesmoke;">
            <tr>
                <td style="width: 1160px">
                    <table>
                        <tr>
                            <td style="width: 1060px">
                                <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="lbl_Error"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:Button ID="btn_Update" runat="server" Text="Add" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" style="background-color: whitesmoke;">
            <tr>
                <td>
                    <hr />
                </td>
            </tr>
        </table>
        <table width="100%" visible="false" runat="server" id="tble_EarningAndDeduction"
            cellpadding="0" cellspacing="0" style="background-color: whitesmoke;">
            <tr>
                <td style="font-weight: bold; font-family: Verdana; font-size: 14px;">
                    &nbsp;&nbsp;&nbsp;Earnings
                </td>
                <td style="font-weight: bold; font-family: Verdana; font-size: 14px;">
                    &nbsp;&nbsp; Deduction
                </td>
            </tr>
            <tr>
                <td style="padding: 4px;" valign="top">
                    <obout:Grid ID="Dg_Earnings" runat="server" AllowFiltering="false" CallbackMode="true"
                        EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                        FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteEarningRecord">
                        <ClientSideEvents OnClientInsert="OnInsertEarnings" OnBeforeClientDelete="OnBeforeDeleteEarnings"
                            OnClientDelete="OnDeleteEarnings" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column ID="Column1" DataField="SalaryStructureEarningId" SortOrder="Asc" Visible="False"
                                Width="450" HeaderText="Id" ConvertEmptyStringToNull="False" Index="0" />
                            <obout:Column DataField="EarningType" ReadOnly="True" HeaderText="Earning Type" Width="155" />
                            <obout:Column ID="Column2" DataField="Amount" Width="110" HeaderText="Amount" />
                            <obout:Column ID="Column4" DataField="Remarks" Visible="True" Width="150" HeaderText="Remarks" />
                            <obout:Column Width="65" AllowEdit="True" AllowDelete="True" TemplateId="tplEditBtn">
                                <TemplateSettings TemplateId="tplEditBtn" />
                            </obout:Column>
                            <obout:Column Width="70" AllowDelete="True" ConvertEmptyStringToNull="False" Index="5" />
                        </Columns>
                        <Templates>
                            <obout:GridTemplate runat="server" ID="tplEditBtn" ControlID="" ControlPropertyName="">
                                <Template>
                                    <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Earning','Update')">
                                        Edit</a>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplAddBtn">
                                <Template>
                                    <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Earning','Add');"
                                        class="ob_gAL">Add</a>
                                </Template>
                            </obout:GridTemplate>
                        </Templates>
                    </obout:Grid>
                </td>
                <td style="padding: 4px;" valign="top">
                    <obout:Grid ID="Dg_Deductions" runat="server" AllowFiltering="false" EnableRecordHover="true"
                        KeepSelectedRecords="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                        AllowAddingRecords="true" ShowLoadingMessage="false" OnRebind="RebindGrid" OnInsertCommand="InsertRecord"
                        OnDeleteCommand="DeleteDeductionRecord">
                        <ClientSideEvents OnClientInsert="OnInsertDeduction" OnBeforeClientDelete="OnBeforeDeleteDeduction"
                            OnClientDelete="OnDeleteDeduction" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn1" />
                        <Columns>
                            <obout:Column ID="Column3" DataField="SalaryStructureDeductionId" SortOrder="Asc"
                                Visible="False" Width="450" HeaderText="Id" ConvertEmptyStringToNull="False"
                                Index="0" />
                            <obout:Column DataField="DeductionType" ReadOnly="True" HeaderText="Deduction Type"
                                Width="155" />
                            <obout:Column ID="Column5" DataField="Amount" Width="110" HeaderText="Amount" />
                            <obout:Column ID="Column6" DataField="Remarks" Visible="True" Width="195" HeaderText="Remarks" />
                            <obout:Column HeaderText="Edit" Width="65" AllowEdit="True" AllowDelete="True" TemplateId="tplEditBtn">
                                <TemplateSettings TemplateId="tplEditBtn1" />
                            </obout:Column>
                            <obout:Column HeaderText="Delete" Width="70" AllowDelete="True" ConvertEmptyStringToNull="False"
                                Index="5" />
                        </Columns>
                        <Templates>
                            <obout:GridTemplate runat="server" ID="tplEditBtn1" ControlID="" ControlPropertyName="">
                                <Template>
                                    <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Deduction','Update')">
                                        Edit</a>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplAddBtn1" ControlID="" ControlPropertyName="">
                                <Template>
                                    <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Deduction','Add');"
                                        class="ob_gAL">Add</a>
                                </Template>
                            </obout:GridTemplate>
                        </Templates>
                    </obout:Grid>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" style="background-color: whitesmoke;">
            <tr style="background-color: whitesmoke; padding-left: 5px; font-size: 11px; padding-top: 3px;
                padding-bottom: 3px;">
                <td>
                    <hr />
                    <asp:HyperLink ID="Link_RedirectEmployeePaySlip" Style="cursor: hand;" NavigateUrl='<%# "EmployeePayslip.aspx?EmployeeId=" + Request.QueryString("EmployeeId")+"&EmployeeCode="+Request.QueryString("EmployeeCode")+"&EmployeeName="+Request.QueryString("EmployeeName") %>'
                        runat="server" Visible="False"><< Go To Employee Pay Details</asp:HyperLink>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hdn_HRA" runat="server" />
        <asp:HiddenField ID="hdn_Conveyance" runat="server" />
        <asp:HiddenField ID="hdn_DA" runat="server" />
        <asp:HiddenField ID="hdn_OT" runat="server" />
        <asp:HiddenField ID="hdn_PT" runat="server" />
        <asp:HiddenField ID="hdn_TDS" runat="server" />
        <asp:HiddenField ID="hdn_EmployeePF" runat="server" />
        <asp:HiddenField ID="hdn_EmployerPF" runat="server" />
        <asp:HiddenField ID="hdn_EmployeeESIC" runat="server" />
        <asp:HiddenField ID="hdn_EmployerESIC" runat="server" />
        <asp:HiddenField ID="hdn_LOP" runat="server" />

        <obout:Flyout runat="server" ID="Flyout_EarningDetails" Align="RIGHT" Position="BOTTOM_RIGHT"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Earning/Deduction Details</legend>
                            <table>
                                <tr>
                                    <td style="font-weight: bold;">
                                        <asp:Label ID="lbl_type" runat="server" Width="110px" Text="Earning Type"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <obout:Combobox Validate="false" ID="drp_EarningType" CssClass="WebControls" runat="server"
                                            Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Amount
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_Amount" runat="server" Width="150px"></asp:TextBox>&nbsp;
                                        <asp:CheckBox ID="chk_EarningIsTaxable" runat="server" Text="Is Taxable" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Remarks
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_Remarks" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                        <input id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeEarningFlyout();" />
                       
                    </td>
                </tr>
            </table>
        </obout:Flyout>

        
        <obout:Flyout runat="server" ID="Flyout_DeductionDetails" Align="RIGHT" Position="BOTTOM_RIGHT"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Earning/Deduction Details</legend>
                            <table>
                                <tr>
                                    <td style="font-weight: bold;">
                                        <asp:Label ID="Label1" runat="server" Width="110px" Text="Deduction Type"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <obout:Combobox Validate="false" ID="drp_DeductionType" CssClass="WebControls" runat="server"
                                            Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                        </obout:Combobox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Amount
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_DeductionAmount" runat="server" Width="150px"></asp:TextBox>&nbsp;
                                        <asp:CheckBox ID="chk_DeductionIsTaxable" runat="server" Text="Is Taxable" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Remarks
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_DeductionRemarks" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="lbl_DeductionError"></asp:Label>
                        <input id="btn_DeductionSave" type="button" value="Save" onclick="javascript:btn_Deduction_Save_onclick();" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="btn_DeductionClose" type="button" value="Close" onclick="javascript:closeDeductionFlyout();" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>

        <asp:HiddenField ID="Hdn_TypeId" runat="server" />
        <asp:HiddenField ID="Hdn_TypeName" runat="server" />
        <asp:HiddenField ID="Hdn_DeductionType" runat="server" />
        <asp:HiddenField ID="Hdn_EarningType" runat="server" />
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

    <script type="text/javascript">
		   
		    function attachFlyoutToLink(oLink,Type,Action)
		     {	
		        if(Action=='Add' && Type=='Earning')
		        {
		            <%=Flyout_EarningDetails.getClientID()%>.AttachTo(oLink.id);		            		            
		            <%=Flyout_EarningDetails.getClientID()%>.Open();
		            ClearFlyoutEarning();
		        }
		        
		        else if(Action=='Update' && Type=='Earning')
		        {
		            <%=Flyout_EarningDetails.getClientID()%>.AttachTo(oLink.id);		            		            
		            <%=Flyout_EarningDetails.getClientID()%>.Open();
		            populateEarning(oLink.id.toString().replace("grid_link_", ""));
		        }
		        
		        else if(Action=='Add' && Type=='Deduction')
		        {
		            <%=Flyout_DeductionDetails.getClientID()%>.AttachTo(oLink.id);		            		            
		            <%=Flyout_DeductionDetails.getClientID()%>.Open();
		            ClearFlyoutDeduction();
		        }
		        
		        else if(Action=='Update' && Type=='Deduction')
		        {
		            <%=Flyout_DeductionDetails.getClientID()%>.AttachTo(oLink.id);		            		            
		            <%=Flyout_DeductionDetails.getClientID()%>.Open();
		            populateDeduction(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
		    
		function closeEarningFlyout() 
		    {
		        <%=Flyout_EarningDetails.getClientID()%>.Close();
		    }
		    
		    function closeDeductionFlyout() 
		    {
		        <%=Flyout_DeductionDetails.getClientID()%>.Close();
		    }
		    
		function ClearFlyoutDeduction() 
		   {
		        AddEarningOrDeductionType(document.getElementById("<%=Hdn_DeductionType.ClientID%>").value,'Deduction');
		        document.getElementById("<%=txt_DeductionAmount.ClientID%>").value = '';
		        document.getElementById("<%=txt_DeductionRemarks.ClientID%>").value = '';
                document.getElementById("<%=Hdn_TypeId.ClientID %>").value = 0;  
                document.getElementById("<%=Hdn_TypeName.ClientID %>").value = 'Deduction';  
                document.getElementById("<%=lbl_type.ClientID %>").innerHTML="Deduction Type"
                document.getElementById("<%=lbl_DeductionError.ClientID %>").innerHTML="";
		        document.getElementById("ob_drp_DeductionTypeTextbox").value = '';
		   }

	  function populateDeduction(iRecordIndex) 
		   {	
		        AddEarningOrDeductionType(document.getElementById("<%=Hdn_DeductionType.ClientID%>").value,'Deduction');
                 
		        document.getElementById("ob_drp_DeductionTypeTextbox").value = Dg_Deductions.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=txt_DeductionAmount.ClientID%>").value = Dg_Deductions.Rows[iRecordIndex].Cells[2].Value;
		        document.getElementById("<%=txt_DeductionRemarks.ClientID%>").value = Dg_Deductions.Rows[iRecordIndex].Cells[3].Value.replace(/<BR>/gi,'\n');
                document.getElementById("<%=Hdn_TypeId.ClientID %>").value = Dg_Deductions.Rows[iRecordIndex].Cells[0].Value;  
                document.getElementById("<%=Hdn_TypeName.ClientID %>").value = 'Deduction';  
                document.getElementById("<%=lbl_DeductionError.ClientID %>").innerHTML="";
		   }
		   
		   function ClearFlyoutEarning() 
		   {	
		        AddEarningOrDeductionType(document.getElementById("<%=Hdn_EarningType.ClientID%>").value,'Earning');
		        document.getElementById("<%=txt_Amount.ClientID%>").value = '';
		        document.getElementById("<%=txt_Remarks.ClientID%>").value = '';
                document.getElementById("<%=Hdn_TypeId.ClientID %>").value = 0;    
                document.getElementById("<%=Hdn_TypeName.ClientID %>").value = 'Earning';  
                document.getElementById("<%=lbl_type.ClientID %>").innerHTML="Earning Type"
                document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML="";
                document.getElementById("ob_drp_EarningTypeTextbox").value = '';
		   }
		    function populateEarning(iRecordIndex) 
		   {	
		        AddEarningOrDeductionType(document.getElementById("<%=Hdn_EarningType.ClientID%>").value,'Earning');
               
		        document.getElementById("ob_drp_EarningTypeTextbox").value = Dg_Earnings.Rows[iRecordIndex].Cells[1].Value;
                          

		        document.getElementById("<%=txt_Amount.ClientID%>").value = Dg_Earnings.Rows[iRecordIndex].Cells[2].Value;

		        document.getElementById("<%=txt_Remarks.ClientID%>").value = Dg_Earnings.Rows[iRecordIndex].Cells[3].Value.replace(/<BR>/gi,'\n');
                document.getElementById("<%=Hdn_TypeId.ClientID %>").value = Dg_Earnings.Rows[iRecordIndex].Cells[0].Value;  
                document.getElementById("<%=Hdn_TypeName.ClientID %>").value = 'Earning';  
                document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML="";
                
		   }
		   
       function btn_Save_onclick()
         {
            var oRecord = new Object();
            oRecord.TypeId =document.getElementById("<%=Hdn_TypeId.ClientID %>").value;
            oRecord.Type =document.getElementById("<%=Hdn_TypeName.ClientID %>").value;
            oRecord.TypeText=document.getElementById("ob_drp_EarningTypeTextbox").value
            oRecord.Error='';
            oRecord.Status='';
            Dg_Earnings.executeInsert(oRecord);
         }
         
          function btn_Deduction_Save_onclick()
         {
            
            var oRecord = new Object();           
            oRecord.TypeId =document.getElementById("<%=Hdn_TypeId.ClientID %>").value;
            oRecord.Type =document.getElementById("<%=Hdn_TypeName.ClientID %>").value;       
            oRecord.TypeText=document.getElementById("ob_drp_DeductionTypeTextbox").value
           
            oRecord.Error='';
            oRecord.Status='';
           
            Dg_Deductions.executeInsert(oRecord);
         }
         
         function EnableDisableTextBox()
         {
            if(document.getElementById("<%=chk_OTperHour.ClientID %>").checked)
                document.getElementById("<%=txt_OTperHour.ClientID %>").disabled=false;
            else
                document.getElementById("<%=txt_OTperHour.ClientID %>").disabled=true;
                
            if(document.getElementById("<%=chk_TDS.ClientID %>").checked)
                document.getElementById("<%=txt_TDS.ClientID %>").disabled=false;
            else
                document.getElementById("<%=txt_TDS.ClientID %>").disabled=true;   
                
            if(document.getElementById("<%=chk_ESIC.ClientID %>").checked)
            {
                document.getElementById("<%=txt_ESIC.ClientID %>").disabled=false;
                document.getElementById("<%=txt_EmployerESICContribution.ClientID %>").disabled=false;
                document.getElementById("<%=chk_FloatingESIC.ClientID %>").disabled=false;
            }    
            else
                {
                    document.getElementById("<%=txt_ESIC.ClientID %>").disabled=true;
                    document.getElementById("<%=txt_EmployerESICContribution.ClientID %>").disabled=true;
                    document.getElementById("<%=chk_FloatingESIC.ClientID %>").disabled=true;
                     document.getElementById("<%=chk_FloatingESIC.ClientID %>").checked=false;
                }
            if(document.getElementById("<%=chk_PT.ClientID %>").checked)
            {
                document.getElementById("<%=txt_PT.ClientID %>").disabled=false;
                document.getElementById("<%=chk_FloatingPT.ClientID %>").disabled=false;
                }
            else
            {
                document.getElementById("<%=txt_PT.ClientID %>").disabled=true;
                document.getElementById("<%=chk_FloatingPT.ClientID %>").disabled=true;
                document.getElementById("<%=chk_FloatingPT.ClientID %>").checked=false;
                }
                
            if(document.getElementById("<%=chk_PF.ClientID %>").checked)
                {
                    document.getElementById("<%=txt_PF.ClientID %>").disabled=false;
                    document.getElementById("<%=txt_EmployerPFContribution.ClientID %>").disabled=false;
                    document.getElementById("<%=chk_FloatingPF.ClientID %>").disabled=false;
                }
            else
                {
                    document.getElementById("<%=txt_PF.ClientID %>").disabled=true;
                    document.getElementById("<%=txt_EmployerPFContribution.ClientID %>").disabled=true;
                    document.getElementById("<%=chk_FloatingPF.ClientID %>").disabled=true;
                    document.getElementById("<%=chk_FloatingPF.ClientID %>").checked=false;
                }
                
            if(document.getElementById("<%=chk_LOP.ClientID %>").checked)
                document.getElementById("<%=txt_LOP.ClientID %>").disabled=false;
            else
                document.getElementById("<%=txt_LOP.ClientID %>").disabled=true;      
                
                
                EvaluateExpression();          
         }
         
          function AddEarningOrDeductionType(EarningOrDeductionValue,Type) 
          {
                if(Type=='Earning')
                    drp_EarningType.clearOptions();
                 else
                    drp_DeductionType.clearOptions();
                
                var EarningOrDeductionArray=new Array();
		        EarningOrDeductionArray=EarningOrDeductionValue.split(';');
		        for(var i=0;i<EarningOrDeductionArray.length;i++)
		            {
		                var EarningOrDeductionRecord=EarningOrDeductionArray[i].split(':');
		                if(EarningOrDeductionRecord[0]!= "" && EarningOrDeductionRecord[1] != "")
		                {  
		                    if(Type=='Earning')
                                drp_EarningType.addOption(EarningOrDeductionRecord[0], EarningOrDeductionRecord[1]); 
                            else
		                         drp_DeductionType.addOption(EarningOrDeductionRecord[0], EarningOrDeductionRecord[1]);   
		                }    
		            }
		    }
		    
		    function ValidateTextBoxForNumericValue()
                {
                    if(!(event.keyCode==45||event.keyCode==46||event.keyCode==48||event.keyCode==49||event.keyCode==50||event.keyCode==51||event.keyCode==52||event.keyCode==53||event.keyCode==54||event.keyCode==55||event.keyCode==56||event.keyCode==57))
        		            {			
        		                event.returnValue=false;		
        		            }
        		            
                }
                 
            function EvaluateExpression()
                {
                    var HRAFormula=document.getElementById("<%=hdn_HRA.ClientId %>").value;
		            var ConveyanceFormula=document.getElementById("<%=hdn_Conveyance.ClientId %>").value;
		            var DAFormula=document.getElementById("<%=hdn_DA.ClientId %>").value;
		            var OTFormula=document.getElementById("<%=hdn_OT.ClientId %>").value;
		            var PTFormula=document.getElementById("<%=hdn_PT.ClientId %>").value;
		            var TDSFormula=document.getElementById("<%=hdn_TDS.ClientId %>").value;
		            var EmployeePFFormula=document.getElementById("<%=hdn_EmployeePF.ClientId %>").value;
		            var EmployerPFFormula=document.getElementById("<%=hdn_EmployerPF.ClientId %>").value;
		            var EmployeeESICFormula=document.getElementById("<%=hdn_EmployeeESIC.ClientId %>").value;
		            var EmployerESICFormula=document.getElementById("<%=hdn_EmployerESIC.ClientId %>").value;
		            var LOPFormula=document.getElementById("<%=hdn_LOP.ClientId %>").value;
		            
		            
		          
		            var HRA= document.getElementById("<%=txt_HRA.ClientId %>").value;
		            var Conveyance= document.getElementById("<%=txt_Conveyance.ClientId %>").value;
		            var DA= document.getElementById("<%=txt_DA.ClientId %>").value;
		            var OT= document.getElementById("<%=txt_OTPerHour.ClientId %>").value;
		            var PT= document.getElementById("<%=txt_PT.ClientId %>").value;
		            var TDS=  document.getElementById("<%=txt_TDS.ClientId %>").value;
		            var EmployeePF=  document.getElementById("<%=txt_PF.ClientId %>").value;
		            var EmployerPF=  document.getElementById("<%=txt_EmployerPFContribution.ClientId %>").value;
		            var EmployeeESIC=  document.getElementById("<%=txt_ESIC.ClientId %>").value;
		            var EmployerESIC=  document.getElementById("<%=txt_EmployerESICContribution.ClientId %>").value;
		            var LOP=  document.getElementById("<%=txt_LOP.ClientId %>").value;
		            var Basic=  document.getElementById("<%=txt_Basic.ClientId %>").value;
		            
		            if(HRAFormula!='')
		                {
		                    HRA=CalculatedValue(HRAFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_HRA.ClientId %>").value=HRA;
		                }
		                
		            if(ConveyanceFormula!='')
                        {
                            Conveyance=CalculatedValue(ConveyanceFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_Conveyance.ClientId %>").value=Conveyance;
                        }		                    
		            if(DAFormula!='')
                        {
		                    DA=CalculatedValue(DAFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_DA.ClientId %>").value=DA;
	                    }	            
		            if(document.getElementById("<%=chk_OTperHour.ClientId %>").checked)
		            {
		            if(OTFormula!='')
		                {
		                    OT=CalculatedValue(OTFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_OTPerHour.ClientId %>").value=OT;
		                }    
		            }
		           
		            if(document.getElementById("<%=chk_PT.ClientId %>").checked)
		            {
		                if(PTFormula!='')
		                {
		                    PT=CalculatedValue(PTFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_PT.ClientId %>").value=PT;
		                }    
		            }
		            
		            if(document.getElementById("<%=chk_TDS.ClientId %>").checked)
		            {
		                if(TDSFormula!='')
		                {
		                    TDS=CalculatedValue(TDSFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_TDS.ClientId %>").value=TDS;
		                }    
		            }
		            
		            if(document.getElementById("<%=chk_PF.ClientId %>").checked)
		            {
		                if(EmployeePFFormula!='')
		                {
		                    EmployeePF=CalculatedValue(EmployeePFFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_PF.ClientId %>").value=EmployeePF;
		                    EmployerPF=CalculatedValue(EmployerPFFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_EmployerPFContribution.ClientId %>").value=EmployerPF;
		                 }
		            }       
		            
		            if(document.getElementById("<%=chk_ESIC.ClientId %>").checked)
		            {
		                if(EmployeeESICFormula!='')
		                {
		                    EmployerESIC=CalculatedValue(EmployerESICFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_EmployerESICContribution.ClientId %>").value=EmployerESIC;
		                    EmployeeESIC=CalculatedValue(EmployeeESICFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_ESIC.ClientId %>").value=EmployeeESIC;
		                }
		            }
		            if(document.getElementById("<%=chk_LOP.ClientId %>").checked)
		            {
		                if(LOPFormula!='')
		                {
		                    LOP=CalculatedValue(LOPFormula,Basic,Conveyance,DA,HRA);
		                    document.getElementById("<%=txt_LOP.ClientId %>").value=LOP;
		                }    
		            }    
                }
                
                function CalculatedValue(Component,Basic,Conveyance,DA,HRA)
                {
                    var CalculatedComponent;
		            CalculatedComponent=Component.replace(/B/gi, Basic);
		            CalculatedComponent=CalculatedComponent.replace(/C/gi, Conveyance);
		            CalculatedComponent=CalculatedComponent.replace(/D/gi, DA);
		            CalculatedComponent=CalculatedComponent.replace(/H/gi, HRA);
		            CalculatedComponent=eval(CalculatedComponent);
		            return CalculatedComponent
                }
    </script>
    <script type="text/javascript">
        document.getElementById("ob_drp_EarningTypeContainer").style.zIndex = "99999";
    </script>
</body>
</html>
