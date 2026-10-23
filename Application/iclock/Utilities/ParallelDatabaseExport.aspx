<%@ page language="VB" autoeventwireup="false" inherits="Utilities_ParallelDatabaseExport, App_Web_vcxdl3a3" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body onload="drp_DatabaseType_OnChange();Chk_ReservedField_ChekChange();chk_IsParallelDatabaseExport_onclick();">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="Wnd_ParallelDatabaseExport" runat="server" Height="640" Width="710" 
            StyleFolder="~/Styles/mainwindow/blue" Title="Parallel Database Export" ShowCloseButton="false"
            ShowStatusBar="False" Left="350" Top="10">
            <table class="rowEditTable" width="100%" cellpadding="1" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;
                height: 100%; ">
                <tr>
                    <td>
                        <fieldset>
                            <legend>
                                <asp:CheckBox ID="chk_IsParallelDatabaseExport" onclick="chk_IsParallelDatabaseExport_onclick();"
                                    Text=" Is Parallel Database Export" runat="server" /></legend>
                            <table id="table_ParallelDatabaseExport">
                                <tr>
                                    <td style="font-weight: bold;">
                                        Database Type
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_DatabaseType" runat="server" Width="152px" onchange="drp_DatabaseType_OnChange();">
                                            <asp:ListItem>MS SQL Server</asp:ListItem>
                                            <asp:ListItem>Oracle</asp:ListItem>
                                            <asp:ListItem>My Sql</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td colspan="4">
                                        Service &nbsp;<asp:TextBox ID="txt_Service" runat="server" Width="100px"></asp:TextBox>&nbsp;Port&nbsp;<asp:TextBox
                                            ID="txt_Port" runat="server" Width="50px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Server Name/IP
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_Ip" runat="server"></asp:TextBox>
                                    </td>
                                    <td colspan="4" style="font-weight: bold;">
                                        Database Name&nbsp;
                                        <asp:TextBox ID="txt_DBName" runat="server" Width="213px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        User Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_UserName" runat="server"></asp:TextBox>
                                    </td>
                                    <td colspan="4">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Password&nbsp;
                                        <asp:TextBox ID="txt_Password" TextMode="Password" runat="server" Width="210px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Table Name
                                    </td>
                                    <td colspan="5">
                                        <asp:TextBox ID="txt_TableName" runat="server" Width="515px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <fieldset>
                                            <legend>Table Field Mapping</legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        Employee&nbsp;Code=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_EmployeeCode" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                     Emp.&nbsp;Device&nbsp;Code=
                                                    </td>
                                                    <td>
                                                     <asp:TextBox ID="txt_EmployeeCodeInDevice" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Log&nbsp;DateTime=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_LogDateTime" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td colspan="2">
                                                        Format&nbsp;
                                                        <asp:TextBox ID="txt_LogDateTimeFormat" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Log&nbsp;Date=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_LogDate" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td colspan="2">
                                                        Format&nbsp;
                                                        <asp:TextBox ID="txt_LogDateFormat" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Log&nbsp;Time=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_LogTime" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td colspan="2">
                                                        Format&nbsp;
                                                        <asp:TextBox ID="txt_LogTimeFormat" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Log&nbsp;DateTime2=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_LogDateTime2" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td colspan="2">
                                                        Format&nbsp;
                                                        <asp:TextBox ID="txt_LogDateTime2Format" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>
                                                        Log&nbsp;Date=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_LogDate2" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td colspan="2">
                                                        Format&nbsp;
                                                        <asp:TextBox ID="txt_LogDate2Format" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Log&nbsp;Time=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_LogTime2" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td colspan="2">
                                                        Format&nbsp;
                                                        <asp:TextBox ID="txt_LogTime2Format" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Download&nbsp;DateTime=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_DownloadDateTime" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td colspan="2">
                                                        Format&nbsp;
                                                        <asp:TextBox ID="txt_DownloadDatetimeFormat" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Direction=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_Direction" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td colspan="2">
                                                        IN &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:TextBox ID="txt_InValue" Width="73px" runat="server"></asp:TextBox>&nbsp;Out
                                                        <asp:TextBox ID="txt_OutValue" Width="83px" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Work&nbsp;Code=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_WorkCode" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        Device&nbsp;Short&nbsp;Name=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_DeviceShortName" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Serial&nbsp;Number=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_SerialNumb" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        Verification&nbsp;Mode=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_VerifyMode" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Att&nbsp;Photo=
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_AttPhoto" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                    Device&nbsp;Id=
                                                    </td>
                                                    <td>
                                                     <asp:TextBox ID="txt_DeviceId" runat="server" Width="192px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <fieldset>
                                            <legend>Reserved Fields</legend>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="chk_ReservedField1" runat="server" Text="Reserved Field 1=&nbsp;  "
                                                            onclick="Chk_ReservedField_ChekChange();" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_ReservedField1" runat="server" Width="160px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;&nbsp; Value
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_ReservedField1Value" runat="server" Width="188px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="chk_ReservedField2" runat="server" Text="Reserved Field 2=&nbsp;"
                                                            onclick="Chk_ReservedField_ChekChange();" />
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_ReservedField2" runat="server" Width="160px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        &nbsp;&nbsp; Value
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_ReservedField2Value" runat="server" Width="188px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
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
                                <td align="left" style="width: 520px">
                                    <asp:Button ID="btn_TestConnection" runat="server" Text="Test Connection" />
                                     &nbsp;&nbsp;
                                    <asp:Button ID="btn_ManualExportToParallelDB" runat="server" Text="Manual Export To Parallel DB" />
                                </td>
                                <td align="right">
                                    <asp:Button ID="Btn_Save" runat="server" Text="Save" />&nbsp;&nbsp;
                                    <input id="btn_Cancel" type="button" value="Close" onclick="Wnd_ParallelDatabaseExport.Close();" />&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Lbl_Error" runat="server" EnableViewState="False" Text="&nbsp;" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>
    </div>
    </form>
    <script type="text/javascript">
        function drp_DatabaseType_OnChange() {
            document.getElementById("<%=txt_Service.ClientID %>").disabled = false;
            document.getElementById("<%=txt_Port.ClientID %>").disabled = false;
            document.getElementById("<%=txt_Ip.ClientID %>").disabled = false;
            document.getElementById("<%=txt_DBName.ClientID %>").disabled = false;
            document.getElementById("<%=txt_UserName.ClientID %>").disabled = false;
            document.getElementById("<%=txt_Password.ClientID %>").disabled = false;
            var DatabaseType = document.getElementById("<%=drp_DatabaseType.ClientID %>").value;

            if (DatabaseType == 'MS SQL Server') {
                document.getElementById("<%=txt_Service.ClientID %>").disabled = true;
                document.getElementById("<%=txt_Port.ClientID %>").disabled = true;
            }

            else if (DatabaseType == 'Oracle') {
                document.getElementById("<%=txt_DBName.ClientID %>").disabled = true;
            }

            else if (DatabaseType == 'My Sql') {
                document.getElementById("<%=txt_Service.ClientID %>").disabled = true;
            }
        }

        function chk_IsParallelDatabaseExport_onclick() {
            if (document.getElementById("<%=chk_IsParallelDatabaseExport.ClientID %>").checked) {
                document.getElementById("table_ParallelDatabaseExport").disabled = false;
            }
            else {
                document.getElementById("table_ParallelDatabaseExport").disabled = true;
            }

        }

        function Chk_ReservedField_ChekChange() {
            if (document.getElementById("<%=chk_ReservedField1.ClientID %>").checked) {
                document.getElementById("<%=txt_ReservedField1.ClientID %>").disabled = false;
            }
            else {
                document.getElementById("<%=txt_ReservedField1.ClientID %>").disabled = true;
            }

            if (document.getElementById("<%=chk_ReservedField2.ClientID %>").checked) {
                document.getElementById("<%=txt_ReservedField2.ClientID %>").disabled = false;
            }
            else {
                document.getElementById("<%=txt_ReservedField2.ClientID %>").disabled = true;
            }
        }
    </script>
</body>
</html>
