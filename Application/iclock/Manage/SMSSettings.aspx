<%@ page language="VB" autoeventwireup="false" inherits="Manage_SMSSettings, App_Web_usmjemmz" validaterequest="false" enableEventValidation="false" %>

<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body onload="SetDuration();" background="../Images/bck1.gif" style="background-repeat: no-repeat;
    background-position-x: right; background-position-y: top;">
    <form id="form1" runat="server">
    <owd:Window ID="wnd_SMSSettings" runat="server" IsModal="true" Height="490" Width="900"
        StyleFolder="~/Styles/mainwindow/blue" Title="SMS Settings" ShowCloseButton="false"
        ShowStatusBar="False" Left="50" Top="50">
        <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
            border-right-style: none; border-left-style: none; border-bottom-style: none;">
            <tr>
                <td>
                    <fieldset>
                        <legend>SMS&nbsp;Settings</legend>
                        <table>
                            <tr>
                                <td align="left" colspan="2">
                                    <asp:CheckBox ID="chk_EnableSMS" runat="server" Text=" Enable SMS" />&nbsp;for&nbsp;new&nbsp;punch&nbsp;recieved&nbsp;in&nbsp;Last&nbsp;
                                    <asp:DropDownList ID="ddl_DiffInHr" runat="server">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;in&nbsp;Hrs
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
                                    <asp:CheckBox ID="chk_SinglePunch" runat="server" />&nbsp;Send&nbsp;Only&nbsp;For&nbsp;Single&nbsp;Punch
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    URL&nbsp;Name
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_URLName" runat="server" Width="650px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    SMS&nbsp;Text&nbsp;Format
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_SMSTextFormat" runat="server" Width="650px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
                                    <asp:CheckBox ID="chk_IsAbsentSMS" AutoPostBack="true" runat="server" />&nbsp;Send&nbsp;SMS&nbsp;For&nbsp;Absentees
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Absent&nbsp;Text&nbsp;Format
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_AbsentTextFormat" runat="server" Width="650px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Absent&nbsp;Begin&nbsp;Time
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" onchange="SetDuration();" ID="drp_HHBeginTime">
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:DropDownList runat="server" onchange="SetDuration();" ID="drp_mmBeginTime">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Absent&nbsp;End&nbsp;Time
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" onchange="SetDuration();" ID="drp_HHEndTime">
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:DropDownList runat="server" onchange="SetDuration();" ID="drp_mmEndTime">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Last&nbsp;Run&nbsp;Date
                                </td>
                                <td>
                                    <select runat="server" id="drp_ddFromDate">
                                    </select>
                                    &nbsp;<select runat="server" id="drp_mmFromDate"></select>&nbsp;<select runat="server"
                                        id="drp_yyyyFromDate"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    Mobile&nbsp;Number&nbsp;To&nbsp;Test
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_SMSMobNo" runat="server" Width="225px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td style="color: Blue;">
                    <table>
                        <tr>
                            <td style="color: Blue;">
                                Note:Please do not change the mentioned text format.
                            </td>
                        </tr>
                        <tr>
                            <td style="color: Blue;">
                                EmployeeCode=<<&lt;EmployeeCode>>>
                            </td>
                        </tr>
                        <tr>
                            <td style="color: Blue;">
                                EmployeeName=<<&lt;EmployeeName>>>
                            </td>
                        </tr>
                        <tr>
                            <td style="color: Blue;">
                                LogDate=<<&lt;LogDate>>>
                            </td>
                        </tr>
                        <tr>
                            <td style="color: Blue;">
                                LogTime=<<&lt;LogTime>>>
                            </td>
                        </tr>
                       
                        <tr>
                            <td style="color: Blue;">
                                EX1: <<&lt;EmployeeCode>>> : <<&lt;EmployeeName>>> punched at <<&lt;LogDate>>> :
                                <<&lt;LogTime>>> 
                            </td>
                        </tr>
                        <tr>
                            <td style="color: Blue;">
                                EX2: <<&lt;EmployeeCode>>> : <<&lt;EmployeeName>>> is absent on <<&lt;LogDate>>>.
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Button ID="btn_TestSMS" runat="server" Text="Send Test SMS" />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_Save" runat="server" Text="Save" />
                                <input id="btn_Cancel" type="button" value="Close" onclick="wnd_SMSSettings.Close();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="background-color: #EEEEEE;">
                <td style="background-color: #EEEEEE;">
                    <asp:Label ID="Lbl_Error" runat="server" Style="background-color: #EEEEEE;" EnableViewState="False"
                        ForeColor="Red"></asp:Label><br />
                    <br />
                </td>
            </tr>
        </table>
    </owd:Window>
    </form>
    <script type="text/javascript">

        function SetDuration() {
            var HHBeginTime = parseInt(document.getElementById("<%=drp_HHBeginTime.ClientID%>").value);
            if (document.getElementById("<%=drp_HHBeginTime.ClientID%>").value == '08')
                HHBeginTime = 8;
            else if (document.getElementById("<%=drp_HHBeginTime.ClientID%>").value == '09')
                HHBeginTime = 9;

            var mmBeginTime = parseInt(document.getElementById("<%=drp_mmBeginTime.ClientID%>").value);
            if (document.getElementById("<%=drp_mmBeginTime.ClientID%>").value == '08')
                mmBeginTime = 8;
            else if (document.getElementById("<%=drp_mmBeginTime.ClientID%>").value == '09')
                mmBeginTime = 9;

            var HHEndTime = parseInt(document.getElementById("<%=drp_HHEndTime.ClientID%>").value);
            if (document.getElementById("<%=drp_HHEndTime.ClientID%>").value == '08')
                HHEndTime = 8;
            else if (document.getElementById("<%=drp_HHEndTime.ClientID%>").value == '09')
                HHEndTime = 9;

            var mmEndTime = parseInt(document.getElementById("<%=drp_mmEndTime.ClientID%>").value);
            if (document.getElementById("<%=drp_HHEndTime.ClientID%>").value == '08')
                HHEndTime = 8;
            else if (document.getElementById("<%=drp_HHEndTime.ClientID%>").value == '09')
                HHEndTime = 9;

            var Hours;
            if (HHEndTime < HHBeginTime)
                HHEndTime = HHEndTime + 24;
            else if (HHEndTime == HHBeginTime && mmBeginTime > mmEndTime)
                HHEndTime = HHEndTime + 24;

            Hours = (HHEndTime - HHBeginTime) * 60;
            var Minuts = mmEndTime - mmBeginTime;
            var TotalDuration = Hours + Minuts;


        }
		    
    </script>
</body>
</html>
