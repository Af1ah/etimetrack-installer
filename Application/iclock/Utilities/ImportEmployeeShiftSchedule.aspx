<%@ page language="VB" autoeventwireup="false" inherits="Utilities_ImportEmployeeShiftSchedule, App_Web_vcxdl3a3" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Import Employee Shift Schedule</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body background="../Images/bck1.gif" style="background-repeat: no-repeat; background-position-x: right;
    background-position-y: top;">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="wnd_LeaveBalance" runat="server" Height="182" StyleFolder="~/Styles/mainwindow/blue"
            Title="Import Employee Shift Schedule" Width="425" IsResizable="true" ShowStatusBar="false"
            Left="350" Top="155">
            <table width="100%" height="100%" cellpadding="1" cellspacing="0" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: solid;">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Select the File</legend>
                            <table>
                                <tr>
                                    <td colspan="2">
                                        Example File Format&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lnk_FileFormat" runat="server"
                                            CssClass="WebControls">FileFormat</asp:LinkButton>
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
                                        Month:
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblMonth" runat="server" Text="Month"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        Year:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lblYear" runat="server"
                                            Text="Year"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Import From
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="fleup_Employee" runat="server" Width="290px" CssClass="WebControls" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <font style="color: Maroon">
                            <asp:Button ID="btn_OK" runat="server" Text="Import" OnClientClick="return CheckFileExistence()"
                                CssClass="WebControls" />&nbsp;&nbsp;
                            <input id="btn_Cancel" type="button" value="Close" onclick="closeWindow();" class="WebControls" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <font style="color: Maroon">
                            <asp:Literal ID="ltlMessage" runat="server"></asp:Literal></font>&nbsp;
                    </td>
                </tr>
                <tr runat="server" id="trError">
                    <td align="right" style="color:Red;">
                      <span style="color:Red;><a href="javascript: //" id="tt" onclick="attachFlyoutToLink(this)" class="WebControls">
                            DisplayError</a></span> 
                    </td>
                </tr>
            </table>
        </owd:Window>
        <obout:Flyout runat="server" ID="Flyout1" Align="left" Position="MIDDLE_CENTER" 
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500" zIndex="100000">
            <table border=1 style="width:490;height:300;border-color: gray;border-bottom-width:1px" cellpadding=0 cellspacing=0>
                <tr>
                    <td>
                        <div style="overflow: auto; height: 200; width: 200;">
                            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </div>
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
    <script type="text/javascript">
        function closeWindow() {
            try {

                wnd_LeaveBalance.Close();
            }
            catch (ex) {
                alert(ex.message);
            }
        }


        function CheckFileExistence() {
            var filePath = document.getElementById("<%=fleup_Employee.ClientID %>").value;
            if (filePath.length < 1) {
                alert('Error:-File Name Can not be empty');
                return false;
            }

            var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();

            if (ext == 'xls') {
                return true;
            }
            else {
                alert('Error:-The file extension ' + ext.toUpperCase() + ' is not allowed!');
                return false;
            }

        }


        function attachFlyoutToLink(oLink)
		        {	
                  <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	                    <%=Flyout1.getClientID()%>.Open();
	               
		        }

      
      function closeFlyout() 
		    {
		        <%=Flyout1.getClientID()%>.Close();
		    }
    </script>
</body>
</html>
