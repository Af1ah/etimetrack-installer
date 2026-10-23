<%@ page language="VB" autoeventwireup="false" inherits="Covid19Dashboard, App_Web_wdniqpox" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <script type="text/javascript">

        
         function OpenDeviceLogsPage(Type) {

             var temp = document.getElementById("Hidden_Temp").value;
             var SDate = document.getElementById("Hidden_Date").value;
             window.location.href = 'Manage/Covid19DeviceLogList.aspx?RecordsType='+ Type +'&MaxTemp=' + temp + '&SelectedDate='+ SDate +'';
         }
	
    </script>


</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <table cellpadding="0" cellspacing="0" style="width: 84%">
                <tr>
                    <td colspan="3" style="border-bottom: lightgrey thin solid; height: 62px; background-color: #e7edf2">
                        <h1>
                            &nbsp; <span style="font-family: Bell MT"><span style="font-size: 18pt; color: black">
                                Covid-19 Dashboard</span> <small><span style="font-size: 11pt; color: silver">Biometric
                                    Attendance System</span></small> </span>
                        </h1>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="vertical-align: middle; border-bottom: lightgrey thin solid;
                        background-color: ghostwhite; text-align: center; border-bottom-color: #0099CC;">
                        <br />
                        <table cellpadding="0" cellspacing="0" style="width: 50%">
                            <tr>
                                <td>
                                    <center>
                                        <table cellpadding="0" cellspacing="0" 
                                            style="color: #0033CC; font-weight: bold; width: 508px;">
                                            <tr>
                                                <td>
                                                    Date
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="Drp_DateDD" runat="server" CssClass="WebControls">
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="Drp_DateMM" runat="server" CssClass="WebControls">
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="Drp_DateYYYY" runat="server" CssClass="WebControls">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    Normal&nbsp;Temp.up&nbsp;to
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_NormalTemp" runat="server" Text="38" Width="38px"></asp:TextBox>
                                                    &nbsp;°C
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:Button ID="btn_Refresh" runat="server" Text="Refresh" />
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:Label ID="lblError" runat="server" ForeColor="#FF3300"></asp:Label>
                                        <br />
                                    </center>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="vertical-align: middle; border-bottom: lightgrey thin solid;
                        background-color: ghostwhite; text-align: center">
                        <br />
                       
                        <center>
                            <table style="padding-left: 11px; width: 96%">
                                <tr>
                                    <td style="vertical-align: middle; width: 25%; text-align: center">
                                        <div style="width: 98%; height: 97%; background-color: #90b030">
                                            <!-- small box -->
                                            <div style="width: 100%">
                                                <div style="background-color: #a1c436">
                                                    <h3 style="text-align: left">
                                                       <a href="javascript:OpenDeviceLogsPage('Normal');" style="font-bold: True; color: Black; font-weight: 700;
                                                            width: 271px;" id="anchor_NormalTempCount" runat="server">0 </a>
                                                    </h3>
                                                    <p style="font-size: 16px; text-align: left">
                                                        Normal Count
                                                    </p>
                                                </div>
                                                <div style="width: 1%">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="vertical-align: middle; width: 25%; text-align: center">
                                        <div style="width: 98%; height: 97%; background-color: #e57718">
                                            <!-- small box -->
                                            <div style="width: 100%">
                                                <div style="background-color: #ff851b">
                                                    <h3 style="text-align: left">
                                                        <a href="javascript:OpenDeviceLogsPage('High');" style="font-bold: True; color: Black; font-weight: 700;
                                                            width: 271px;" id="anchor_HighTempCount" runat="server">0 </a>
                                                    </h3>
                                                    <p style="font-size: 16px; text-align: left">
                                                        High Temperature Count
                                                    </p>
                                                </div>
                                                <div style="width: 1%">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="vertical-align: middle; width: 25%; text-align: center">
                                        <div style="width: 98%; height: 97%; background-color: #99703d">
                                            <!-- small box -->
                                            <div style="width: 100%">
                                                <div style="background-color: #ab7d44">
                                                    <h3 style="text-align: left">
                                                        <a href="javascript:OpenDeviceLogsPage('WithoutMask');" style="
                                                            font-bold: True; color: Black; font-weight: 700; width: 271px;" id="anchor_WithoutMaskCount" runat="server">
                                                            0 </a>
                                                    </h3>
                                                    <p style="font-size: 16px; text-align: left">
                                                        Without Mask Count
                                                    </p>
                                                </div>
                                                <div style="width: 1%">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            
                        </center>
                        <br />
                        
                    </td>
                </tr>
                <tr style="font-size: 10pt; font-family: Verdana">
                    <td colspan="3" style="text-align: center">
                        <span style="color: #006699">&nbsp; </span>
                    </td>
                </tr>
                <tr style="font-family: Verdana">
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <asp:HiddenField ID="Hidden_Temp" runat="server" />
                <asp:HiddenField ID="Hidden_Date" runat="server" />
            </table>
        </center>
    </div>
    </form>
</body>
</html>
