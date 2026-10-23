<%@ page language="VB" autoeventwireup="false" inherits="Manage_UpdateEmployeeBioPhoto, App_Web_kgq5n2bg" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head id="Head1" runat="server">
    <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .rowEditTable
        {
            width: 319px;
        }
    </style>
    <script type="text/javascript">
        function Close() {
            self.close();
        } 
		      
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 319px;">
        <tr>
            <td>
                <div>
                    <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                        border-left: gray 1px solid; border-bottom: gray 1px solid;">
                        <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                            padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                            <td style="font-weight: bold;">
                                Upload Employee Bio Photo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label
                                    runat="server" ID="lbl_EmployeeName" Style="font-family: Verdana; font-size: 13px;
                                    color: #0c416f; font-weight: normal;"></asp:Label>
                            </td>
                            <td align="right">
                            </td>
                        </tr>
                        <tr style="padding-right: 5px; padding-left: 1px; padding-bottom: 1px; padding-top: 1px;
                            background-color: lightsteelblue;">
                            <td colspan="2">
                                <hr />
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:Image ID="EmployeeBioPhoto" runat="server" BackColor="#666666" Height="142px" 
                                                Width="131px" />
                                            <br />
                                            <br />
                                            <asp:FileUpload ID="fileUploadImg" runat="server" Width="183px" />
                                            &nbsp; &nbsp;
                                            <asp:Button ID="btnClearLogo" runat="server" Text="ClearImage" />&nbsp;
                                            <asp:Button ID="btnSave" runat="server" Text="Update" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblError" runat="server" Style="color: red" Width="409px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="background-color: lightsteelblue; padding-bottom: 5px;">
                                <hr />
                                &nbsp;&nbsp;<a style="font-family: Verdana; font-size: 13px; color: #0c416f; text-decoration: underline;"
                                    href="Employees.aspx">« Go to Employees</a><asp:HiddenField ID="EmployeeId" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>