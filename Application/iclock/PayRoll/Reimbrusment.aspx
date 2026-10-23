<%@ page language="VB" autoeventwireup="false" inherits="PayRoll_Reimbrusment, App_Web_4fhf4tum" enableeventvalidation="false" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<script type="text/javascript">	
	function OnBeforeDelete(record) 
	    {
		    document.getElementById("<%=Hdn_ReimbursementId.ClientID %>").value = record.ReimbursementId;
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
                <tr style="background-color: lightsteelblue; padding-left: 5px; padding-top: 3px;
                    padding-bottom: 3px; color: white;">
                    <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;padding:5px; color: white;">
                        Employees Reimbrusment
                    </td>
                </tr>
                 <tr style=" background-color: lightsteelblue;">
                <td>
                <hr />
                </td>
                </tr>
                
                <tr>
                    <td>
                        <obout:Grid ID="Dg_Reimbrusment" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
                            FolderStyle="~/styles/grid/styles/premiere_blue" 
                            AllowAddingRecords="true" PageSize="10" AllowMultiRecordSelection="false" GenerateRecordIds="true"
                            AllowFiltering="true" OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column ID="Column0" Align="left" DataField="ReimbursementId" Visible="false" Width="100"
                                    HeaderText="ReimbursementId" runat="server" />
                                <obout:Column ID="Column1" DataField="ReimbursementDate"  DataFormatString="{0:dd MMM yyyy}"   Visible="true" Width="130" HeaderText="Date"
                                    runat="server" />
                                <obout:Column ID="Column2" DataField="EmployeeCode" Visible="true" Width="115" HeaderText="Emp Code"
                                    runat="server" />
                                <obout:Column ID="Column3" DataField="EmployeeName" Visible="true" Width="115" HeaderText="Emp Name"
                                    runat="server" />
                                <obout:Column ID="Column4" DataField="CompanySName" Visible="true" Width="110" HeaderText="Company"
                                    runat="server" />
                                <obout:Column ID="Column5" DataField="DepartmentSName" Visible="true" Width="110"
                                    HeaderText="Department" runat="server" />
                                <obout:Column ID="Column6" DataField="ReimbursementAmount" Visible="true" Width="120" HeaderText="Amount"
                                    runat="server" />
                                <obout:Column ID="Column7" DataField="ReimbursementReason" Visible="true" Width="190" HeaderText="Reason"
                                    runat="server" />
                                <obout:Column ID="Column8" DataField="Remarks" Visible="false" Width="190" HeaderText="Remarks "
                                    runat="server" />
                                <obout:Column ID="Column9" DataField="IsApproved" Visible="false" Width="190" HeaderText="IsApproved "
                                    runat="server" />
                                <obout:Column ID="Column10"  Visible="false" Width="120"  runat="server" > <TemplateSettings TemplateId="TP_ReimbursementDateFormat" /></obout:Column>
                                    
                                <obout:Column HeaderText="Edit" Width="65" AllowEdit="true" AllowDelete="true">
                                    <TemplateSettings TemplateId="tplEditBtn" />
                                </obout:Column>
                                <obout:Column HeaderText="Delete" Width="70" AllowEdit="false" AllowDelete="true"
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
                                
                                <obout:GridTemplate runat="server" ID="TP_ReimbursementDateFormat">
			                            <Template>
			                            <%#ParseDateTime(Container.DataItem.Item("ReimbursementDate"))%>
			                            </Template>
			                    </obout:GridTemplate>
			    
                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
            <obout:Flyout runat="server" ID="Flyout_Reimbursement" Align="left" Position="BOTTOM_LEFT"
                CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Reimbursement  Details</legend>
                                <table>
                                    <tr>
                                        <td align="right" style="font-weight: bold;">
                                            Select Employee
                                        </td>
                                        <td colspan="3">
                                            <obout:Combobox Validate="false" ID="drp_EmployeeCode" CssClass="WebControls" runat="server"
                                                Width="425" FolderStyle="~/styles/default" SelectedIndex="0">
                                            </obout:Combobox>
                                        </td>
                                        
                                    </tr>
                                    
                                     <tr>
                                        <td align="right" style="font-weight: bold;">
                                            Reason
                                        </td>
                                        <td colspan="3" align="left">
                                        <table>
                                        <tr>
                                        <td>
                                        <obout:Combobox Validate="false" ID="drp_Reason" CssClass="WebControls" runat="server" Width="325" FolderStyle="~/styles/default" SelectedIndex="0"></obout:Combobox>
                                        </td>
                                        <td>
                                        <asp:CheckBox ID="chk_IsApproved" Text="Is Approved" runat="server" />
                                        </td>
                                        </tr>
                                        </table>
                                            
                                        </td>
                                        
                                    </tr>
                                    
                                    <tr>
                                    <td align="right" style="font-weight: bold;">
                                    Date
                                    </td>
                                    
                                    <td align="left">
                                     <select id="drp_DOLday" class="WebControls" runat="server" width="46px">
                                            </select>
                                            &nbsp;&nbsp;<select id="drp_DOLmonth" class="WebControls" runat="server" enableviewstate="true"
                                                width="48px">
                                            </select>&nbsp;&nbsp;<select id="drp_DOLYear" class="WebControls" runat="server"
                                                enableviewstate="true" width="69px">
                                            </select>
                                    </td>
                                    
                                    <td align="right">
                                    Amount
                                    </td>
                                    <td align="left">
                                            <asp:TextBox ID="txt_Amount" Text="0"  runat="server"></asp:TextBox>
                                    </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            Remarks
                                        </td>
                                        <td align="right"  colspan="3">
                                            <asp:TextBox ID="txt_Remarks" TextMode="MultiLine" Width="99%" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <asp:Label Width="350px" runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><asp:HiddenField ID="Hdn_ReimbursementId" runat="server" />
                            <input id="btn_Save" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;<input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        </td>
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
        
         Function ParseDateTime(ByVal DateValue As Date) As String
            Return DateValue.ToString("yyyy-MM-dd")
        End Function
        
        
    </script>

    <script type="text/javascript">
		    
		    function attachFlyoutToLink(oLink,Action)
		     {	
		       <%=Flyout_Reimbursement.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_Reimbursement.getClientID()%>.Open();
		        clearFlyout();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
		    }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout_Reimbursement.getClientID()%>.Close();
		    }
		    
		    function populateEditControls(iRecordIndex) 
		    {	
                SetValueInDropDown(document.getElementById('<%=drp_DOLday.ClientID %>'),document.getElementById('<%=drp_DOLmonth.ClientID %>'),document.getElementById('<%=drp_DOLYear.ClientID %>'),Dg_Reimbrusment.Rows[iRecordIndex].Cells[10].Value);
		        document.getElementById("ob_drp_EmployeeCodeTextbox").value = Dg_Reimbrusment.Rows[iRecordIndex].Cells[2].Value+':'+Dg_Reimbrusment.Rows[iRecordIndex].Cells[3].Value;
		        document.getElementById("ob_drp_EmployeeCodeTextbox").disabled=true;
		        document.getElementById("ob_drp_EmployeeCodeButtonDown").disabled=true;
		        document.getElementById("ob_drp_EmployeeCodeButtonUp").disabled=true;
		        document.getElementById("ob_drp_ReasonTextbox").value = Dg_Reimbrusment.Rows[iRecordIndex].Cells[7].Value;
		        document.getElementById("<%=txt_Amount.ClientID%>").value = Dg_Reimbrusment.Rows[iRecordIndex].Cells[6].Value;
                document.getElementById("<%=txt_Remarks.ClientID %>").value = Dg_Reimbrusment.Rows[iRecordIndex].Cells[8].Value.replace(/<BR>/gi,'\n');
		        document.getElementById("<%=Hdn_ReimbursementId.ClientID %>").value = Dg_Reimbrusment.Rows[iRecordIndex].Cells[0].Value;
		         if(Dg_Reimbrusment.Rows[iRecordIndex].Cells[9].Value=='-1')
                        document.getElementById( "<%=chk_IsApproved.ClientID %>").checked=true;
                    else
                        document.getElementById( "<%=chk_IsApproved.ClientID %>").checked=false;
                
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
		        oRecord.ReimbursementId =document.getElementById("<%=Hdn_ReimbursementId.ClientID %>").value;
		        oRecord.EmployeeCode=document.getElementById("ob_drp_EmployeeCodeTextbox").value;
		        oRecord.ReimbursementReason=document.getElementById("ob_drp_ReasonTextbox").value;
	            oRecord.Error='';
		        Dg_Reimbrusment.executeInsert(oRecord);
		    }
		    
            function clearFlyout() 
            {
                document.getElementById("ob_drp_EmployeeCodeTextbox").disabled=false;
		        document.getElementById("ob_drp_EmployeeCodeButtonDown").disabled=false;
		        document.getElementById("ob_drp_EmployeeCodeButtonUp").disabled=false;
		        document.getElementById("<%=Hdn_ReimbursementId.ClientID %>").value = '0';
                document.getElementById("ob_drp_EmployeeCodeTextbox").value = '';
		        document.getElementById("ob_drp_ReasonTextbox").value= '';
		        document.getElementById("<%=txt_Amount.ClientID%>").value = '0';
		        document.getElementById("<%=txt_Remarks.ClientID%>").value = '';
		        var now=new Date();
                var NowDay=now.getDate();
                if(NowDay<10)
                NowDay='0' + NowDay;
		        var NowMonth=now.getMonth()+1;
		        var NowYear=now.getFullYear();
		        var value=NowYear+'-'+NowMonth + "-" + NowDay;
                SetValueInDropDown(document.getElementById('<%=drp_DOLday.ClientID %>'),document.getElementById('<%=drp_DOLmonth.ClientID %>'),document.getElementById('<%=drp_DOLYear.ClientID %>'),value);
		        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';
		    }
    </script>
    
    <script type="text/javascript">
    document.getElementById("ob_drp_EmployeeCodeContainer").style.zIndex="99999";
    document.getElementById("ob_drp_ReasonContainer").style.zIndex="99999";
    </script>

</body>
</html>
