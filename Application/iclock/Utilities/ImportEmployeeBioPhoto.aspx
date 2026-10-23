<%@ page language="VB" autoeventwireup="false" inherits="Utilities_ImportEmployeeBioPhoto, App_Web_vcxdl3a3" enableEventValidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Import Employee Bio Photo</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body background="../Images/bck1.gif" style="background-repeat: no-repeat; background-position-x: right;
    background-position-y: top;">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="wnd_EmployeeBioPhoto" runat="server" Height="160" StyleFolder="~/Styles/mainwindow/blue"
            Title="Import Employee Bio Photo" Width="425" IsResizable="true" ShowStatusBar="false"
            Left="350" Top="80">
            <table width="100%" height="100%" cellpadding="1" cellspacing="0" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: solid;">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Select the File</legend>
                            <table>
                                <tr>
                                    <td colspan="2">
                                        Note:Name of the image file must be Employee code.
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Import&nbsp;From
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="fileup_Employee" runat="server" Width="290px" multiple="multiple"
                                            CssClass="WebControls" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input id="btnDisplayError" runat="server" type="button" style="font-size: 12px;
                            color: Red; display: none; border: 0px; background-color: #EEEEEE; text-decoration: underline;"
                            value="Display Error" />
                        <asp:Button ID="btn_OK" runat="server" Text="Import" CssClass="WebControls" />&nbsp;&nbsp;
                        <input id="btn_Cancel" type="button" value="Close" onclick="closeWindow();" class="WebControls" />
                    </td>
                </tr>
            </table>
        </owd:Window>
        <obout:Flyout runat="server" ID="Flyout1" AttachTo="btnDisplayError" Position="BOTTOM_CENTER"
            Align="TOP" zIndex="100000">
            <table style="width:620px; height:100px;" >
                <tr>
                    <td>
                        <div style="height: 300px; width:620px; overflow: auto">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#333333" GridLines="None" ScrollBars="Horizontal" HorizontalAlign="Left">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="EmployeeCode" HeaderText="Employee Code">
                                        <ItemStyle Width="120px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Error" HeaderText="Error">
                                        <ItemStyle Width="500px" />
                                    </asp:BoundField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Left" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input id="Button2" type="button" value="Close" class="WebControls" onclick="<%=Flyout1.getClientID()%>.Close();" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
    </div>
    </form>
    <script type="text/javascript">
        function closeWindow() {
            try {

                wnd_EmployeeBioPhoto.Close();
            }
            catch (ex) {
                alert(ex.message);
            }
        }
        

          function attachFlyoutToLink(oLink)
		        {	
		             <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	                 <%=Flyout1.getClientID()%>.Open();
	               return false;
		        }
		    
		     function closeFlyout() 
		        {
		            <%=Flyout1.getClientID()%>.Close();
		        }
      
		    
    </script>
</body>
</html>
