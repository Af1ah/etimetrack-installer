<%@ page language="VB" autoeventwireup="false" inherits="PayRoll_LoanRepayment, App_Web_4fhf4tum" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
		    document.getElementById("<%=Hdn_LoanRepaymentId.ClientID %>").value = record.LoanRepaymentId;
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
            <table width="100px" cellpadding="0" cellspacing="0" style="border-right: gray 1px solid;
                border-top: gray 1px solid; border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="background-color: lightsteelblue;color: white;">
                    <td style="padding:5px;background-color: lightsteelblue;color: white;font-weight:bold;font-size:15px;">
                        <asp:Label ID="lbl_LoanDetails" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td style="background-color: lightsteelblue;color: white;font-weight:bold;font-size:15px;">
                       Loan Repayment
                    </td>
                </tr>
                
                 <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <obout:Grid ID="Dg_LoanRepayment" runat="server"  
                            AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                             AllowAddingRecords="true" PageSize="10" AllowMultiRecordSelection="true"
                            GenerateRecordIds="true" AllowFiltering="true" OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert"  OnBeforeClientDelete="OnBeforeDelete" OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column ID="Column0" Align="left" DataField="LoanRepaymentId" Visible="false"
                                    Width="100" HeaderText="Id" runat="server" />
                                <obout:Column ID="Column1" DataField="RepaymentMonth" Visible="true" Width="130" HeaderText="Month"
                                    runat="server" >
                                    <TemplateSettings TemplateId="RepaymentMonth_Template" />
                                    </obout:Column>
                                    <obout:Column ID="Column2" DataField="RepaymentYear" Visible="true" Width="130" HeaderText="Year"
                                    runat="server" />
                                    <obout:Column ID="Column3" DataField="TotalAmount" Visible="true" Width="130" HeaderText="Amount"
                                    runat="server" />
                                    <obout:Column ID="Column4" DataField="IsAutoDeduct" Visible="false" Width="130" HeaderText="Is Auto Deduct"
                                    runat="server" />
                                    <obout:Column ID="Column5" DataField="Remarks" Visible="true" Width="350" HeaderText="Remarks"
                                    runat="server" />
                                    
                            <obout:Column HeaderText="Edit" Width="70" AllowEdit="true" AllowDelete="true">
                                    <TemplateSettings TemplateId="tplEditBtn" />
                                </obout:Column>
                                 <obout:Column HeaderText="Delete" Width="75" AllowEdit="false" AllowDelete="true"
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
                                        <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add')" class="ob_gAL">Add</a>
                                    </Template>
                                </obout:GridTemplate>
                                
                                 <obout:GridTemplate runat="server" ID="RepaymentMonth_Template">
                                    <Template>
                                        <%#ParseRepaymentMonth(GetDataItemValue("RepaymentMonth", Container))%>
                                    </Template>
                                </obout:GridTemplate>
                                
                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
                
                 <tr style="background-color:lightsteelblue;" >
                                <td colspan="2">
                                <hr />
                                <table>
                                <tr>
                                <td style="width: 272px">
                                &nbsp;&nbsp;<a  style="font-family:Verdana; font-size: 13px; color: #0c416f;" href="Loan.aspx">« Go to Employees Loan Details</a>
                                </td>
                                </tr>
                                </table>
                                    
                                </td>
                            </tr>
                            
                            
            </table>
            <obout:Flyout runat="server" ID="Flyout1" Align="RIGHT" Position="BOTTOM_CENTER"
                CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Loan Repayment Information</legend>
                                <table>
                                    <tr>
                                        <td style="font-weight: bold;" align="right">
                                            Repayment Month
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drp_RepaymentMonth" runat="server" Width="78px">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="font-weight: bold;" align="right">
                                            Repayment Year
                                        </td>
                                        <td >
                                            <asp:DropDownList ID="drp_RepaymentYear" runat="server" Width="77px"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold;" align="right">
                                        EMI Amount
                                        </td>
                                        <td colspan="3" >
                                            <asp:TextBox ID="txt_Amount" runat="server" Width="254px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  colspan="4">
                                            <asp:CheckBox ID="Chk_AutoDeduct" runat="server" Text="Auto deduct From Payslip" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Remarks
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txt_Remarks" runat="server" TextMode="MultiLine" Width="249px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                            <asp:HiddenField ID="Hdn_LoanRepaymentId" runat="server" />
                            <input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;<input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        </td>
                    </tr>
                    <tr>
                    </tr>
                </table>
           </obout:Flyout>
            
        </div>
    </form>
    
    

    <script runat="server">
        
        Function GetDataItemValue(ByVal fieldname As String, ByVal Container As Obout.Grid.TemplateContainer) As String
            
            
            If Container.DataItem(fieldname) Is Nothing Then
                Return Container.DataItem(fieldname.ToUpper)
              
                
            End If
            
            
            Return Container.DataItem(fieldname)
            
        End Function
        
        Function ParseRepaymentMonth(ByVal RepaymentMonth As Integer) As String
            Select Case RepaymentMonth
                Case 1
                    Return "Jan"
                Case 2
                    Return "Feb"
                Case 3
                    Return "Mar"
                Case 4
                    Return "Apr"
                Case 5
                    Return "May"
                Case 6
                    Return "Jun"
                Case 7
                    Return "Jul"
                Case 8
                    Return "Aug"
                Case 9
                    Return "Sep"
                Case 10
                    Return "Oct"
                Case 11
                    Return "Nov"
                Case 12
                    Return "Dec"
            End Select
            
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
		        document.getElementById("<%=Hdn_LoanRepaymentId.ClientID %>").value = Dg_LoanRepayment.Rows[iRecordIndex].Cells[0].Value;
		        document.getElementById("<%=drp_RepaymentMonth.ClientID %>").value = Dg_LoanRepayment.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=drp_RepaymentYear.ClientID %>").value = Dg_LoanRepayment.Rows[iRecordIndex].Cells[2].Value;
		        document.getElementById( "<%=txt_Amount.ClientID %>").value = Dg_LoanRepayment.Rows[iRecordIndex].Cells[3].Value;
		        
		        if(Dg_LoanRepayment.Rows[iRecordIndex].Cells[4].Value=='0')
		            document.getElementById("<%=Chk_AutoDeduct.ClientID %>").checked =false ;
                else
		            document.getElementById("<%=Chk_AutoDeduct.ClientID %>").checked =true ;
		            
                document.getElementById("<%=txt_Remarks.ClientID %>").value =  Dg_LoanRepayment.Rows[iRecordIndex].Cells[5].Value.replace(/<BR>/gi,'\n');
		   }
		   

		      
		     function btn_Save_onclick()
		     {
		        var oRecord = new Object();
		        oRecord.LoanRepaymentId =document.getElementById("<%=Hdn_LoanRepaymentId.ClientID %>").value ;
	            oRecord.Error='';
		        Dg_LoanRepayment.executeInsert(oRecord);
		     }
		    
            function clearFlyout() 
            {
                document.getElementById("<%=Hdn_LoanRepaymentId.ClientID %>").value = '0';
                var now=new Date();
		        document.getElementById("<%=drp_RepaymentMonth.ClientID %>").value =now.getMonth+1;
		        document.getElementById("<%=drp_RepaymentYear.ClientID %>").value =now.getFullYear;
		        document.getElementById( "<%=txt_Amount.ClientID %>").value = '0';
	            document.getElementById("<%=Chk_AutoDeduct.ClientID %>").checked =false ;
                document.getElementById("<%=txt_Remarks.ClientID %>").value =  '';
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		    }
    </script>

</body>
</html>
