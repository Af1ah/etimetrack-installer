<%@ page language="VB" autoeventwireup="false" inherits="PayRoll_PayRollFormulaSettings, App_Web_4fhf4tum" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body background="../Images/bck1.gif" onload="drp_OnChange();" style="background-repeat: no-repeat; background-position-x: right;
    background-position-y: top;">
    <form id="form1" runat="server">
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <owd:Window ID="wnd_PayRollFormula" runat="server" Height="480" StyleFolder="~/Styles/mainwindow/blue"
                Title="Payroll Settings" Width="720" IsResizable="true" ShowStatusBar="false"
                Left="350" Top="75">
                <table width="100%" height="100%" cellpadding="1" cellspacing="0" class="Table" style="border-top-style: none;
                    border-right-style: none; border-left-style: none; border-bottom-style: none;">
                    <tr>
                        <td>
                            <fieldset>
                                <legend></legend>
                                <table>
                                    <tr>
                                        <td>
                                            <fieldset>
                                                <legend>HRA Settings</legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drp_HRA" runat="server" onchange="drp_OnChange();" >
                                                                <asp:ListItem>Manual</asp:ListItem>
                                                                <asp:ListItem>Formula</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                        <td>
                                                            <asp:TextBox ID="txt_HRA" runat="server" ReadOnly="True"></asp:TextBox></td>
                                                        <td>
                                                            <asp:Button ID="btn_HRA" runat="server" ToolTip="HRA" Text="...." OnClientClick="return OpenFormulaWindow();" /></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                </table>
                                            </fieldset>
                                        </td>
                                        <td rowspan="2">
                                            <fieldset>
                                                <legend>PF Settings</legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drp_PF" runat="server" onchange="drp_OnChange();" >
                                                                <asp:ListItem>Manual</asp:ListItem>
                                                                <asp:ListItem>Formula</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Employee Contribution&nbsp;<asp:TextBox ID="txt_EmployeePF" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;<asp:Button
                                                                ID="BTN_EmployeePF" ToolTip="EmployeePF"  runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Employer Contribution&nbsp;<asp:TextBox ID="txt_EmployerPF" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;<asp:Button
                                                                ID="BTN_EmployerPF" ToolTip="EmployerPF"  runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset>
                                                <legend>Conveyance Settings</legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drp_Conveyance" runat="server" onchange="drp_OnChange();" >
                                                                <asp:ListItem>Manual</asp:ListItem>
                                                                <asp:ListItem>Formula</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                        <td>
                                                            <asp:TextBox ID="txt_Conveyance" runat="server" ReadOnly="True"></asp:TextBox></td>
                                                        <td>
                                                            <asp:Button ID="btn_Conveyance" ToolTip="Conveyance"   runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" /></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset>
                                                <legend>DA Settings</legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drp_DA" runat="server" onchange="drp_OnChange();" >
                                                                <asp:ListItem>Manual</asp:ListItem>
                                                                <asp:ListItem>Formula</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                        <td>
                                                            <asp:TextBox ID="txt_DA" runat="server" ReadOnly="True"></asp:TextBox></td>
                                                        <td>
                                                            <asp:Button ID="btn_DA" ToolTip="DA"   runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" /></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                </table>
                                            </fieldset>
                                        </td>
                                        <td rowspan="2">
                                            <fieldset>
                                                <legend>ESIC Settings</legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drp_ESIC" runat="server" onchange="drp_OnChange();" >
                                                                <asp:ListItem>Manual</asp:ListItem>
                                                                <asp:ListItem>Formula</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Employee Contribution&nbsp;<asp:TextBox ID="txt_EmployeeESIC" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;<asp:Button
                                                                ID="btn_EmployeeESIC" ToolTip="EmployeeESIC"   runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Employer Contribution&nbsp;<asp:TextBox ID="txt_EmployerESIC" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;<asp:Button
                                                                ID="btn_EmployerESIC" ToolTip="EmployerESIC"   runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset>
                                                <legend>OT Per Hour Settings</legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drp_OtPerHour" runat="server" onchange="drp_OnChange();" >
                                                                <asp:ListItem>Manual</asp:ListItem>
                                                                <asp:ListItem>Formula</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                        <td>
                                                            <asp:TextBox ID="txt_OtPerHour"   runat="server" ReadOnly="True"></asp:TextBox></td>
                                                        <td>
                                                            <asp:Button ID="btn_OtPerHour" ToolTip="OtPerHour"  runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" /></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset>
                                                <legend>PT Settings</legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drp_PT" runat="server" onchange="drp_OnChange();" >
                                                                <asp:ListItem>Manual</asp:ListItem>
                                                                <asp:ListItem>Formula</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                        <td>
                                                            <asp:TextBox ID="txt_PT" runat="server" ReadOnly="True"></asp:TextBox></td>
                                                        <td>
                                                            <asp:Button ID="btn_PT" ToolTip="PT"  runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" /></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                </table>
                                            </fieldset>
                                        </td>
                                        <td>
                                            <fieldset>
                                                <legend>LOP Per Day Settings</legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drp_LOPPerDay" runat="server" onchange="drp_OnChange();" >
                                                                <asp:ListItem>Manual</asp:ListItem>
                                                                <asp:ListItem>Formula</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                        <td>
                                                            <asp:TextBox ID="txt_LOPPerDay" runat="server" ReadOnly="True"></asp:TextBox></td>
                                                        <td>
                                                            <asp:Button ID="btn_LOPPerDay" ToolTip="LOPPerDay"  runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" /></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <fieldset>
                                                <legend>TDS Settings</legend>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="drp_TDS" runat="server" onchange="drp_OnChange();" >
                                                                <asp:ListItem>Manual</asp:ListItem>
                                                                <asp:ListItem>Formula</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                        <td>
                                                            <asp:TextBox ID="txt_TDS" runat="server" ReadOnly="True"></asp:TextBox></td>
                                                        <td>
                                                            <asp:Button ID="btn_TDS" ToolTip="TDS"  runat="server" Text="...." OnClientClick="return OpenFormulaWindow();" /></td>
                                                    </tr>
                                                </table>
                                                <table>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btn_OK" runat="server" Text="Save" OnClientClick="loadFormulaValues();" />&nbsp;<input id="btn_Cancel"
                                type="button" value="Close" onclick="wnd_PayRollFormula.Close();" />
                        </td>
                    </tr>
                     <tr>
                        <td >
                            <asp:Label ID="lbl_PayrollError" runat="server" Text="" EnableViewState="false"></asp:Label>
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
                
            </owd:Window>
            
            
            <owd:Window ID="wnd_FormulaBuilder" runat="server" Height="290" StyleFolder="~/Styles/mainwindow/blue"
                VisibleOnLoad="false" IsModal="True" Title="Formula Builder" Width="520" IsResizable="true"
                ShowStatusBar="false" Left="350" Top="155">
                <table width="100%" height="100%" cellpadding="1" cellspacing="0" class="Table" style="border-top-style: none;
                    border-right-style: none; border-left-style: none; border-bottom-style: none;">
                    <tr>
                        <td colspan="2">
                            <fieldset>
                                <legend id="legend_FormulaBuilder">Formula Builder</legend>
                                <table>
                                    <tr>
                                        <td colspan="3">
                                            <asp:TextBox ID="txt_FormulaBuilder" runat="server" ReadOnly="true" TextMode="MultiLine" Width="450px"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="right">
                                            <input id="btn_BackSpace" type="button" value="Backspace" onclick="btn_BackSpace_Click();" />&nbsp;
                                            <input id="btn_ClearAll" type="button" value="Clear All" onclick="btn_ClearAll_Click();" />&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <fieldset>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <input id="btn_FormulaBasic" type="button" value="Basic" onclick="Btn_OnClick(this);"
                                                                            style="width: 108px;" /><br />
                                                                        <input id="btn_FormulaHRA" type="button" value="HRA" onclick="Btn_OnClick(this);"
                                                                            style="width: 108px;" /><br />
                                                                        <input id="btn_FormulaDA" type="button" value="DA" onclick="Btn_OnClick(this);" style="width: 108px;" /><br />
                                                                        <input id="btn_FormulaConveyance" type="button" value="Conveyance" onclick="Btn_OnClick(this);"
                                                                            style="width: 108px;" />
                                                                    </td>
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
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <input id="btn_7" type="button" onclick="Btn_OnClick(this);" value="7" style="width: 30px"
                                                                            size="" />&nbsp;<input id="btn_8" type="button" onclick="Btn_OnClick(this);" value="8"
                                                                                style="width: 30px" />&nbsp;<input id="btn_9" type="button" onclick="Btn_OnClick(this);"
                                                                                    value="9" style="width: 30px" />&nbsp;<br />
                                                                        <input id="btn_4" type="button" onclick="Btn_OnClick(this);" value="4" style="width: 30px" />&nbsp;<input
                                                                            id="btn_5" type="button" value="5" onclick="Btn_OnClick(this);" style="width: 30px" />&nbsp;<input
                                                                                id="btn_6" type="button" value="6" onclick="Btn_OnClick(this);" style="width: 30px" />&nbsp;<br />
                                                                        <input id="btn_1" type="button" onclick="Btn_OnClick(this);" value="1" style="width: 30px" />&nbsp;<input
                                                                            id="btn_2" type="button" value="2" onclick="Btn_OnClick(this);" style="width: 30px" />&nbsp;<input
                                                                                id="btn_3" type="button" value="3" onclick="Btn_OnClick(this);" style="width: 30px" />&nbsp;<br />
                                                                        <input id="btn_0" type="button" onclick="Btn_OnClick(this);" value="0" style="width: 30px" />&nbsp;<input
                                                                            id="btn_Point" type="button" value="." onclick="Btn_OnClick(this);" style="width: 30px" />&nbsp;
                                                                    </td>
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
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <input id="btn_Plus" type="button" onclick="Btn_OnClick(this);" value="+" style="width: 29px" />&nbsp;<input
                                                                            id="btn_SmallBraces" type="button" onclick="Btn_OnClick(this);" value="(" style="width: 29px" />&nbsp;<input
                                                                                id="btn_SmallBraces2" type="button" value=")" onclick="Btn_OnClick(this);" style="width: 29px" />&nbsp;&nbsp;
                                                                        <input id="btn_Sqrt" type="button" onclick="Btn_OnClick(this);" disabled="disabled"  value="Sqrt" style="width: 40px" />&nbsp;<br />
                                                                        <input id="btn_Minus" type="button" onclick="Btn_OnClick(this);" value="-" style="width: 31px" />&nbsp;<input
                                                                            id="btn_BigBraces" onclick="Btn_OnClick(this);" disabled="disabled"  type="button" value="[" style="width: 29px" />&nbsp;<input
                                                                                id="btn_BigBraces2" disabled="disabled"  onclick="Btn_OnClick(this);" type="button" value="]" style="width: 29px" />&nbsp;&nbsp;
                                                                        <input id="btn_Sin" disabled="disabled"  type="button" onclick="Btn_OnClick(this);" value="Sin" style="width: 40px" />&nbsp;<br />
                                                                        <input id="btn_Mult" onclick="Btn_OnClick(this);" type="button" value="*" style="width: 30px" />&nbsp;<input
                                                                            onclick="Btn_OnClick(this);" id="btn_CurlyBraces" type="button" disabled="disabled"  value="{" style="width: 29px" />&nbsp;<input
                                                                                onclick="Btn_OnClick(this);" id="btn_CurlyBraces2" disabled="disabled"  type="button" value="}" style="width: 29px" />&nbsp;&nbsp;
                                                                        <input onclick="Btn_OnClick(this);" disabled="disabled"  id="btn_Cos" onclick="Btn_OnClick(this);" type="button"
                                                                            value="Cos" style="width: 40px" />&nbsp;<br />
                                                                        <input id="btn_Devide" onclick="Btn_OnClick(this);" type="button" value="/" style="width: 30px" />&nbsp;<input
                                                                            onclick="Btn_OnClick(this);" id="btn_Percentage" type="button" value="%" style="width: 29px" />&nbsp;<input
                                                                                onclick="Btn_OnClick(this);" id="btn_Square" type="button" value="^" style="width: 29px" />&nbsp;&nbsp;
                                                                        <input onclick="Btn_OnClick(this);" disabled="disabled" id="btn_Fact" onclick="Btn_OnClick(this);" type="button"
                                                                            value="!" style="width: 40px" />&nbsp;<br />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                         <input id="btnVerifyFormula" type="button" value="Verify Formula" onclick="btn_VerifyFormula_Click()"  />
                        </td>
                        <td align="right">
                        <input id="btn_FormulaOK" type="button" value="OK" onclick="btn_FormulaOK_Click()"  />
                            &nbsp;<input id="btn_FormulaClose"
                                type="button" value="Close" onclick="wnd_FormulaBuilder.Close();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    
                    <tr>
                    <td colspan="2">
                        &nbsp;<asp:Label ID="lbl_FormulaBuilderError" runat="server" Text="" EnableViewState="false"></asp:Label>
                    </td>
                    </tr>
                </table>
            </owd:Window>
        </div>
    </form>

    <script type="text/javascript">
    var myArray=new Array();
            function btn_ClearAll_Click()
            {
                document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value='';
                myArray=new Array();
            }
    
		    function Btn_OnClick(objButton)
		    {
		        var FormulaValue=document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value;
		        myArray.push(objButton.value);
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value+objButton.value;
		    }
		    
		    function btn_BackSpace_Click()
		    {
		      var ItemIndex=document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value.lastIndexOf(myArray[myArray.length-1])
		      myArray.pop();
		      document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value.substr(0,ItemIndex)
		    }
		    
		    function drp_OnChange()
		    {
		        if(document.getElementById("<%=drp_HRA.ClientId %>").value=='Manual')
		        {
		            document.getElementById("<%=btn_HRA.ClientId %>").disabled=true;
		        }
		        if(document.getElementById("<%=drp_HRA.ClientId %>").value=='Formula')
		        {
		            document.getElementById("<%=btn_HRA.ClientId %>").disabled=false;
		        }
		        
		        if(document.getElementById("<%=drp_Conveyance.ClientId %>").value=='Manual')
		        {
		            document.getElementById("<%=btn_Conveyance.ClientId %>").disabled=true;
		        }
		        if(document.getElementById("<%=drp_Conveyance.ClientId %>").value=='Formula')
		        {
		            document.getElementById("<%=btn_Conveyance.ClientId %>").disabled=false;
		        }
		        
		        
		        if(document.getElementById("<%=drp_DA.ClientId %>").value=='Manual')
		        {
		            document.getElementById("<%=btn_DA.ClientId %>").disabled=true;
		        }
		        if(document.getElementById("<%=drp_DA.ClientId %>").value=='Formula')
		        {
		            document.getElementById("<%=btn_DA.ClientId %>").disabled=false;
		        }
		        
		        if(document.getElementById("<%=drp_PT.ClientId %>").value=='Manual')
		        {
		            document.getElementById("<%=btn_PT.ClientId %>").disabled=true;
		        }
		        if(document.getElementById("<%=drp_PT.ClientId %>").value=='Formula')
		        {
		            document.getElementById("<%=btn_PT.ClientId %>").disabled=false;
		        }
		        
		         if(document.getElementById("<%=drp_TDS.ClientId %>").value=='Manual')
		        {
		            document.getElementById("<%=btn_TDS.ClientId %>").disabled=true;
		        }
		        if(document.getElementById("<%=drp_TDS.ClientId %>").value=='Formula')
		        {
		            document.getElementById("<%=btn_TDS.ClientId %>").disabled=false;
		        }
		        
		        
		         if(document.getElementById("<%=drp_HRA.ClientId %>").value=='Manual')
		        {
		            document.getElementById("<%=btn_HRA.ClientId %>").disabled=true;
		        }
		        if(document.getElementById("<%=drp_HRA.ClientId %>").value=='Formula')
		        {
		            document.getElementById("<%=btn_HRA.ClientId %>").disabled=false;
		        }
		        
		        if(document.getElementById("<%=drp_PF.ClientId %>").value=='Manual')
		        {
		           document.getElementById("<%=BTN_EmployeePF.ClientId %>").disabled=true;
		           document.getElementById("<%=BTN_EmployerPF.ClientId %>").disabled=true;
		        }
		        
		        if(document.getElementById("<%=drp_PF.ClientId %>").value=='Formula')
		        {
		            document.getElementById("<%=BTN_EmployeePF.ClientId %>").disabled=false;
		            document.getElementById("<%=BTN_EmployerPF.ClientId %>").disabled=false;
		        }
		        
		        
		        if(document.getElementById("<%=drp_ESIC.ClientId %>").value=='Manual')
		        {
		            document.getElementById("<%=BTN_EmployeeESIC.ClientId %>").disabled=true;
		                    document.getElementById("<%=BTN_EmployerESIC.ClientId %>").disabled=true;
		        }
		        
		        if(document.getElementById("<%=drp_ESIC.ClientId %>").value=='Formula')
		        {
		             document.getElementById("<%=BTN_EmployeeESIC.ClientId %>").disabled=false;
		                    document.getElementById("<%=BTN_EmployerESIC.ClientId %>").disabled=false;
		        }
		        
		        
		        if(document.getElementById("<%=drp_OtPerHour.ClientId %>").value=='Manual')
		        {
		            document.getElementById("<%=btn_OtPerHour.ClientId %>").disabled=true;
		        }
		        if(document.getElementById("<%=drp_OtPerHour.ClientId %>").value=='Formula')
		        {
		            document.getElementById("<%=btn_OtPerHour.ClientId %>").disabled=false;
		        }
		        
		        if(document.getElementById("<%=drp_LOPPerDay.ClientId %>").value=='Manual')
		        {
		            document.getElementById("<%=btn_LOPPerDay.ClientId %>").disabled=true;
		        }
		        if(document.getElementById("<%=drp_LOPPerDay.ClientId %>").value=='Formula')
		        {
		            document.getElementById("<%=btn_LOPPerDay.ClientId %>").disabled=false;
		        }
		    }
		    
		    function btn_FormulaOK_Click()
		    {
                  if(VerifyFormula())
                  {
                       var txtId='wnd_PayRollFormula_txt_'+document.getElementById("legend_FormulaBuilder").innerHTML.replace(" Formula Builder","");
		               wnd_FormulaBuilder.Close();
		               document.getElementById(txtId).value=document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value;
		           }
		    }
		    
		    function btn_VerifyFormula_Click()
		    {
		       if(VerifyFormula())
                {
		            alert('Formula verified successfully.');
		        }
		    }
		    
		   
		    
		    function VerifyFormula()
		    {
		        var FormulaValue=document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value;
		        FormulaValue=FormulaValue.replace(/Basic/gi, "100");
		        FormulaValue=FormulaValue.replace(/HRA/gi, "100");
		        FormulaValue=FormulaValue.replace(/DA/gi, "100");
		        FormulaValue=FormulaValue.replace(/PT/gi, "100");
		        FormulaValue=FormulaValue.replace(/Conveyance/gi, "100");
		        FormulaValue=FormulaValue.replace(/Sqrt /gi, "Math.sqrt");
		        
		         try
		          {
		               eval(FormulaValue);
		               return true;
                  }
                catch(err)
                  {
                  alert(err);
                      //alert('Please enter valid formula.');
                      return false ;
                  }
		    }
		    
		  

		    function loadFormulaValues()
		    {
		        document.getElementById("<%=hdn_HRA.ClientId %>").value=document.getElementById("<%=txt_HRA.ClientId %>").value
		        document.getElementById("<%=hdn_Conveyance.ClientId %>").value=document.getElementById("<%=txt_Conveyance.ClientId %>").value
		        document.getElementById("<%=hdn_DA.ClientId %>").value=document.getElementById("<%=txt_DA.ClientId %>").value
		        document.getElementById("<%=hdn_OT.ClientId %>").value=document.getElementById("<%=txt_OtPerHour.ClientId %>").value
		        document.getElementById("<%=hdn_PT.ClientId %>").value=document.getElementById("<%=txt_PT.ClientId %>").value
		        document.getElementById("<%=hdn_TDS.ClientId %>").value=document.getElementById("<%=txt_TDS.ClientId %>").value
		        document.getElementById("<%=hdn_EmployeePF.ClientId %>").value=document.getElementById("<%=txt_EmployeePF.ClientId %>").value
		        document.getElementById("<%=hdn_EmployerPF.ClientId %>").value=document.getElementById("<%=txt_EmployerPF.ClientId %>").value
		        document.getElementById("<%=hdn_EmployeeESIC.ClientId %>").value=document.getElementById("<%=txt_EmployeeESIC.ClientId %>").value
		        document.getElementById("<%=hdn_EmployerESIC.ClientId %>").value=document.getElementById("<%=txt_EmployerESIC.ClientId %>").value
		        document.getElementById("<%=hdn_LOP.ClientId %>").value=document.getElementById("<%=txt_LOPPerDay.ClientId %>").value
		    }
		    
		    function OpenFormulaWindow()
		    {
		        document.getElementById("legend_FormulaBuilder").innerHTML=window.event.srcElement.title +' '+ document.getElementById("h_wnd_FormulaBuilder_title").value
		        var SrcElement=window.event.srcElement.title;
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value="";
		        
		        if(SrcElement=='HRA')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_HRA.ClientId %>").value;
		        
		        else if(SrcElement=='Conveyance')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_Conveyance.ClientId %>").value;
		        
		        else if(SrcElement=='DA ')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_DA.ClientId %>").value;
		        
		        else if(SrcElement=='OtPerHour')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_OtPerHour.ClientId %>").value;
		        
		        else if(SrcElement=='PT')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_PT.ClientId %>").value;
		        
		        else if(SrcElement=='TDS')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_TDS.ClientId %>").value;
		        
		        else if(SrcElement=='EmployeePF')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_EmployeePF.ClientId %>").value;
		        
		        else if(SrcElement=='EmployerPF')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_EmployerPF.ClientId %>").value;
		        
		        else if(SrcElement=='EmployeeESIC')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_EmployeeESIC.ClientId %>").value;
		        
		        else if(SrcElement=='EmployerESIC')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_EmployerESIC.ClientId %>").value;
		        
		        else if(SrcElement=='LOPPerDay')
		        document.getElementById("<%=txt_FormulaBuilder.ClientId %>").value=document.getElementById("<%=txt_LOPPerDay.ClientId %>").value;
		        
		        
		        document.getElementById('wnd_FormulaBuilder_container').style.zIndex = 1000000000;
                document.getElementById('wnd_FormulaBuilder_container').style.position='absolute';
		        wnd_FormulaBuilder.Open();
		        return false;
		    }
    </script>

</body>
</html>
