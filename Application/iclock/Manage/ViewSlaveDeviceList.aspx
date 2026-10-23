<%@ page language="VB" autoeventwireup="false" inherits="Manage_ViewSlaveDeviceList, App_Web_kgq5n2bg" enableEventValidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        record.Error = '';
        document.getElementById("<%=hdn_DeleteDeviceId.ClientID %>").value = record.DeviceId;
        if (confirm("Are you sure you want to delete? "))
            return true;
        else
            return false;
    }

    function OnDelete(record) {
        alert(record.Error);
    }

    function OnInsert(record) {
        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = record.Error;
    }
	
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
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
                    View&nbsp;Slave&nbsp;Device&nbsp;In&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label
                        runat="server" ID="lbl_DeviceName" Style="font-family: Verdana; font-size: 13px;
                        color: #0c416f; font-weight: normal;"></asp:Label>
                </td>
                <td align="right">
                </td>
            </tr>
            <tr style="padding-right: 5px; padding-left: 1px; padding-bottom: 1px; padding-top: 1px;
                background-color: lightsteelblue;">
                <td colspan="2">
                    <hr />
                    <obout:Grid ID="grid_Devices" runat="server" AllowRecordSelection="false" AllowMultiRecordSelection="false"
                        KeepSelectedRecords="true" Serialize="true" AllowPageSizeSelection="true" AllowFiltering="true"
                        AutoGenerateColumns="false" FolderStyle="~/styles/grid/styles/premiere_blue"
                        AllowAddingRecords="true" ShowLoadingMessage="false" OnRebind="RebindGrid" AllowSorting="false"
                        OnDeleteCommand="DeleteRecord">
                        <ClientSideEvents OnBeforeClientDelete="OnBeforeDelete" OnClientDelete="OnDelete" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column ID="Column2" DataField="DeviceId" Visible="False" Width="300" HeaderText="DeviceId"
                                ConvertEmptyStringToNull="False" Index="0" />
                            <obout:Column ID="Column1" DataField="DeviceSName" TemplateId="tplDeviceName" Width="115"
                                HeaderText="Device Name" ConvertEmptyStringToNull="False" Index="1">
                                <TemplateSettings TemplateId="tplDeviceName" />
                            </obout:Column>
                            <obout:Column ID="Column3" DataField="DeviceFName" Visible="False" Width="350" HeaderText="DeviceFName"
                                ConvertEmptyStringToNull="False" Index="2" />
                            <obout:Column ID="Column7" DataField="SerialNumber" Width="105" HeaderText="Serial No."
                                ConvertEmptyStringToNull="False" Index="3" />
                            <obout:Column ID="Column8" DataField="DeviceDirection" Width="70" HeaderText="Direction"
                                ConvertEmptyStringToNull="False" Index="4" />
                            <obout:Column ID="Column4" DataField="IpAddress" Visible="False" Width="300" HeaderText="IpAddress"
                                ConvertEmptyStringToNull="False" Index="5" />
                            <obout:Column ID="Column5" DataField="ConnectionType" Visible="False" Width="300"
                                HeaderText="ConnectionType" ConvertEmptyStringToNull="False" Index="6" />
                            <obout:Column ID="Column10" DataField="DeviceType" Visible="False" Width="130" HeaderText="DeviceType"
                                ConvertEmptyStringToNull="False" Index="7">
                            </obout:Column>
                            <obout:Column ID="Column11" DataField="TransactionStamp" Width="90" HeaderText="T Stamp"
                                ConvertEmptyStringToNull="False" Index="8" />
                            <obout:Column ID="Column9" DataField="OpStamp" Width="95" HeaderText="Op Stamp" ConvertEmptyStringToNull="False"
                                Index="9" />
                            <obout:Column ID="Column13" DataField="TimeZone" Width="80" HeaderText="Time Zone"
                                ConvertEmptyStringToNull="False" Index="10" />
                            <obout:Column ID="Column15" DataField="TimeOut" Visible="False" Width="120" HeaderText="TimeOut"
                                ConvertEmptyStringToNull="False" Index="11" />
                            <obout:Column ID="Column14" DataField="DeviceLocation" Width="100" HeaderText="Location"
                                ConvertEmptyStringToNull="False" Index="12">
                            </obout:Column>
                            <obout:Column ID="Column6" Width="130" HeaderText="Last Ping" DataField="LastPing"
                                ConvertEmptyStringToNull="False" Index="13" TemplateId="LastPing_Template">
                                <TemplateSettings TemplateId="LastPing_Template" />
                            </obout:Column>
                            <obout:Column ID="Column12" Width="70" HeaderText="Status" ConvertEmptyStringToNull="False"
                                Index="14" TemplateId="DeviceStatus_Template">
                                <TemplateSettings TemplateId="DeviceStatus_Template" />
                            </obout:Column>
                            <obout:Column ID="Column18" DataField="C5" Visible="False" Width="300" HeaderText="C5"
                                ConvertEmptyStringToNull="False" Index="15" />
                            <obout:Column ID="Column16" DataField="C6" Visible="False" Width="300" HeaderText="C6"
                                ConvertEmptyStringToNull="False" Index="16" />
                            <obout:Column ID="Column17" DataField="C7" Visible="False" Width="300" HeaderText="C7"
                                ConvertEmptyStringToNull="False" Index="17" />
                            <obout:Column HeaderText="Delete" Width="80" AllowDelete="True" ConvertEmptyStringToNull="False"
                                Index="18" />
                            <obout:Column ID="Column19" DataField="FaceDeviceType" Visible="false" Width="300"
                                HeaderText="FaceDeviceType" ConvertEmptyStringToNull="False" Index="19" />
                        </Columns>
                        <Templates>
                            <obout:GridTemplate runat="server" ID="tplAddBtn">
                                <Template>
                                    <asp:HyperLink runat="server" CssClass="ob_gAL" Text='<%#CheckPermissions("Add Slave Device")%>'
                                        NavigateUrl='<%# "~/manage/AddSlaveDevices.aspx?DeviceId=" + GetDataItemValue("DeviceId")+"&DeviceSName=" + GetDataItemValue("DeviceSName") + "&FaceDeviceType=" + GetDataItemValue("FaceDeviceType") + ""%>'
                                        ID="AA1" />
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="LastPing_Template" ControlID="" ControlPropertyName="">
                                <Template>
                                    <%#ParseLastPing(Container.DataItem.Item("LastPing"))%>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="DeviceStatus_Template" ControlID="" ControlPropertyName="">
                                <Template>
                                    <asp:Label ID="Label1" runat="server" Text='<%#DeviceStatus(Container.DataItem.Item("LastPing"),Container.DataItem.Item("TimeOut"))%>'
                                        ForeColor='<%#ChangeColorOnDeviceStatusCheck(Container.DataItem("LastPing"),Container.DataItem("TimeOut")) %>'></asp:Label>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplDeviceName">
                                <Template>
                                    <asp:HyperLink runat="server" Style="text-decoration: none;" Text='<%# Container.Value %>'
                                        NavigateUrl='<%# iif(Container.Value="Mobile","~/Manage/MobileDeviceLogs.aspx?DeviceId=" + Container.DataItem.Item("DeviceId"), "#") %>'
                                        ID="AA1" />
                                </Template>
                            </obout:GridTemplate>
                        </Templates>
                    </obout:Grid>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <hr />
                    <table>
                        <tr>
                            <td style="width: 198px">
                                &nbsp;<a style="font-family: Verdana; font-size: 11px; color: #0c416f;" href="MasterSlaveDeviceList.aspx"
                                    class="WebControls">« Go&nbsp;To&nbsp;Master&nbsp;Device&nbsp;List</a>
                            </td>
                            <td align="right" style="width: 824px">
                                <table>
                                    <tr>
                                        <td align="right">
                                            &nbsp;&nbsp;
                                            <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label>
                                            <asp:HiddenField ID="hdn_DeviceSName" runat="server" />
                                            <asp:HiddenField ID="hdn_DeviceId" runat="server" />
                                             <asp:HiddenField ID="hdn_DeleteDeviceId" runat="server" />
                                            <asp:HiddenField ID="hdn_LoginEmpName" runat="server" />
                                            <asp:HiddenField ID="hdn_FaceDeviceType" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("DeviceManagement") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function ParseLastPing(ByVal LastCheckDate As String)
            Try
                If CDate(LastCheckDate) < CDate("1910-01-01") Then
                    Return ""
                Else
                    Return CDate(LastCheckDate).ToString("dd-MMM-yyyy HH:mm")
                End If
            Catch ex As Exception
                Return ""
            End Try
        End Function
        Function DeviceStatus(ByVal LastCheckDate As String, ByVal TimeOut As String)
            Try
                If TimeOut = "" Then
                    TimeOut = 300
                End If
            
                If DateDiff(DateInterval.Second, CDate(LastCheckDate), CDate(Now.ToString("dd-MMM-yyyy HH:mm:ss"))) > TimeOut Then
                    Return "offline"
                Else
                    Return "online"
                End If
                Return "offline"
            Catch ex As Exception
                Return "online"
            End Try
        End Function
        
        Function ChangeColorOnDeviceStatusCheck(ByVal LastCheckDate As String, ByVal TimeOut As String) As System.Drawing.Color
            Try
                If TimeOut = "" Then
                    TimeOut = 300
                End If
            
                If DateDiff(DateInterval.Second, CDate(LastCheckDate), CDate(Now.ToString("dd-MMM-yyyy HH:mm:ss"))) > TimeOut Then
                    Return Drawing.Color.Red
                Else
                    Return Drawing.Color.Green
                End If
                Return Drawing.Color.Red
            Catch ex As Exception
                Return Drawing.Color.Red
            End Try
        End Function
        
        Function GetDataItemValue(ByVal fieldname As String) As String
            If fieldname = "DeviceId" Then
                Return hdn_DeviceId.Value
            ElseIf fieldname = "FaceDeviceType" Then
                Return hdn_FaceDeviceType.Value              
            End If
            Return hdn_DeviceSName.Value
        End Function
       
        
    </script>
    </form>
</body>
</html>
