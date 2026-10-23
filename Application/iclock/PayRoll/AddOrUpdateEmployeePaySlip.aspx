<%@ page language="VB" autoeventwireup="false" inherits="PayRoll_AddOrUpdateEmployeePaySlip, App_Web_4fhf4tum" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<script type="text/javascript">	
	function OnBeforeDeleteEarnings(record) 
	    {
	        document.getElementById("<%=Hdn_TypeId.ClientID %>").value = record.PayslipEarningId;
	        if(confirm("Are you sure you want to delete? "))
	            return true;
	        else
	            return false;
	    }
	    
	    function OnBeforeDeleteDeduction(record) 
	    {
	        document.getElementById("<%=Hdn_TypeId.ClientID %>").value = record.PayslipDeductionId;
	        if(confirm("Are you sure you want to delete? "))
	            return true;
	        else
	            return false;
	    }
	
	function OnDeleteEarnings(record) 
	{
	    alert(record.Error);
	}
	
	function OnDeleteDeduction(record) 
	{
	    alert(record.Error);
	}
	
	function OnInsertEarnings(record) 
	{
		document.getElementById("<%=Lbl_EarningError.ClientID %>").innerHTML = record.Error;
	}
	
	function OnInsertDeduction(record) 
	{
		document.getElementById("<%=lbl_DeductionError.ClientID %>").innerHTML = record.Error;
	}
	
</script>

