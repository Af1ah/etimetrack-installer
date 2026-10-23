<%@ page language="VB" autoeventwireup="false" inherits="ExtendEvalution, App_Web_wdniqpox" enableeventvalidation="false" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
       
        <owd:Window ID="ExtendEvalutionDialog" runat="server" StyleFolder="~/Styles/mainwindow/blue"
            Title="Extend Evaluation" VisibleOnLoad="true" Width="370" Height="110"
            ShowCloseButton="true" Left="50" Top="50" ShowStatusBar="false">
            <table width="100%" height="100%" cellspacing="0" cellpadding="1" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none;
                border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Extend Evaluation</legend>
                            <table>
                               
                                <tr>
                                    <td>
                                        Verification Code:</td>
                                    <td>
                                        <asp:TextBox ID="txt_VerificationCode" runat="server"></asp:TextBox>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label runat="server" ID="lbl_Message" ForeColor="Red" Text="&nbsp;" EnableViewState="False"></asp:Label>&nbsp;&nbsp;&nbsp;<input
                            type="button" id="btn_Extend" runat="server"
                            value="Extend" />&nbsp;&nbsp;<input
                            type="button" id="Button1"  onclick="ExtendEvalutionDialog.Close();"
                            value="Close" />
                    </td>
                </tr>
            </table>
        </owd:Window>
    </form>
</body>
</html>
