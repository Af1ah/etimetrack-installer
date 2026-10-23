<%@ page language="VB" autoeventwireup="false" inherits="Utilities_ExportAttendanceLogs, App_Web_vcxdl3a3" enableeventvalidation="false" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
<body onload="drp_DatabaseType_OnChange();Chk_ReservedField_ChekChange();chk_IsParallelDatabaseExport_onclick();">
    <form id="form1" runat="server">
    <div>
            <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="Wnd_ParallelDatabaseExport" runat="server"  Height="880" Width="670" StyleFolder="~/Styles/mainwindow/blue" Title="Export Attendance Logs" ShowCloseButton="false"  ShowStatusBar="False" Left="350" Top="100">
            <table class="rowEditTable"  width="100%"  cellpadding="1"  style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;height:100%">
                <tr>
                    <td>
                        <fieldset>
                            <legend><asp:CheckBox ID="chk_IsParallelDatabaseExport" onclick="chk_IsParallelDatabaseExport_onclick();" Text=" Is Parallel Database Export" runat="server" /></legend>
                                
                            <table id="table_ParallelDatabaseExport">
                            <tr>
                            <td style="font-weight: bold;">Database Type</td>
                            <td>
                                <asp:DropDownList ID="drp_DatabaseType" runat="server" Width="152px" onchange="drp_DatabaseType_OnChange();" >
                                <asp:ListItem>MS SQL Server</asp:ListItem>
                                <asp:ListItem>Oracle</asp:ListItem>
                                <asp:ListItem>My Sql</asp:ListItem>
                                <asp:ListItem>MS Access</asp:ListItem>
                                </asp:DropDownList>
                             </td>
                           <td>Service</td>  
                           <td><asp:TextBox ID="txt_Service" runat="server" Width="100px"></asp:TextBox></td>
                           <td>Port</td>
                           <td><asp:TextBox ID="txt_Port" runat="server" Width="50px"></asp:TextBox></td>
                            </tr>
                            
                            <tr>
                            <td>
                            DB Path
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="txt_DBPath" runat="server" Width="500px"></asp:TextBox>
                            </td>
                            </tr>
                            
                            <tr>
                            <td style="font-weight: bold;">Server Name/IP</td>
                            <td>
                                <asp:TextBox ID="txt_Ip" runat="server"></asp:TextBox>
                             </td>
                           <td colspan="4" style="font-weight: bold;">Database Name&nbsp;
                                <asp:TextBox ID="txt_DBName" runat="server" Width="210px" ></asp:TextBox>
                           </td>  
                            </tr>
                            
                             <tr>
                            <td>User Name</td>
                            <td>
                                <asp:TextBox ID="txt_UserName" runat="server"></asp:TextBox>
                             </td>
                           <td colspan="4">
                               &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Password&nbsp;
                                <asp:TextBox ID="txt_Password" TextMode="Password" runat="server" Width="210px"></asp:TextBox>
                           </td>  
                            </tr>
                            
                           <tr>
                            <td style="font-weight: bold;">Table Name</td>
                            <td colspan="5">
                                <asp:TextBox ID="txt_TableName" runat="server" Width="490px" ></asp:TextBox>
                           </td>  
                            </tr>
                            
                            
                            <tr>
                            <td colspan="6">
                            <fieldset>
                            <legend>Table Field Mapping</legend>
                            <table>
                            <tr>
                            <td >Attendance Date=</td>
                            <td><asp:TextBox ID="txt_AttendanceDate"  runat="server" Width="192px"></asp:TextBox></td>
                             <td>
                            Format
                            </td>
                            <td><asp:TextBox ID="txt_AttendanceDateFormat" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                              <tr>
                            <td>Employee Code=</td>
                            <td><asp:TextBox ID="txt_EmployeeCode" runat="server" Width="192px"></asp:TextBox></td>
                            <td>Employee Name=</td>
                            <td><asp:TextBox ID="txt_EmployeeName" runat="server" Width="192px"></asp:TextBox>
                            </tr>
                           
                            
                            
                            
                               <tr>
                            <td>Company=</td>
                            <td ><asp:TextBox ID="txt_Company" runat="server" Width="192px"></asp:TextBox></td>
                            <td>Department=</td>
                            <td ><asp:TextBox ID="txt_Department" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                               <tr>
                            
                            </tr>
                            
                             <tr>
                            <td>Category=</td>
                            <td ><asp:TextBox ID="txt_Ctegory" runat="server" Width="192px"></asp:TextBox></td>
                            <td>Designation=</td>
                            <td ><asp:TextBox ID="txt_Designation" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                             
                            
                             <tr>
                            <td>Emp Type=</td>
                            <td ><asp:TextBox ID="txt_EmployementType" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            
                            
                            
                             <tr>
                            <td>In Date=</td>
                            <td><asp:TextBox ID="txt_InDate" runat="server" Width="192px"></asp:TextBox></td>
                            <td>
                            Format
                            </td>
                            <td><asp:TextBox ID="txt_InDateFormat" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            <tr>
                            <td>In Time=</td>
                            <td><asp:TextBox ID="txt_InTime" runat="server" Width="192px"></asp:TextBox></td>
                            <td>
                            Format
                            </td>
                            <td><asp:TextBox ID="txt_InTimeFormat" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                             <tr>
                            <td>In Device Name=</td>
                            <td ><asp:TextBox ID="txt_InDeviceName" runat="server" Width="192px"></asp:TextBox></td>
                            <td>In Loc Name=</td>
                            <td ><asp:TextBox ID="txt_InLocationName" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            
                            
                            
                            
                              <tr>
                            <td>Out Date=</td>
                            <td><asp:TextBox ID="txt_OutDate" runat="server" Width="192px"></asp:TextBox></td>
                            <td>
                            Format
                            </td>
                            <td><asp:TextBox ID="txt_OutDateFormat" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            <tr>
                            <td>Out Time=</td>
                            <td><asp:TextBox ID="txt_OutTime" runat="server" Width="192px"></asp:TextBox></td>
                            <td>
                            Format
                            </td>
                            <td><asp:TextBox ID="txt_OutTimeFormat" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                             <tr>
                            <td>Out Device Name=</td>
                            <td ><asp:TextBox ID="txt_OutDeviceName" runat="server" Width="192px"></asp:TextBox></td>
                             <td>Out Loc Name=</td>
                            <td ><asp:TextBox ID="txt_OutLocationName" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            
                            
                            
                             <tr>
                            <td>Status=</td>
                            <td ><asp:TextBox ID="txt_Status" runat="server" Width="192px"></asp:TextBox></td>
                            <td>Status Code=</td>
                            <td ><asp:TextBox ID="txt_StatusCode" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            
                             <tr>
                            <td>Duration=</td>
                            <td ><asp:TextBox ID="txt_Duration" runat="server" Width="192px"></asp:TextBox></td>
                            <td>Late By=</td>
                            <td ><asp:TextBox ID="txt_LateBy" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            
                             <tr>
                            <td>Early By=</td>
                            <td ><asp:TextBox ID="txt_EarlyBy" runat="server" Width="192px"></asp:TextBox></td>
                            <td>Over Time=</td>
                            <td ><asp:TextBox ID="txt_OverTime" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            
                             <tr>
                            <td>Is On Leave=</td>
                            <td ><asp:TextBox ID="txt_IsOnLeave" runat="server" Width="192px"></asp:TextBox></td>
                            <td>Leave Type=</td>
                            <td ><asp:TextBox ID="txt_LeaveType" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            
                             <tr>
                            <td>Is On OD=</td>
                            <td ><asp:TextBox ID="txt_IsOnOD" runat="server" Width="192px"></asp:TextBox></td>
                            <td>OD Duration=</td>
                            <td ><asp:TextBox ID="txt_ODDuration" runat="server" Width="192px"></asp:TextBox></td>
                            </tr>
                            
                            
                            
                             <tr>
                            <td>Punch Records=</td>
                            <td ><asp:TextBox ID="txt_PunchRecords" runat="server" Width="192px"></asp:TextBox></td>
                            <td>Shift Name=</td>
                            <td ><asp:TextBox ID="txt_ShiftName" runat="server" Width="192px"></asp:TextBox></td>
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
                            <td><asp:CheckBox ID="chk_ReservedField1" runat="server" Text="Reserved Field 1=&nbsp;  " onclick="Chk_ReservedField_ChekChange();"  /></td>
                            <td><asp:TextBox ID="txt_ReservedField1" runat="server" Width="160px"></asp:TextBox></td>
                            <td>
                                &nbsp;&nbsp; Value</td>
                            <td><asp:TextBox ID="txt_ReservedField1Value" runat="server" Width="188px"></asp:TextBox></td>
                            </tr>
                            
                            <tr>
                            <td><asp:CheckBox ID="chk_ReservedField2"  runat="server"  Text="Reserved Field 2=&nbsp;" onclick="Chk_ReservedField_ChekChange();"  /></td>
                            <td><asp:TextBox ID="txt_ReservedField2" runat="server" Width="160px"></asp:TextBox></td>
                            <td>
                                &nbsp;&nbsp; Value</td>
                            <td><asp:TextBox ID="txt_ReservedField2Value" runat="server" Width="188px"></asp:TextBox></td>
                            </tr>
                            
                            <tr>
                            <td><asp:CheckBox ID="chk_ReservedField3"  runat="server"  Text="Reserved Field 3=&nbsp;" onclick="Chk_ReservedField_ChekChange();"  /></td>
                            <td><asp:TextBox ID="txt_ReservedField3" runat="server" Width="160px"></asp:TextBox></td>
                            <td>
                                &nbsp;&nbsp; Value</td>
                            <td><asp:TextBox ID="txt_ReservedField3Value" runat="server" Width="188px"></asp:TextBox></td>
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
                        <td >
                        <table>
                        <tr>
                        <td align="left" style="width:520px">
                            <asp:Button ID="btn_TestConnection" runat="server" Text="Test Connection"  />
                        </td>
                        <td align="right">
                        <asp:Button ID="Btn_Save" runat="server" Text="Save" />&nbsp;&nbsp;
                            <input id="btn_Cancel" type="button" value="Close" OnClick="Wnd_ParallelDatabaseExport.Close();" />&nbsp;&nbsp;
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
        function drp_DatabaseType_OnChange()
        {
                document.getElementById("<%=txt_Ip.ClientID %>").disabled=false;
            document.getElementById("<%=txt_Service.ClientID %>").disabled=false;
            document.getElementById("<%=txt_Port.ClientID %>").disabled=false;
            document.getElementById("<%=txt_Ip.ClientID %>").disabled=false;
            document.getElementById("<%=txt_DBName.ClientID %>").disabled=false;
            document.getElementById("<%=txt_UserName.ClientID %>").disabled=false;
            document.getElementById("<%=txt_Password.ClientID %>").disabled=false;
            var DatabaseType=document.getElementById("<%=drp_DatabaseType.ClientID %>").value;
            
            if(DatabaseType=='MS SQL Server')
            {
                document.getElementById("<%=txt_Service.ClientID %>").disabled=true;
                document.getElementById("<%=txt_Port.ClientID %>").disabled=true;
                document.getElementById("<%=txt_DBPath.ClientID %>").disabled=true;
                
            }
            
            else if(DatabaseType=='Oracle')
            {
                document.getElementById("<%=txt_DBName.ClientID %>").disabled=true;
                document.getElementById("<%=txt_DBPath.ClientID %>").disabled=true;
                
            }
            
            else if(DatabaseType=='My Sql')
            {
                document.getElementById("<%=txt_Service.ClientID %>").disabled=true;
                document.getElementById("<%=txt_DBPath.ClientID %>").disabled=true;
                
            }
            
             if(DatabaseType=='MS Access')
            {
                document.getElementById("<%=txt_Service.ClientID %>").disabled=true;
                document.getElementById("<%=txt_Port.ClientID %>").disabled=true;
                document.getElementById("<%=txt_DBName.ClientID %>").disabled=true;
                document.getElementById("<%=txt_Service.ClientID %>").disabled=true;
                document.getElementById("<%=txt_UserName.ClientID %>").disabled=true;
                document.getElementById("<%=txt_Password.ClientID %>").disabled=true;
                document.getElementById("<%=txt_Ip.ClientID %>").disabled=true;
                document.getElementById("<%=txt_DBPath.ClientID %>").disabled=false;
                
            }
        }
        
        function chk_IsParallelDatabaseExport_onclick()
        {
            if(document.getElementById("<%=chk_IsParallelDatabaseExport.ClientID %>").checked)
            {
                document.getElementById("table_ParallelDatabaseExport").disabled=false;
            }
            else
            {
                document.getElementById("table_ParallelDatabaseExport").disabled=true;
            }
            
        }
        
        function Chk_ReservedField_ChekChange()
        {
            if(document.getElementById("<%=chk_ReservedField1.ClientID %>").checked)
            {
                document.getElementById("<%=txt_ReservedField1.ClientID %>").disabled=false;
            }
            else
            {
                document.getElementById("<%=txt_ReservedField1.ClientID %>").disabled=true;
            }
            
            if(document.getElementById("<%=chk_ReservedField2.ClientID %>").checked)
            {
                document.getElementById("<%=txt_ReservedField2.ClientID %>").disabled=false;
            }
            else
            {
                document.getElementById("<%=txt_ReservedField2.ClientID %>").disabled=true;
            }
            
            if(document.getElementById("<%=chk_ReservedField3.ClientID %>").checked)
            {
                document.getElementById("<%=txt_ReservedField3.ClientID %>").disabled=false;
            }
            else
            {
                document.getElementById("<%=txt_ReservedField3.ClientID %>").disabled=true;
            }
        }
    </script>
</body>
</html>
