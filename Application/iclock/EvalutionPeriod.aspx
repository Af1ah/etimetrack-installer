<%@ page language="VB" autoeventwireup="false" inherits="Admin_EvalutionPeriod, App_Web_wdniqpox" enableeventvalidation="false" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <owd:Dialog ID="wnd_EvalutionPeriodMessageWindow" runat="server" Height="101" Width="300"
            StyleFolder="~/Styles/mainwindow/blue" Title="Evalution Period" IsModal="False"
            ShowCloseButton="False">
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset style="width: 280px">
                            <legend>Evalution Period</legend>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_Evalution" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btn_EvalutionOk" runat="server" Text="Ok" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Dialog>
    </div>
    </form>
</body>
</html>
