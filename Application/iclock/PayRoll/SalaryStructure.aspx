<%@ page language="VB" autoeventwireup="false" inherits="PayRoll_SalaryStructure, App_Web_4fhf4tum" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <table width="100px" cellpadding="0" cellspacing="0" style="border-right: gray 1px solid;
                border-top: gray 1px solid; border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="background-color: lightsteelblue; padding-left: 5px; padding-top: 3px;
                    padding-bottom: 3px; color: white;">
                    <td>
                        Employees Salary Structure
                    </td>
                </tr>
                <tr>
                    <td>
                        <obout:Grid ID="Dg_EmployeesSalaryStructure" runat="server" CallbackMode="true" Serialize="true"
                            AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                            AllowMultiRecordDeleting="true" AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false"
                            GenerateRecordIds="true" AllowFiltering="true">
                            <Columns>
                                <obout:Column ID="Column2" Align="left" DataField="SalaryStructureId" Visible="false"
                                    Width="100" HeaderText="ShiftId" runat="server" />
                                <obout:Column ID="Column1" DataField="EffectiveDate" Visible="true" Width="120" HeaderText="Effective Date"
                                    runat="server" />
                                    <obout:Column ID="Column6" DataField="EmployeeCode" Visible="true" Width="105" HeaderText="Emp Code"
                                    runat="server" />
                                    <obout:Column ID="Column8" DataField="EmployeeName" Visible="true" Width="105" HeaderText="Emp Name"
                                    runat="server" />
                                    <obout:Column ID="Column9" DataField="CompanySName" Visible="true" Width="100" HeaderText="Company"
                                    runat="server" />
                                     <obout:Column ID="Column11" DataField="DepartmentSName" Visible="true" Width="110" HeaderText="Department"
                                    runat="server" />
                                    
                                <obout:Column ID="Column7" DataField="Basic" Visible="true" Width="70" HeaderText="Basic"
                                    runat="server" />
                                <obout:Column ID="Column3" DataField="HRA" Visible="true" Width="70" HeaderText="HRA"
                                    runat="server" />
                                <obout:Column ID="Column4" DataField="DA" Visible="true" Width="70" HeaderText="DA"
                                    runat="server" />
                                <obout:Column ID="Column5" DataField="Conveyance" Visible="true" Width="120" HeaderText="Conveyance"
                                    runat="server" />
                                <obout:Column ID="Column15" DataField="TDS" Visible="true" Width="75" HeaderText="TDS"
                                    runat="server" />
                                <obout:Column ID="Column12" DataField="PF" Visible="true" Width="70" HeaderText="PF"
                                    runat="server" />
                                <obout:Column ID="Column13" DataField="PT" Visible="true" Width="70" HeaderText="PT"
                                    runat="server" />
                                <obout:Column ID="Column14" DataField="ESIC" Visible="true" Width="75" HeaderText="ESIC"
                                    runat="server" />
                                <obout:Column ID="Column10" DataField="OTPerHour" Visible="true" Width="130" HeaderText="OT Per Hour"
                                    runat="server" />
                            </Columns>
                        </obout:Grid>
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
