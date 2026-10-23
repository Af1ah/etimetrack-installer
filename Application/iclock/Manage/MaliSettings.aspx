<%@ page language="VB" autoeventwireup="false" inherits="Manage_MaliSettings, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body background="../Images/bck1.gif"
    style="background-repeat: no-repeat; background-position-x: right; background-position-y: top;">
    <form id="form1" runat="server">
        
        <owd:Window ID="wnd_MaliSettings" runat="server" IsModal="true" Height="220" 
            Width="480" StyleFolder="~/Styles/mainwindow/blue" Title="Mail Settings"
             ShowCloseButton="false" ShowStatusBar="False" Left="50"   
            Top="100" >
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Mail Settings</legend>
                            <table>
                                <tr>
                                <td  align="left">
                                        eMail Id
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_eMailId" runat="server" Width="270px"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td align="left">
                                        SMTP Server
                                    </td>
                                    <td >
                                        <asp:TextBox ID="Txt_SMTPServer" runat="server" Width="170px"></asp:TextBox>&nbsp;Port&nbsp;<asp:TextBox ID="txt_PortNo" runat="server" Width="60px"></asp:TextBox>
                                        </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        User Name
                                     </td>
                                    <td>
                                        <asp:TextBox ID="Txt_UserName" runat="server" Width="140px"></asp:TextBox>&nbsp;<asp:CheckBox runat="server" ID="chk_Enable_SSL" Text="Enable SSL" />
                                        </td>
                                </tr>
                                
                                <tr>
                                    <td  align="left">
                                        <asp:Label ID="Lbl_DatabaseCode" runat="server" Text="Password" Width="168px"></asp:Label>
                                    </td>
                                    <td >
                                        <asp:HiddenField ID="lblSMTPPassword" runat="server" /><asp:TextBox ID="Txt_MailSettingsCode" runat="server" Width="100px" TextMode="Password"></asp:TextBox></td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <input type="button" id="btn_TestMail" value="Send Test Mail" onclick="SetDivPosition();wnd_SendTestMail.Open();" />
                                    </td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="Btn_Save" runat="server" Text="Save" />
                                        <input id="btn_Cancel" type="button" value="Close" onclick="wnd_MaliSettings.Close();" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="background-color: #EEEEEE;">
                        <td style="background-color: #EEEEEE;">
                            <asp:Label ID="Lbl_Error" runat="server" Style="background-color: #EEEEEE;" 
                                EnableViewState="False" ForeColor="Red"></asp:Label><br /><br />
                        </td>
                    </tr>
                    
            </table>
        </owd:window>
        
        <owd:Window ID="wnd_SendTestMail" runat="server" ShowCloseButton="False" VisibleOnLoad="false" 
            Height="125" Width="360" StyleFolder="~/Styles/mainwindow/blue"
            Title="Send Test Mail" IsModal="True" ShowStatusBar="False" Left="130" Top="100">
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Send Test Mail</legend>
                            <table>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;To &nbsp;<asp:TextBox ID="txt_eMailToSend" runat="server"  Width="260px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                            
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td>
                    <table>
                    <tr>
                    <td align="right" width="235px">
                    <asp:Label ID="lbl_SendMailError" runat="server"  EnableViewState="False" ForeColor="Red" Text="&nbsp;"></asp:Label>
                    </td>
                    <td align="right">
                    <asp:Button ID="btn_SendMail"  runat="server" Text="Send" />  <input id="Button2"  type="button" value="Close" onclick="wnd_SendTestMail.Close();" />
                    </td>
                    </tr>
                    </table>
                    </td>
                </tr>
                <tr>
                <td>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </owd:Window>
        
        
    </form>
<script type="text/javascript">
    function SetDivPosition()
    {
        document.getElementById('wnd_SendTestMail_container').style.zIndex = 1000000000;
        document.getElementById('wnd_SendTestMail_container').style.position='absolute';
        document.getElementById('<%=txt_eMailToSend.ClientId %>').value='';
        document.getElementById('<%=lbl_SendMailError.ClientId %>').innerHTML='';
    }
</script>
</body>
</html>

