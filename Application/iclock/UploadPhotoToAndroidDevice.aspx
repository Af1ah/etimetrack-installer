<%@ page language="VB" autoeventwireup="false" inherits="UploadPhotoToAndroidDevice, App_Web_wdniqpox" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <table class="style1" style="border: thin solid #808080">
                <tr>
                    <td colspan="5" 
                        style="text-align: center; font-weight: 700; font-size: large; background-color: #99CCFF;">
                        Upload User Photos
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                       
                        Folder Path:</td>
                    <td colspan="3" style="text-align: left">
                        <asp:TextBox ID="txt_Path" runat="server" Width="276px">C:\FaceImages</asp:TextBox>
                        &nbsp;
                        &nbsp;
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Device Id</td>
                    <td colspan="3" style="text-align: left">
                        <asp:TextBox ID="txt_DeviceId" runat="server">2299</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td colspan="3" style="text-align: left">
                       
                       <asp:Button ID="btn_Upload" runat="server" 
                            Text="Add Photo Users  To DB " Width="185px" />
                           
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:Label ID="lbl_Error" runat="server"></asp:Label>
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;
                    </td>
                </tr>
            </table>
        </center>
    </div>
    </form>
</body>
</html>
