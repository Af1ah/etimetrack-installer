<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeeShiftSchedule, App_Web_usmjemmz" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
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
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Employee Shift Schedule
                </td>
            </tr>
             </tr>
              <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">
                    <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                    <asp:DropDownList Width="100" ID="drpCompny" runat="server" >
                    </asp:DropDownList>
                    <asp:Label ID="Label2" runat="server" Text="Dept"></asp:Label>
                    <asp:DropDownList Width="100" ID="drpDepartment" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label8" runat="server" Text="Month"></asp:Label>
                    <asp:DropDownList Width="50px" ID="drpMonth" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label9" runat="server" Text="Year"></asp:Label>
                    <asp:DropDownList Width="52px" ID="drpYear" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label3" runat="server" Text="Code"></asp:Label>
                    <asp:TextBox Width="50px" ID="txtCode" runat="server"></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox Width="67px" ID="txtName" runat="server"></asp:TextBox>
                    <asp:Label ID="Label5" runat="server" Text="Designation"></asp:Label>
                    <asp:DropDownList Width="80" ID="drpDesignation" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label7" runat="server" Text="Status"></asp:Label>
                    <asp:DropDownList Width="80" ID="drpStatus" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label6" runat="server" Text="Type"></asp:Label>
                    <asp:DropDownList Width="80" ID="drpEmployment" runat="server">
                    </asp:DropDownList>

                     

                         <asp:Button ID="btnUpdate"  runat="server" Text="Refresh" OnClientClick="SetSource(this.id)"/>
                          <asp:HiddenField ID="hidSourceID" runat="server" />

                         <script type="text/javascript">
                             function SetSource(SourceID) {
                                 var hidSourceID = document.getElementById("<%=hidSourceID.ClientID%>");
                                 hidSourceID.value = SourceID;
                             }
                  </script>

                    <asp:Label ID="lblMonth" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="lblYear" runat="server" Visible="False"></asp:Label>                    
                    <asp:Button ID="btnImport" runat="server" Text="Import" />
                    <asp:Button ID="btnExport" runat="server" Text="Export" />
                   
                </td>
            </tr>
            <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 29px">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div style="overflow: auto; height: 250; width: 200;">
                        <obout:Grid ID="Dg_EmployeeShifts" runat="server" AllowFiltering="true" CallbackMode="true"
                            EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                            FolderStyle="~/styles/grid/styles/premiere_blue" AllowGrouping="False" AllowAddingRecords="false"
                            AllowRecordSelection="false" ShowLoadingMessage="false"  OnRebind="RebindGrid" 
                            AllowSorting="false" Width="1000px">
                            <Columns>
                                <obout:Column DataField="EmployeeId" HeaderText="EmployeeId" Visible="false" Width="0"
                                    Index="1" ReadOnly="true" AllowEdit="false" AllowDelete="false">
                                </obout:Column>
                                <obout:Column DataField="EmployeeCode" HeaderText="Emp.Code" Width="100px" Index="2"  Visible="true"  Align="left">
                                </obout:Column>
                                <obout:Column DataField="EmployeeName" HeaderText="Employee Name" Width="100px" Index="3"  Visible="true"  Align="left"  ReadOnly="true" AllowEdit="false" AllowDelete="false">
                                </obout:Column>

                                <obout:Column Width="100px" DataField="1" HeaderText="1" Visible="true" Index="4" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="2" HeaderText="2" Visible="true" Index="5" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="3" HeaderText="3" Visible="true" Index="6" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="4" HeaderText="4" Visible="true" Index="7" Wrap="true"
                                    Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="5" HeaderText="5" Visible="true" Index="8" Wrap="true"
                                    Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="6" HeaderText="6" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="9" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="7" HeaderText="7" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="10" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="8" HeaderText="8" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="11" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="9" HeaderText="9" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="12" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="10" HeaderText="10" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="13" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="11" HeaderText="11" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="14" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="12" HeaderText="12" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="15" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="13" HeaderText="13" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="16" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="14" HeaderText="14" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="17" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="15" HeaderText="15" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="18" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="16" HeaderText="16" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="19" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="17" HeaderText="17" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="20" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="18" HeaderText="18" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="21" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="19" HeaderText="19" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="22" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="20" HeaderText="20" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="23" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="21" HeaderText="21" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="24" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="22" HeaderText="22" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="25" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="23" HeaderText="23" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="26" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="24" HeaderText="24" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="27" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="25" HeaderText="25" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="28" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="26" HeaderText="26" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="29" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="27" HeaderText="27" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="30" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="28" HeaderText="28" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="31" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="29" HeaderText="29" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="32" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="30" HeaderText="30" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="33" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="30" DataField="31" HeaderText="31" AllowEdit="false" AllowDelete="false"
                                    Visible="true" Index="34" Wrap="true" Align="left">
                                </obout:Column>
                                <obout:Column Width="100px" HeaderText="Edit" AllowEdit="true" AllowDelete="false"
                                    Visible="true" Index="35">
                                    <TemplateSettings TemplateId="tplEditBtn" />
                                </obout:Column>
                            </Columns>
                            <Templates>
                                <obout:GridTemplate runat="server" ID="tplEditBtn">
                                    <Template>
                                        <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this)"
                                            class="ob_gAL">
                                            <%=Session("ShiftEdit") %></a>
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </div>
                </td>
            </tr>
        </table>
        <obout:Flyout runat="server" ID="flyoutEdit" Align="RIGHT" Position="BOTTOM_LEFT"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table id="tableEdit" runat="server" cellpadding="2" border="0" cellspacing="0" style="width: 300px;
                text-align: center; background-color: gainsboro; font-family: Verdana; font-size: 11px;
                color: Black; line-height: 15px; font-weight: normal; border-bottom: gray 1px solid;
                border-left: gray 1px solid; border-top: gray 1px solid; border-right: gray 1px solid;"
                frame="void">
                <tr>
                    <td colspan="5" style="background-color: Blue; color: White; font-size: 14px; line-height: 18px;">
                        Assign Shift
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="ipEditId" type="hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        1
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        2
                        <br />
                        <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        3
                        <br />
                        <asp:DropDownList ID="DropDownList3" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        4
                        <br />
                        <asp:DropDownList ID="DropDownList4" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        5
                        <br />
                        <asp:DropDownList ID="DropDownList5" runat="server" Font-Size="10px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        6
                        <br />
                        <asp:DropDownList ID="DropDownList6" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        7
                        <br />
                        <asp:DropDownList ID="DropDownList7" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        8
                        <br />
                        <asp:DropDownList ID="DropDownList8" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        9
                        <br />
                        <asp:DropDownList ID="DropDownList9" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        10
                        <br />
                        <asp:DropDownList ID="DropDownList10" runat="server" Font-Size="10px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        11
                        <br />
                        <asp:DropDownList ID="DropDownList11" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        12
                        <br />
                        <asp:DropDownList ID="DropDownList12" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        13
                        <br />
                        <asp:DropDownList ID="DropDownList13" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        14
                        <br />
                        <asp:DropDownList ID="DropDownList14" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        15
                        <br />
                        <asp:DropDownList ID="DropDownList15" runat="server" Font-Size="10px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        16
                        <br />
                        <asp:DropDownList ID="DropDownList16" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        17
                        <br />
                        <asp:DropDownList ID="DropDownList17" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        18
                        <br />
                        <asp:DropDownList ID="DropDownList18" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        19
                        <br />
                        <asp:DropDownList ID="DropDownList19" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        20
                        <br />
                        <asp:DropDownList ID="DropDownList20" runat="server" Font-Size="10px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        21
                        <br />
                        <asp:DropDownList ID="DropDownList21" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        22
                        <br />
                        <asp:DropDownList ID="DropDownList22" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        23
                        <br />
                        <asp:DropDownList ID="DropDownList23" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        24
                        <br />
                        <asp:DropDownList ID="DropDownList24" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        25
                        <br />
                        <asp:DropDownList ID="DropDownList25" runat="server" Font-Size="10px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        26
                        <br />
                        <asp:DropDownList ID="DropDownList26" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        27
                        <br />
                        <asp:DropDownList ID="DropDownList27" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        28
                        <br />
                        <asp:DropDownList ID="DropDownList28" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        29
                        <br />
                        <asp:DropDownList ID="DropDownList29" runat="server" Font-Size="10px" />
                    </td>
                    <td>
                        30
                        <br />
                        <asp:DropDownList ID="DropDownList30" runat="server" Font-Size="10px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        31
                        <br />
                        <asp:DropDownList ID="DropDownList31" runat="server" Font-Size="10px" />
                    </td>
                    <td colspan="4">
                    </td>
                </tr>
                 <tr>
                    <td colspan="5">
                       
                      
                    </td>
                   
                </tr>
                <tr>
                    <td colspan="5" style="background-color: Gray; color: White; font-size: 14px; line-height: 18px;"
                        align="right">
                        <asp:Button ID="UpdateShift" Text="Update" runat="server" />
                        <input type="button" id="btnCancel" value="Cancel" onclick="closeFlyout()" class="tdText" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
    </div>
    </form>
    <script type="text/javascript">
		    function attachFlyoutToLink(oLink) {	
		        try {	        	                
		            <%=flyoutEdit.getClientID()%>.AttachTo(oLink.id);		            		            
		            
		            
		            <%=flyoutEdit.getClientID()%>.Open();
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
                } catch(ex){}
		    }
		    
		    
		    
		    function closeFlyout() {
		        <%=flyoutEdit.getClientID()%>.Close();
		    }
		    
		    function populateEditControls(iRecordIndex) {
		    		    		        
		        document.getElementById("<%= ipEditId.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['EmployeeId'].Value;
		        document.getElementById("<%= DropDownList1.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['1'].Value;
		        document.getElementById("<%= DropDownList2.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['2'].Value;
		        document.getElementById("<%= DropDownList3.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['3'].Value;
		        document.getElementById("<%= DropDownList4.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['4'].Value;
		        document.getElementById("<%= DropDownList5.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['5'].Value;
		        document.getElementById("<%= DropDownList6.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['6'].Value;
		        document.getElementById("<%= DropDownList7.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['7'].Value;
		        document.getElementById("<%= DropDownList8.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['8'].Value;
		        document.getElementById("<%= DropDownList9.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['9'].Value;
		        document.getElementById("<%= DropDownList10.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['10'].Value;
		        document.getElementById("<%= DropDownList11.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['11'].Value;
		        document.getElementById("<%= DropDownList12.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['12'].Value;
		        document.getElementById("<%= DropDownList13.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['13'].Value;
		        document.getElementById("<%= DropDownList14.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['14'].Value;
		        document.getElementById("<%= DropDownList15.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['15'].Value;
		        document.getElementById("<%= DropDownList16.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['16'].Value;
		        document.getElementById("<%= DropDownList17.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['17'].Value;
		        document.getElementById("<%= DropDownList18.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['18'].Value;
		        document.getElementById("<%= DropDownList19.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['19'].Value;
		        document.getElementById("<%= DropDownList20.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['20'].Value;
		        document.getElementById("<%= DropDownList21.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['21'].Value;
		        document.getElementById("<%= DropDownList22.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['22'].Value;
		        document.getElementById("<%= DropDownList23.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['23'].Value;
		        document.getElementById("<%= DropDownList24.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['24'].Value;
		        document.getElementById("<%= DropDownList25.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['25'].Value;
		        document.getElementById("<%= DropDownList26.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['26'].Value;
		        document.getElementById("<%= DropDownList27.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['27'].Value;
		        document.getElementById("<%= DropDownList28.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['28'].Value;
		        document.getElementById("<%= DropDownList29.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['29'].Value;
		        document.getElementById("<%= DropDownList30.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['30'].Value;
		        document.getElementById("<%= DropDownList31.ClientID %>").value = Dg_EmployeeShifts.Rows[iRecordIndex].Cells['31'].Value;
		        
		    }
		    
		    
		    
    </script>
</body>
</html>
