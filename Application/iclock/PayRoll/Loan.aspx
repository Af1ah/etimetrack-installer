<%@ page language="VB" autoeventwireup="false" inherits="PayRoll_Loan, App_Web_4fhf4tum" enableeventvalidation="false" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<script type="text/javascript">	
	function OnBeforeDelete(record) 
	    {
		    document.getElementById("<%=Hdn_LoanId.ClientID %>").value = record.LoanId;
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
                <tr style="background-color: lightsteelblue;  color: white;">
                    <td style="padding:5px;">
                        Employees Loan Details
                    </td>
                </tr>
                
                <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                <tr>
                    <td>
                        <obout:Grid ID="Dg_Loan" runat="server"  AutoGenerateColumns="false"
                            FolderStyle="~/styles/grid/styles/premiere_blue" 
                            AllowAddingRecords="true" PageSize="10" AllowMultiRecordSelection="false" GenerateRecordIds="true"
                            AllowFiltering="true" OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column ID="Column0" Align="left" DataField="LoanId" Visible="false" Width="100"
                                    HeaderText="LoanId" runat="server" />
                                <obout:Column ID="Column1" DataField="LoanDate"  DataFormatString="{0:dd-MMM-yyyy}"   Visible="true" Width="95" HeaderText="Loan Date"
                                    runat="server" />
                                <obout:Column ID="Column2" DataField="EmployeeCode" Visible="true" Width="95" HeaderText="Emp Code"
                                    runat="server" />
                                <obout:Column ID="Column3" DataField="EmployeeName" Visible="true" Width="95" HeaderText="Emp Name"
                                    runat="server" />
                                <obout:Column ID="Column4" DataField="CompanySName" Visible="true" Width="95" HeaderText="Company"
                                    runat="server" />
                                <obout:Column ID="Column5" DataField="DepartmentSName" Visible="true" Width="100"
                                    HeaderText="Department" runat="server" />
                                <obout:Column ID="Column6" DataField="LoanAmount" Visible="true" Width="105" HeaderText="Loan Amount"
                                    runat="server" />
                                <obout:Column ID="Column7" DataField="InterestRate" Visible="true" Width="105" HeaderText="Interest Rate"
                                    runat="server" />
                                <obout:Column ID="Column8" DataField="TotalAmount" Visible="true" Width="110" HeaderText="Total Amount"
                                    runat="server" />
                                <obout:Column ID="Column9" DataField="LoanType" Visible="false" Width="110" HeaderText="LoanType"
                                    runat="server" />
                                <obout:Column ID="Column10" DataField="Remarks" Visible="false" Width="120" HeaderText="Remarks"
                                    runat="server" />
                                <obout:Column ID="Column11" DataField="EmployeeId" Visible="false" Width="120" HeaderText="EmployeeId"
                                    runat="server" />
                                <obout:Column ID="Column12" DataField="LoanRepaymentCount" Visible="false" Width="120" HeaderText="LoanRepaymentCount"
                                    runat="server" />
                                <obout:Column ID="Column13" DataField="IsSalaryAdvance" Visible="false" Width="120"
                                    HeaderText="IsSalaryAdvance" runat="server" />
                                <obout:Column ID="Column14" DataField="BalanceAmount" Visible="true" Width="120"
                                    HeaderText="Balance Amount" runat="server" />
                                <obout:Column ID="Column15" Visible="false" Width="120" runat="server">
                                    <TemplateSettings TemplateId="TP_LoanDateFormat" />
                                </obout:Column>
                                <obout:Column HeaderText="Loan Repayment" Width="120" AllowEdit="true" AllowDelete="true">
                                    <TemplateSettings TemplateId="tplLoanRepaymentBtn" />
                                </obout:Column>
                                
                                <obout:Column HeaderText="Edit" Width="50" AllowEdit="true" AllowDelete="true">
                                    <TemplateSettings TemplateId="tplEditBtn" />
                                </obout:Column>
                                <obout:Column HeaderText="Delete" Width="55" AllowEdit="false" AllowDelete="true"
                                    Visible="true" />
                            </Columns>
                            <Templates>
                                <obout:GridTemplate runat="server" ID="tplEditBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                            class="ob_gAL">Edit</a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplAddBtn">
                                    <Template>
                                        <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add');" class="ob_gAL">
                                            Add</a>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplLoanRepaymentBtn">
                                    <Template>
                                        <asp:HyperLink runat="server" CssClass="ob_gAL" Text="Loan Repayment" NavigateUrl='<%# "~/PayRoll/LoanRepayment.aspx?LoanId=" + GetDataItemValue("LoanId", Container)+"&EmployeeCode="+GetDataItemValue("EmployeeCode", Container)+"&EmployeeName="+GetDataItemValue("EmployeeName", Container)%>'
                                            ID="AA1" />
                                    </Template>
                                </obout:GridTemplate>
                                
                                <obout:GridTemplate runat="server" ID="TP_LoanDateFormat">
			                            <Template>
			                            <%#ParseDateTime(Container.DataItem.Item("LoanDate"))%>
			                            </Template>
			                    </obout:GridTemplate>
			                    
                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
            <obout:Flyout runat="server" ID="Flyout_Loan" Align="left" Position="BOTTOM_LEFT"
                CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Loan Details</legend>
                                <table>
                                    <tr>
                                        <td align="right" style="font-weight: bold;">
                                            Employee Code
                                        </td>
                                        <td>
                                            <obout:Combobox Validate="false" ID="drp_EmployeeCode" CssClass="WebControls" runat="server"
                                                Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                            </obout:Combobox>
                                        </td>
                                        <td align="right" style="font-weight: bold;">
                                            Loan Date
                                        </td>
                                        <td>
                                            <select id="drp_DOLday" class="WebControls" runat="server" width="46px">
                                            </select>
                                            &nbsp;&nbsp;<select id="drp_DOLmonth" class="WebControls" runat="server" enableviewstate="true"
                                                width="48px">
                                            </select>&nbsp;&nbsp;<select id="drp_DOLYear" class="WebControls" runat="server"
                                                enableviewstate="true" width="69px">
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;">
                                            Loan Type</td>
                                        <td>
                                            <obout:Combobox Validate="false" ID="drp_LoanType" CssClass="WebControls" runat="server"
                                                Width="175" FolderStyle="~/styles/default" SelectedIndex="0">
                                            </obout:Combobox>
                                        </td>
                                        <td align="right" style="font-weight: bold;">
                                            Loan Amount</td>
                                        <td>
                                            <asp:TextBox ID="txt_LoanAmount" onkeyup="CalcuateTotalAmount();"    onkeypress= "ValidateTextBoxForNumericValue();"  runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                    <td></td>
                                     <td style="font-weight: bold;" colspan="3">
                                         <asp:CheckBox ID="chk_IsSalaryAdvance" Text="Is Salary Advance" onclick="chk_IsSalaryAdvance_onclick()" runat="server" />
                                    </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;">
                                            Interest Rate</td>
                                        <td>
                                            <asp:TextBox ID="txt_InterestRate" onkeyup="CalcuateTotalAmount();"   onkeypress= "ValidateTextBoxForNumericValue();"  runat="server"></asp:TextBox>&nbsp;(% p.a.)
                                        </td>
                                        <td align="right" style="font-weight: bold;">
                                            Principal Amount</td>
                                        <td>
                                            <asp:TextBox ID="txt_TotalAmount" ReadOnly="true" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Remarks
                                        </td>
                                        <td colspan="3" align="left">
                                            <asp:TextBox ID="txt_Remarks" TextMode="MultiLine" Width="99%" Height="100px" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:HyperLink ID="lnk_AutoRepayment" style="cursor:Hand;" onclick="lnkAutoRepayment_Click();" runat="server">Auto Repayment</asp:HyperLink><asp:Label Width="350px"
                                runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                            <asp:HiddenField ID="Hdn_AddedLoanId" runat="server" />
                            <asp:HiddenField ID="Hdn_LoanId" runat="server" />
                            <input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;<input
                                id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        </td>
                    </tr>
                </table>
            </obout:Flyout>
            
            <owd:Window ID="wnd_AutoRepayment" runat="server" Height="159" StyleFolder="~/Styles/mainwindow/blue"
                Title="Auto Repayment" Width="375" IsResizable="true" ShowStatusBar="false" VisibleOnLoad="false"
                Left="350" Top="155">
                <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                    border-right-style: none; border-left-style: none; border-bottom-style: solid;">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Auto Repayment</legend>
                                <table>
                                    <tr>
                                        <td style="font-weight: bold;">
                                            Begin Month</td>
                                        <td>
                                            <asp:DropDownList ID="drp_BeginMonth" runat="server">
                                            </asp:DropDownList></td>
                                        <td style="font-weight: bold;">
                                            Begin Year</td>
                                        <td>
                                            <asp:DropDownList ID="drp_BeginYear" runat="server">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold;">
                                            End Month</td>
                                        <td>
                                            <asp:DropDownList ID="drp_EndMonth" runat="server">
                                            </asp:DropDownList></td>
                                        <td style="font-weight: bold;">
                                            End Year</td>
                                        <td>
                                            <asp:DropDownList ID="drp_EndYear" runat="server">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold;">
                                            Principal Amount</td>
                                        <td colspan="3">
                                        <asp:TextBox  ID="txt_TotalRepaymentAmount" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label runat="server" ForeColor="Red" EnableViewState="False" ID="lbl_RepaymentError"></asp:Label>&nbsp;&nbsp;
                            <asp:Button ID="btn_AddAutoRepayment" OnClientClick="" runat="server" Text="Add" CssClass="WebControls" />&nbsp;<input
                                id="Button1" type="button" value="Close" class="WebControls" onclick="wnd_AutoRepayment.Close();" /></td>
                    </tr>
                </table>
            </owd:Window>
        </div>
    </form>

    <script runat="server">
        
        Function GetDataItemValue(ByVal fieldname As String, ByVal Container As Obout.Grid.TemplateContainer) As String
            If Container.DataItem(fieldname) Is Nothing Then
                Return Container.DataItem(fieldname.ToUpper)
            End If
            Return Container.DataItem(fieldname)
        End Function
        
         Function ParseDateTime(ByVal DateValue As Date) As String
            Return DateValue.ToString("yyyy-MM-dd")
        End Function
        
        
    </script>

    <script type="text/javascript">
		    
		    function attachFlyoutToLink(oLink,Action)
		     {	
		       <%=Flyout_Loan.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_Loan.getClientID()%>.Open();
		        clearFlyout();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
		    }
		    
		    function lnkAutoRepayment_Click()
		    {
		        document.getElementById('<%=txt_TotalRepaymentAmount.ClientID%>').value=document.getElementById('<%=txt_TotalAmount.ClientID%>').value;
		        wnd_AutoRepayment.Open();
		    }
		    
		function closeFlyout() 
		    {
		        <%=Flyout_Loan.getClientID()%>.Close();
		    }
		    
		 function chk_IsSalaryAdvance_onclick() 
		    {
              var objCheckBox=document.getElementById("<%=chk_IsSalaryAdvance.ClientID%>");
		        if(objCheckBox.checked)
		            {
		                document.getElementById("ob_drp_LoanTypeTextbox").value="Salary Advance";
		            }
		        else
		            {
		                document.getElementById("ob_drp_LoanTypeTextbox").value='';
		            }   
  
		    }
		    
		    function populateEditControls(iRecordIndex) 
		    {	
		        document.getElementById("<%=lnk_AutoRepayment.ClientID %>").style.display='None';
                SetValueInDropDown(document.getElementById('<%=drp_DOLday.ClientID %>'),document.getElementById('<%=drp_DOLmonth.ClientID %>'),document.getElementById('<%=drp_DOLYear.ClientID %>'),Dg_Loan.Rows[iRecordIndex].Cells[15].Value);
                document.getElementById("<%=txt_LoanAmount.ClientID%>").value = Dg_Loan.Rows[iRecordIndex].Cells[6].Value;
		        document.getElementById("<%=txt_InterestRate.ClientID%>").value = Dg_Loan.Rows[iRecordIndex].Cells[7].Value;
                document.getElementById("<%=txt_TotalAmount.ClientID %>").value = Dg_Loan.Rows[iRecordIndex].Cells[8].Value;
                document.getElementById("<%=txt_Remarks.ClientID %>").value = Dg_Loan.Rows[iRecordIndex].Cells[10].Value.replace(/<BR>/gi,'\n');
		        document.getElementById("<%=Hdn_LoanId.ClientID %>").value = Dg_Loan.Rows[iRecordIndex].Cells[0].Value;
		        document.getElementById("ob_drp_EmployeeCodeTextbox").value = Dg_Loan.Rows[iRecordIndex].Cells[2].Value+':'+Dg_Loan.Rows[iRecordIndex].Cells[3].Value;
		        document.getElementById("ob_drp_LoanTypeTextbox").value = Dg_Loan.Rows[iRecordIndex].Cells[9].Value;
		        if(Dg_Loan.Rows[iRecordIndex].Cells[12].Value==0)
		        {
                    document.getElementById("<%=lnk_AutoRepayment.ClientID %>").style.display='inline';
		        }
		        
		         if(Dg_Loan.Rows[iRecordIndex].Cells[13].Value==0)
		            {
                        document.getElementById("<%=chk_IsSalaryAdvance.ClientID%>").checked=false;
		            }
		        else
	                {
                    document.getElementById("<%=chk_IsSalaryAdvance.ClientID%>").checked=true;
	                }
		       var objCheckBox=document.getElementById("<%=chk_IsSalaryAdvance.ClientID%>");
		        if(objCheckBox.checked)
		            {
		                document.getElementById("ob_drp_LoanTypeTextbox").value="Salary Advance";
		            }
		   }
		   
		  function SetValueInDropDown(ddobject,mmobject,yyobject,value)
		    {

          
                var Day=value.split('-')[2].replace(/^\s+|\s+$/g,"");
	            var Month=value.split('-')[1].replace(/^\s+|\s+$/g,"");
	            var Year=value.split('-')[0].replace(/^\s+|\s+$/g,"");
	            
                ddobject.value=Day;
                mmobject.value=Month;
                yyobject.value=Year;
		    }
		   

		      
		       function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.LoanId =document.getElementById("<%=Hdn_LoanId.ClientID %>").value ;
		         oRecord.TotalAmount=document.getElementById("<%=txt_TotalAmount.ClientID %>").value;
		        oRecord.EmployeeCode=document.getElementById("ob_drp_EmployeeCodeTextbox").value
		        oRecord.LoanType=document.getElementById("ob_drp_LoanTypeTextbox").value;
	            oRecord.Error='';
		        Dg_Loan.executeInsert(oRecord);
		    }
		    
		 
                                            
		    
            function clearFlyout() 
            {
		        document.getElementById("<%=lnk_AutoRepayment.ClientID %>").style.display='None';
		        document.getElementById("<%=txt_LoanAmount.ClientID%>").value = '0';
		        document.getElementById("<%=txt_InterestRate.ClientID%>").value = '0';
		        document.getElementById("<%=txt_TotalRepaymentAmount.ClientID%>").value = '0';
                document.getElementById("<%=txt_TotalAmount.ClientID %>").value = '0';
                document.getElementById("<%=txt_Remarks.ClientID %>").value = '';
		        document.getElementById("<%=Hdn_LoanId.ClientID %>").value = '0';
		        var now=new Date();
                var NowDay=now.getDate();
                if(NowDay<10)
                NowDay='0' + NowDay;
		        var NowMonth=now.getMonth()+1;
		        var NowYear=now.getFullYear();
		        var value=NowYear+'-'+NowMonth + "-" + NowDay;
                SetValueInDropDown(document.getElementById('<%=drp_DOLday.ClientID %>'),document.getElementById('<%=drp_DOLmonth.ClientID %>'),document.getElementById('<%=drp_DOLYear.ClientID %>'),value);
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		        document.getElementById("<%=lbl_RepaymentError.ClientID %>").innerHTML ='';
		        document.getElementById("<%=chk_IsSalaryAdvance.ClientID%>").checked=false;
		        chk_IsSalaryAdvance_onclick();
		    }
    </script>
    
    <script type="text/javascript">
      function ValidateTextBoxForNumericValue()
            {
                if(!(event.keyCode==45||event.keyCode==46||event.keyCode==48||event.keyCode==49||event.keyCode==50||event.keyCode==51||event.keyCode==52||event.keyCode==53||event.keyCode==54||event.keyCode==55||event.keyCode==56||event.keyCode==57))
        		        {			
        		            event.returnValue=false;		
        		        }
            }
    
    function CalcuateTotalAmount()
        {
            var LoanAmount;
            if(document.getElementById("<%=txt_LoanAmount.ClientID%>").value=='')
                {
                    LoanAmount=0;
                }
            else
                {
                    LoanAmount=parseFloat(document.getElementById("<%=txt_LoanAmount.ClientID%>").value);
                } 
                
             var InteresrRate;
            if(document.getElementById("<%=txt_InterestRate.ClientID%>").value=='')
                {
                    InteresrRate=0;
                }
            else
                {
                    InteresrRate=parseFloat(document.getElementById("<%=txt_InterestRate.ClientID%>").value);
                }
                
                var TotalAmount= parseFloat(LoanAmount)+((InteresrRate/100)*parseFloat(LoanAmount));
                document.getElementById("<%=txt_TotalAmount.ClientID %>").value = TotalAmount;
        }
    
    </script>
    
    <script type="text/javascript">
    document.getElementById("ob_drp_EmployeeCodeContainer").style.zIndex="99999";
    document.getElementById("ob_drp_LoanTypeContainer").style.zIndex="99999";
    </script>

</body>
</html>
