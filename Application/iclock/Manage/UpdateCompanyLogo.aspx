<%@ page language="VB" autoeventwireup="false" inherits="Manage_UpdateCompanyLogo, App_Web_usmjemmz" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                <td style="font-weight: bold;">
                    Update Company Logo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label
                        runat="server" ID="lbl_CompanyName" Style="font-family: Verdana; font-size: 13px;
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
                                <asp:Image ID="CompanyLogo" runat="server" Height="80" Width="230" BackColor="#666666" />
                                <br />
                                <br />
                                <asp:FileUpload ID="fileUploadImg" runat="server" />
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                 <asp:Button ID="btnClearLogo" runat="server" Text="ClearLogo" />&nbsp; &nbsp; <asp:Button ID="btnSave" runat="server" Text="Update" />
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
                    &nbsp;&nbsp;<a style="font-family: Verdana; font-size: 13px; color: #0c416f;" href="Companies.aspx">«
                        Go to Companies</a><asp:HiddenField ID="CompanyId" runat="server" /><asp:HiddenField ID="ClearLogo" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
