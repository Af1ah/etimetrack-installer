<%@ page language="VB" autoeventwireup="false" inherits="Manage_MobileDeviceLogs, App_Web_usmjemmz" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function OpenLocationPopUpWindow(Longitude, Latitude) {

            var wide = '800';
            var high = '500';

            //this gets the total available width and height of the users screen
            screen_height = window.screen.availHeight;
            screen_width = window.screen.availWidth;

            //this gets the left and top point by saying total width of the screen divided by 2 (center), minus the width of your window divided by 2, which make its center point the middle of the screen. Same for the top
            left_point = parseInt(screen_width / 2) - (wide / 2);
            top_point = parseInt(screen_height / 2) - (high / 2);

            //just doing a simple popup window here, but plugging your info into it, and setting the top and left corners to be our calculated points that will center your window.
            win = window.open('ViewMobileLocationInMaps.aspx?Longitude=' + Longitude + '&Latitude=' + Latitude + '', 'myPopup', 'width=' + wide + ',height=' + high + ',left=' + left_point + ',top=' + top_point + ',toolbar=no,location=no,scrollbars=no,status=no,resizable=no,fullscreen=no');     //make sure your window is in the front 
            win.focus();
        }

        function OpenPhotoPopUpWindow(DeviceLogId, DeviceId) {

            var TableName = document.getElementById('hdn_TableName').value;
            var wide = '270';
            var high = '270';

            //this gets the total available width and height of the users screen
            screen_height = window.screen.availHeight;
            screen_width = window.screen.availWidth;

            //this gets the left and top point by saying total width of the screen divided by 2 (center), minus the width of your window divided by 2, which make its center point the middle of the screen. Same for the top
            left_point = parseInt(screen_width / 2) - (wide / 2);
            top_point = parseInt(screen_height / 2) - (high / 2);

            //just doing a simple popup window here, but plugging your info into it, and setting the top and left corners to be our calculated points that will center your window.
            win = window.open('ViewMobileCapturedPhoto.aspx?DeviceLogId=' + DeviceLogId + '&DeviceId=' + DeviceId + '&TableName=' + TableName + '', 'myPopup', 'width=' + wide + ',height=' + high + ',left=' + left_point + ',top=' + top_point + ',toolbar=no,location=no,scrollbars=no,status=no,resizable=no,fullscreen=no');     //make sure your window is in the front 
            win.focus();
        }
	
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
        border-left: gray 1px solid; border-bottom: gray 1px solid;">
        <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
            padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
            <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding: 5px; color: white;">
                Mobile Device Logs
            </td>
            <td align="right">
                <asp:Label ID="lblError" runat="server" Width="300px" ForeColor="Red"></asp:Label>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr style="background-color: gainsboro;">
            <td colspan="2" style="text-align: right; padding: 5px;">
                <hr />
                Selected Device
                <asp:DropDownList ID="drp_Devices" Enabled="false" runat="server" Width="96px">
                </asp:DropDownList>
                Month
                <asp:DropDownList ID="ddlMonth" runat="server" Width="48px" AutoPostBack="True">
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
                &nbsp; Year
                <asp:TextBox ID="txtYear" runat="server" Width="128px" AutoPostBack="True"></asp:TextBox>&nbsp;From
                Date
                <asp:DropDownList ID="ddlFromDate" runat="server" Width="48px">
                </asp:DropDownList>
                &nbsp;To Date
                <asp:DropDownList ID="ddlToDate" runat="server" Width="48px">
                </asp:DropDownList>
                Sort By
                <asp:DropDownList ID="ddlSortBy" runat="server" Width="110">
                    <asp:ListItem>DownloadDate</asp:ListItem>
                    <asp:ListItem>LogDate</asp:ListItem>
                    <asp:ListItem>UserId</asp:ListItem>
                    <asp:ListItem>DeviceSName</asp:ListItem>
                </asp:DropDownList>
                SortOrder
                <asp:DropDownList ID="ddlSortOrder" runat="server" Width="55px">
                    <asp:ListItem>Desc</asp:ListItem>
                    <asp:ListItem>Asc</asp:ListItem>
                </asp:DropDownList>
                Page Size
                <asp:TextBox ID="txtPageSize" Onkeypress="return isNumberKey(event)" runat="server"
                    Width="40" Text="100" />
                <asp:Button ID="btnGo" runat="server" Text="Filter" />
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top" style="padding: 5px;">
                <cc1:Grid ID="DG_DeviceLogRecords" AutoGenerateColumns="false" runat="server" ShowLoadingMessage="true"
                    EnableRecordHover="true" AllowFiltering="true" Serialize="false" KeepSelectedRecords="true"
                    AllowAddingRecords="false" AllowSorting="false" FolderStyle="~/styles/grid/styles/premiere_blue">
                    <Columns>
                        <cc1:Column ID="Id" DataField="DeviceLogId" Visible="False" Width="150" ReadOnly="True"
                            HeaderText="DeviceCommandId" ConvertEmptyStringToNull="False" Index="0" />
                        <cc1:Column ID="DownloadDate" DataField="DownloadDate" Width="100" HeaderText="Download Date"
                            DataFormatString="{0:dd MMM yyyy HH:mm:ss}" ConvertEmptyStringToNull="False"
                            DataFormatString_GroupHeader="{0:dd MMM yyyy HH:mm:ss}" Index="1" />
                        <cc1:Column ID="DeviceId" DataField="DeviceId" Visible="False" Width="200" HeaderText="Device Id"
                            ConvertEmptyStringToNull="False" Index="2" />
                        <cc1:Column ID="UserId" DataField="UserId" Width="150" HeaderText="User Id" ConvertEmptyStringToNull="False"
                            Index="3" />
                        <cc1:Column ID="LogDate" DataField="LogDate" Width="150" HeaderText="Log Date" DataFormatString="{0:dd MMM yyyy HH:mm:ss}"
                            ConvertEmptyStringToNull="False" DataFormatString_GroupHeader="{0:dd MMM yyyy HH:mm:ss}"
                            Index="4" />
                        <cc1:Column ID="DeviceSName" DataField="DeviceSName" Width="160" HeaderText="Device Name"
                            ConvertEmptyStringToNull="False" Index="5" />
                        <cc1:Column ID="Longitude" DataField="Longitude" Visible="true" Width="160" HeaderText="Longitude"
                            ConvertEmptyStringToNull="False" Index="6" />
                        <cc1:Column ID="Latitude" DataField="Latitude" Width="160" Visible="true" HeaderText="Latitude"
                            ConvertEmptyStringToNull="False" Index="7">
                        </cc1:Column>
                        <cc1:Column Width="170" ConvertEmptyStringToNull="False" Index="16" TemplateId="tplViewMaps">
                            <TemplateSettings TemplateId="tplViewMaps" />
                        </cc1:Column>
                        <cc1:Column Width="170" ConvertEmptyStringToNull="False" Index="16" TemplateId="tplViewImage">
                            <TemplateSettings TemplateId="tplViewImage" />
                        </cc1:Column>
                    </Columns>
                    <Templates>
                        <cc1:GridTemplate runat="server" ID="tplViewMaps">
                            <Template>
                                <a href="Javascript:void(0);" onclick="OpenLocationPopUpWindow('<%#Container.DataItem.Item("Longitude")%>','<%#Container.DataItem.Item("Latitude")%>')">
                                    View Location In Maps </a>
                            </Template>
                        </cc1:GridTemplate>
                        <cc1:GridTemplate runat="server" ID="tplViewImage">
                            <Template>
                                <a href="Javascript:void(0);" onclick="OpenPhotoPopUpWindow('<%#Container.DataItem.Item("DeviceLogId")%>','<%#Container.DataItem.Item("DeviceId")%>')">
                                    View Photo </a>
                            </Template>
                        </cc1:GridTemplate>
                    </Templates>
                </cc1:Grid>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hdn_TableName" runat="server" />
    </form>
    <script runat="server">
        
        Function ParseExecutionDate(ByVal ExecutionDate As String)
            Try
                If CDate(ExecutionDate) < CDate("1910-01-01") Then
                    Return ""
                Else
                    Return CDate(ExecutionDate).ToString("dd-MMM-yyyy HH:mm")
                End If
            Catch ex As Exception
                Return ""
            End Try
            
        End Function
    </script>
</body>
</html>