<html>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <table class="rowEditTable" cellpadding="1" style="border-top-style: none; border-right-style: none;
                border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Employee Pay Slip</legend>
                            <table width="100%">
                                <tr style="background-color: LightGrey;">
                                    <td width="80%" style="font-family: Sans-Serif; font-size: 11.25px; font-weight: bold;
                                        width: 94px;">
                                        Pay Slip Details
                                    </td>
                                    <td align="right">
                                        Effective Date&nbsp;<asp:DropDownList ID="drp_EffectiveDateMonth" runat="server">
                                        </asp:DropDownList>&nbsp;<asp:DropDownList ID="drp_EffectiveDateYear" runat="server">
                                        </asp:DropDownList>&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr style="background-color: LightSteelBlue;">
                                    <td colspan="2">
                                        <table>
                                            <tr>
                                                <td colspan="2" style="font-weight: bold; width: 450px; font-size: 12px;">
                                                    <asp:Label runat="server" ID="lbl_EmployeeCode"></asp:Label>
                                                </td>
                                                <td align="right" width="90%">
                                                    <asp:CheckBox ID="chk_IsFreezed" Text="Freezed It" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <fieldset>
                                                        <legend>Earnings</legend>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    Basic</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_Basic" onkeyup="CalcuateTotalEarning();" runat="server" onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    HRA</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_HRA" onkeyup="CalcuateTotalEarning();" runat="server" onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    DA</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_DA" onkeyup="CalcuateTotalEarning();" runat="server" onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Conveyance</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_Conveyance" onkeyup="CalcuateTotalEarning();" runat="server"
                                                                        onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    OT Hours</td>
                                                                <td>
                                                                    <asp:DropDownList onchange="calculateTotalOT();CalcuateTotalEarning();" ID="drp_Hour"
                                                                        runat="server" Width="48px">
                                                                    </asp:DropDownList>:<asp:DropDownList ID="drp_Minuts" onchange="calculateTotalOT();CalcuateTotalEarning();"
                                                                        runat="server" Width="49px">
                                                                    </asp:DropDownList>&nbsp;OT Per Hour&nbsp;
                                                                    <asp:TextBox ID="txt_OTPerHour" runat="server" onkeyup="CalcuateTotalEarning();"
                                                                        onchange="calculateTotalOT();"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Total OT</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_totalOT" ReadOnly="true" onkeyup="CalcuateTotalEarning();" runat="server"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <br />
                                                                    <br />
                                                                    <obout:Grid ID="Dg_Earnings" runat="server" AllowFiltering="false" CallbackMode="true"
                                                                        EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                                                                        FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                                                                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteEarningRecord">
                                                                        <ClientSideEvents OnClientInsert="OnInsertEarnings" OnBeforeClientDelete="OnBeforeDeleteEarnings"
                                                                            OnClientDelete="OnDeleteEarnings" />
                                                                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                                                                        <Columns>
                                                                            <obout:Column ID="Column1" DataField="PayslipEarningId" SortOrder="Asc" Visible="False"
                                                                                Width="450" HeaderText="Id" ConvertEmptyStringToNull="False" Index="0" />
                                                                            <obout:Column DataField="EarningType" ReadOnly="True" HeaderText="Earning Type" Width="155" />
                                                                            <obout:Column ID="Column2" DataField="Amount" Width="110" HeaderText="Amount" />
                                                                            <obout:Column ID="Column4" DataField="Remarks" Visible="True" Width="150" HeaderText="Remarks" />
                                                                            <obout:Column ID="Column8" DataField="IsTaxable" Visible="false" Width="195" HeaderText="IsTaxable" />
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
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Total Earning</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_TotalEarning" runat="server" ReadOnly="True" Width="324px"></asp:TextBox></td>
                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <fieldset>
                                                        <legend>Deductions</legend>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    TDS</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_TDS" runat="server" onkeyup="CalcuateTotalDeduction();" onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    ESIC</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_ESIC" onkeyup="CalcuateTotalDeduction();" runat="server" onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    PF</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_PF" onkeyup="CalcuateTotalDeduction();" runat="server" onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox>&nbsp;&nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PT&nbsp;<asp:TextBox ID="txt_PT" onkeyup="CalcuateTotalDeduction();"
                                                                        runat="server" onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Absent Days</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_AbsentDays" runat="server" onkeyup="CalculateTotalLOP();" onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox>&nbsp;LWOP
                                                                    Days&nbsp;<asp:TextBox ID="txt_LWOP" runat="server" onchange="CalculateTotalLOP();"
                                                                        onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    LOP Per day</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_LOPPerday" runat="server" onkeyup="CalculateTotalLOP();" onkeypress="ValidateTextBoxForNumericValue();"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Total LOP</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_TotalLOP" onkeyup="CalcuateTotalDeduction();" ReadOnly="true"
                                                                        runat="server"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <br />
                                                                    <br />
                                                                    <obout:Grid ID="Dg_Deductions" runat="server" AllowFiltering="false" EnableRecordHover="true"
                                                                        KeepSelectedRecords="true" AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                                                                        AllowAddingRecords="true" ShowLoadingMessage="false" OnRebind="RebindGrid" OnInsertCommand="InsertRecord"
                                                                        OnDeleteCommand="DeleteDeductionRecord">
                                                                        <ClientSideEvents OnClientInsert="OnInsertDeduction" OnBeforeClientDelete="OnBeforeDeleteDeduction"
                                                                            OnClientDelete="OnDeleteDeduction" />
                                                                        <TemplateSettings NewRecord_TemplateId="tplAddBtn1" />
                                                                        <Columns>
                                                                            <obout:Column ID="Column3" DataField="PayslipDeductionId" SortOrder="Asc"
                                                                                Visible="False" Width="450" HeaderText="Id" ConvertEmptyStringToNull="False"
                                                                                Index="0" />
                                                                            <obout:Column DataField="DeductionType" ReadOnly="True" HeaderText="Deduction Type"
                                                                                Width="155" />
                                                                            <obout:Column ID="Column5" DataField="Amount" Width="110" HeaderText="Amount" />
                                                                            <obout:Column ID="Column6" DataField="Remarks" Visible="True" Width="195" HeaderText="Remarks" />
                                                                            <obout:Column ID="Column7" DataField="IsTaxable" Visible="false" Width="195" HeaderText="IsTaxable" />
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
                                                            <tr>
                                                                <td>
                                                                    Total Deduction</td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_TotalDeductions" runat="server" ReadOnly="True" Width="373px"></asp:TextBox></td>
                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; height: 26px;" colspan="2">
                                        Net Pay&nbsp;
                                        <asp:TextBox ID="txt_NetPay" ReadOnly="true" runat="server"></asp:TextBox>
                                        &nbsp;<asp:Label ID="lbl_NetSalary" runat="server" Text=""></asp:Label>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label ID="lbl_EmployeeId" runat="server" Text="" Visible="False"></asp:Label>
                        <asp:Label ID="Lbl_InvalidError" ForeColor="red" runat="server" Text=""></asp:Label>
                        <asp:Button ID="btn_ViewPaySlip" runat="server" Text="View Pay Slip" Visible="false" />&nbsp;
                        <asp:Button ID="btn_Update" runat="server" Text="Update" />
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
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
                            <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_EarningError"></asp:Label><input
                                id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeEarningFlyout();" />
                            <asp:HiddenField ID="Hdn_TypeId" runat="server" />
                            <asp:HiddenField ID="Hdn_TypeName" runat="server" />
                            <asp:HiddenField ID="Hdn_DeductionType" runat="server" />
                            <asp:HiddenField ID="Hdn_EarningType" runat="server" />
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
                                            <asp:Label ID="Label2" runat="server" Width="110px" Text="Deduction Type"></asp:Label>
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
                            <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="lbl_DeductionError"></asp:Label><input
                                id="btn_DeductionSave" type="button" value="Save" onclick="javascript:btn_Deduction_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="btn_DeductionClose" type="button" value="Close" onclick="javascript:closeDeductionFlyout();" />
                        </td>
                    </tr>
                </table>
                <asp:HiddenField ID="hdn_TotalDeduction" runat="server" />
            </obout:Flyout>
            
            
            
        </div>
    </form>

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
                document.getElementById("<%=Lbl_EarningError.ClientID %>").innerHTML="";
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
                document.getElementById("<%=Lbl_EarningError.ClientID %>").innerHTML="";
                
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
		    
	    
    </script>

    <script type="text/javascript">
    document.getElementById("ob_drp_EarningTypeContainer").style.zIndex="99999";
    document.getElementById("ob_drp_DeductionTypeContainer").style.zIndex="99999";
    
    </script>

    <%--Calcuate the Values According Value Type in Text Boxes--%>

    <script type="text/javascript">
    
     function CalcuateTotalEarning()
        {
            var TotalEarning=0;
            var basic=document.getElementById("<%=txt_basic.ClientID%>").value;
            if(basic=='')
                basic=0;
                
            var HRA=document.getElementById("<%=txt_HRA.ClientID%>").value;
            if(HRA=='')
                HRA=0;
                
            var DA=document.getElementById("<%=txt_DA.ClientID%>").value;
            if(DA=='')
                DA=0;
                
            var Conveyance=document.getElementById("<%=txt_Conveyance.ClientID%>").value;
            if(Conveyance=='')
                Conveyance=0;
                
            var totalOT=document.getElementById("<%=txt_totalOT.ClientID%>").value;
            if(totalOT=='')
                totalOT=0;
                
            for(var i=0;i<10000;i++)
                {
                        if(Dg_Earnings.Rows[i]==undefined)
                        {
                             break;
                        }
                        else
                        {
                            TotalEarning = TotalEarning + parseFloat(Dg_Earnings.Rows[i].Cells[2].Value);
                        }
                }
             document.getElementById("<%=txt_TotalEarning.ClientID%>").value =   TotalEarning+parseFloat(basic) + parseFloat(HRA) + parseFloat(DA) + parseFloat(Conveyance) + parseFloat(totalOT);
             CalculateNetPay();
        }
    
   
    
    function CalcuateTotalDeduction()
    {
        var TotalDeduction=0;
        var TDS=document.getElementById("<%=txt_TDS.ClientID%>").value;
        if(TDS=='')
                TDS=0;
                
        var ESIC=document.getElementById("<%=txt_ESIC.ClientID%>").value;
        if(ESIC=='')
                ESIC=0;
                
        var PF=document.getElementById("<%=txt_PF.ClientID%>").value;
        if(PF=='')
                PF=0;
                
        var PT=document.getElementById("<%=txt_PT.ClientID%>").value;
        if(PT=='')
                PT=0;
                
        var TotalLOP=document.getElementById("<%=txt_TotalLOP.ClientID%>").value;
        if(TotalLOP=='')
                TotalLOP=0;
                
        
        for(var i=0;i<20000;i++)
            {
                     if(Dg_Deductions.Rows[i]==undefined)
                        {
                             break;
                        }
                      else
                        {
                           TotalDeduction = TotalDeduction + parseFloat(Dg_Deductions.Rows[i].Cells[2].Value);
                        }  
            }
                             document.getElementById("<%=hdn_TotalDeduction.ClientID%>").value=TotalDeduction+parseFloat(TDS) + parseFloat(ESIC) + parseFloat(PF) + parseFloat(PT) + parseFloat(TotalLOP);
                   document.getElementById("<%=txt_TotalDeductions.ClientID%>").value =   TotalDeduction+parseFloat(TDS) + parseFloat(ESIC) + parseFloat(PF) + parseFloat(PT) + parseFloat(TotalLOP);
                   CalculateNetPay();
    }
    
    function CalculateNetPay()
    {
        var TotalDeductions=document.getElementById("<%=txt_TotalDeductions.ClientID%>").value; 
        var TotalEarning=document.getElementById("<%=txt_TotalEarning.ClientID%>").value; 
         if(TotalDeductions=='')
            {
                TotalDeductions=0;
            }
            
          else
            {
                TotalDeductions=parseFloat(TotalDeductions);
            }  
                    
         if(TotalEarning=='')
             {
                TotalEarning=0;
             }
             
          else
            {
                TotalEarning=parseFloat(TotalEarning);
            }   
            
        var Netpay=TotalEarning-TotalDeductions
        document.getElementById("<%=txt_NetPay.ClientID%>").value = Netpay
        document.getElementById("<%=txt_TotalDeductions.ClientID%>").value = TotalDeductions
    }
    
    function ValidateTextBoxForNumericValue()
    {
        if(!(event.keyCode==45||event.keyCode==46||event.keyCode==48||event.keyCode==49||event.keyCode==50||event.keyCode==51||event.keyCode==52||event.keyCode==53||event.keyCode==54||event.keyCode==55||event.keyCode==56||event.keyCode==57))
        		{			
        		    event.returnValue=false;		
        		}
    }
    
    function calculateTotalOT()
    {
        var HourValue=parseInt(document.getElementById("<%=drp_Hour.ClientID%>").value);
         if(document.getElementById("<%=drp_Hour.ClientID%>").value=='08')
            HourValue=8;
         else if(document.getElementById("<%=drp_Hour.ClientID%>").value=='09')
            HourValue=9;
		            
        var MinutsValue=document.getElementById("<%=drp_Minuts.ClientID%>").value;
        if(document.getElementById("<%=drp_Minuts.ClientID%>").value=='08')
            MinutsValue=8;
         else if(document.getElementById("<%=drp_Minuts.ClientID%>").value=='09')
            MinutsValue=9;
        var OtperHour=document.getElementById("<%=txt_OtperHour.ClientID%>").value;
        if(OtperHour=='')
                OtperHour=0;
                
        document.getElementById("<%=txt_totalOT.ClientID%>").value=(parseInt(HourValue)*parseFloat(OtperHour))+(parseInt(MinutsValue)*(parseFloat(OtperHour)/60));
        CalcuateTotalEarning();
    }
    
     function CalculateTotalLOP()
        {
            var absentdays=document.getElementById("<%=txt_absentdays.ClientID%>").value;
            if(absentdays=='')
                    absentdays=0;
                    
            var LopPerDay=document.getElementById("<%=txt_LopPerDay.ClientID%>").value;
            if(LopPerDay=='')
                    LopPerDay=0;
                    
            var LWOP=document.getElementById("<%=txt_LWOP.ClientID%>").value;
            if(LWOP=='')
                    LWOP=0;
                    
            document.getElementById("<%=txt_TotalLOP.ClientID%>").value=(parseFloat(absentdays) + parseFloat(LWOP)) * parseFloat(LopPerDay);
            CalcuateTotalDeduction();
        }
    
    </script>

</body>
</html>
