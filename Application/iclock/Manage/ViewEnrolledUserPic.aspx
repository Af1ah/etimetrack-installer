<%@ page language="VB" autoeventwireup="false" inherits="Manage_ViewEnrolledUserPic, App_Web_5jzv1mr3" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register Src="EmployeePhotoMenu.ascx" TagName="EmployeePhotoMenu" TagPrefix="uc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
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
                <table style="background: linear-gradient(to bottom, #4682b4 0%, #99ccff 100%);width:100%;">
                <tr>
                <td><uc1:EmployeePhotoMenu id="EmployeePhotoMenu" runat="server" />
                </td>
                </tr>
                </table>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <uctrl:header ID="MyHeader" runat="server" />
                    <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                        border-left: gray 1px solid; border-bottom: gray 1px solid;">
                        <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                            padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                            <td style="font-weight: bold;">
                                Enrolled User Pic&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label
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
                                            <asp:Image ID="EmployeePhoto" runat="server" Height="142px" Width="131px" BackColor="#666666" />
                                            <br />
                                            <br />
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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
                                &nbsp;&nbsp;<a 
                                    style="font-family: Verdana; font-size: 13px; color: #0c416f; text-decoration: underline;" 
                                    href="Employees.aspx">«
                                    Go to Employees</a><asp:HiddenField ID="EmployeeId" runat="server" />
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
