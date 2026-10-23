<%@ page language="VB" autoeventwireup="false" inherits="PayRoll_EmployeesPayDetails, App_Web_4fhf4tum" enableeventvalidation="false" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
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
                             <tr style="font-family: Verdana; font-size: 14px; font-weight: bold; color: whitesmoke;">
                                <td  style="height: 19px">
                                   Employees Salary Structure
                                </td>
                                <td align="right" colspan="2">
                                    <asp:Button ID="btn_Import" runat="server" Text="Import" OnClientClick="wnd_ImportSalaryStructure.Open();return false;" />&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btn_Export" runat="server" Text="Export" />&nbsp;&nbsp;&nbsp;
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
                                             <obout:Column ID="Column10" DataField="EmployeeId" Visible="False" Width="120" HeaderText="EmployeeId"
                                                runat="server" />
                                            <obout:Column ID="Column8" DataField="EmployeeCode" Visible="true" Width="120" HeaderText="Employee Code"
                                                runat="server" />
                                            <obout:Column ID="Column9" DataField="EmployeeName" Visible="true" Width="120" HeaderText="EmployeeName"
                                                runat="server" />
                                            <obout:Column ID="Column1" DataField="EffectiveDate"  DataFormatString="{0:dd MMM yyyy}"    Visible="true" Width="110" HeaderText="Effective Date"
                                                runat="server" />
                                            <obout:Column ID="Column2" DataField="Basic" Visible="true" Width="60" HeaderText="Basic"
                                                runat="server" />
                                            <obout:Column ID="Column3" DataField="HRA" Visible="true" Width="60" HeaderText="HRA"
                                                runat="server" />
                                            <obout:Column ID="Column4" DataField="DA" Visible="true" Width="60" HeaderText="DA"
                                                runat="server" />
                                            <obout:Column ID="Column5" DataField="Conveyance" Visible="true" Width="100" HeaderText="Conveyance"
                                                runat="server" />
                                            <obout:Column ID="Column6" DataField="OTPerHour" Visible="true" Width="100" HeaderText="OT Per Hour"
                                                runat="server" />
                                            <obout:Column ID="Column7" DataField="LOP" Visible="true" Width="100" HeaderText="LOP per Day"
                                                runat="server" />
                                            <obout:Column HeaderText="Edit" Width="50" AllowEdit="true" AllowDelete="true">
                                                <TemplateSettings TemplateId="tplEditBtn" />
                                            </obout:Column>
                                             <obout:Column HeaderText="Delete" Width="70" AllowEdit="false" AllowDelete="true" Visible="true" />
                                        </Columns>
                                        <Templates>
                                            <obout:GridTemplate runat="server" ID="tplEditBtn">
                                                <Template>
                                                <a href='<%# "~/PayRoll/EmployeeSalaryStructure.aspx?SalaryStructureId=" + GetDataItemValue("SalaryStructureId", Container)+"&EmployeeId=" + GetDataItemValue("EmployeeId", Container)+"&EmployeeCode="+GetDataItemValue("EmployeeCode", Container)+"&EmployeeName="+GetDataItemValue("EmployeeName", Container)+"&Action=EmployeesPayDetails"%>' id="AA2"   runat="server" class="ob_gAL">Edit</a>
                                                </Template>
                                            </obout:GridTemplate>
                                            <obout:GridTemplate runat="server" ID="tplAddBtn">
                                                <Template>
                                                    <asp:HyperLink runat="server" CssClass="ob_gAL" Text="Add" NavigateUrl='<%# "~/PayRoll/EmployeeSalaryStructure.aspx?SalaryStructureId=" + "0"+"&EmployeeId=" + Request.QueryString("EmployeeId")+"&EmployeeCode="+Request.QueryString("EmployeeCode")+"&EmployeeName="+Request.QueryString("EmployeeName")+"&Action=EmployeesPayDetails"%>'
                                                        ID="AA1" />
                                                </Template>
                                            </obout:GridTemplate>
                                        </Templates>
                                    </obout:Grid>
                                    <asp:HiddenField ID="Hdn_SalaryStructureId" runat="server" />
                                </td>
                            </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>
            
            <owd:Window ID="wnd_ImportSalaryStructure" runat="server"  Height="165" StyleFolder="~/Styles/mainwindow/blue"
            Title="Select the File" Width="425" IsResizable="true" VisibleOnLoad="false" 
            ShowStatusBar="false" Left="350" Top="155">
            
        
            
            
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: solid;">
            
                <tr>
                <td>
                <fieldset><legend>Import Salary Structure</legend>
                <table>
                <tr>
                
            <td colspan="2">Example File Format&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lnk_FileFormat"  runat="server" CssClass="WebControls" >FileFormat</asp:LinkButton>
            </td>
            </tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            
                <tr>
                <td>&nbsp;Import From&nbsp;&nbsp;&nbsp;
                </td>
                <td><asp:FileUpload ID="fleup_EmployeeSalaryStructure" runat="server" Width="290px"   CssClass="WebControls"  /></td>
                    
                </tr>
                </table>
                </fieldset>
                </td>
                </tr>
                <tr>
                <td align="right">
                    <asp:LinkButton ID="lnk_DisplayError" runat="server" Enabled="false" OnClientClick="return attachFlyoutToLink(this);">Display Error</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_OK" runat="server" Text="Import" OnClientClick="return CheckFileExistence()"   CssClass="WebControls" />&nbsp;&nbsp;
                    <input id="btn_Cancel" type="button" value="Close" OnClick="wnd_ImportSalaryStructure.Close();"  class="WebControls" /></td>
                </tr>
                
            </table>
            
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
            <tr>
            <td width="100%">
            
            <asp:Label ID="lbl_Error"  runat="server" EnableViewState="False" ForeColor="Red"  text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" CssClass="WebControls"></asp:Label>
            
            </td>
            </tr>
            </table>
        </owd:Window>
        
        <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="BOTTOM_left" CloseEvent="NONE"
                OpenEvent="NONE" DelayTime="500" AttachTo="lnk_DisplayError" zIndex="100000">
                <table class="rowEditTable">
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ReadOnly="true" BorderStyle="None" Wrap="true" Width="400px"  CssClass="WebControls" BackColor="#EEEEEE" Height="150px" TextMode="MultiLine" BorderWidth="0" ID="lbl_DisplayError"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                                <input id="Button1" type="button" value="Close" onclick="javascript:closeFlyout();" />
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
        
    </script>
    
    <script type="text/javascript">
     function attachFlyoutToLink(oLink)
		        {	
		            if(oLink.disabled==false)
		            {
	                    <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	                    <%=Flyout1.getClientID()%>.Open();
	                }
	                return false;
		        }
		    
		     function closeFlyout() 
		        {
		            <%=Flyout1.getClientID()%>.Close();
		        }
		        
		          function CheckFileExistence()
		    {
		        var filePath=document.getElementById("<%=fleup_EmployeeSalaryStructure.ClientID %>").value;
		        if(filePath.length<1) 
                    {
                    document.getElementById("<%=lbl_Error.ClientId %>").innerHTML='Error:-File Name Can not be empty'
                    return false; 
                    }
                    
                        var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase(); 
                       
                            if(ext=='csv' || ext=='xls' )
                                {
                                    return true; 
                                }
                               else 
                                {
                                    document.getElementById("<%=lbl_Error.ClientId %>").innerHTML='Error:-The file extension ' + ext.toUpperCase() + ' is not allowed!'
                                    return false; 
                                }
                       
                   
                    

		    }
		    
    </script>
    
  

</body>
</html>

