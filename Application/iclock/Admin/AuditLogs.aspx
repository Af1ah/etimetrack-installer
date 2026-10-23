<%@ page language="VB" autoeventwireup="false" inherits="Manage_AuditLogs, App_Web_kueexnan" enableeventvalidation="false" %>

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
                Audit Log List
            </td>
            <td align="right">
                <asp:Label ID="lblError" runat="server" Width="300px" ForeColor="Red"></asp:Label>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr style="background-color: gainsboro;">
            <td colspan="2" style="text-align: right; padding: 5px;">
                <hr />
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
                Page Size
                <asp:TextBox ID="txtPageSize" Onkeypress="return isNumberKey(event)" runat="server"
                    Width="40" Text="100" />
                <asp:Button ID="btnGo" runat="server" Text="Filter" />
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top" style="padding: 5px;">
                <cc1:Grid ID="DG_AuditRecords" AutoGenerateColumns="false" runat="server" ShowLoadingMessage="true"
                    EnableRecordHover="true" AllowFiltering="true" Serialize="false" KeepSelectedRecords="true"
                    AllowAddingRecords="false" AllowSorting="false" FolderStyle="~/styles/grid/styles/premiere_blue">
                    <Columns>
                        <cc1:Column ID="Id" DataField="AuditLogId" Visible="False" Width="100" ReadOnly="True"
                            HeaderText="AuditLogId" ConvertEmptyStringToNull="False" Index="0" />
                        <cc1:Column ID="LogDateTime" DataField="LogDateTime" Width="140" HeaderText="LogDateTime"
                            DataFormatString="{0:dd MMM yyyy HH:mm:ss}" ConvertEmptyStringToNull="False"
                            DataFormatString_GroupHeader="{0:dd MMM yyyy HH:mm:ss}" Index="1" />
                        <cc1:Column ID="UserName" DataField="UserName"  Width="200" HeaderText="User Name"
                            ConvertEmptyStringToNull="False" Index="2" />
                        <cc1:Column ID="IPAddress" DataField="IPAddress" Width="150" HeaderText="IP Address"
                            ConvertEmptyStringToNull="False" Index="3" />
                        <cc1:Column ID="OperationType" DataField="OperationType" Wrap ="true" Width="400" HeaderText="Operation Type"
                            ConvertEmptyStringToNull="False" Index="4" />
                        <cc1:Column ID="Description" DataField="Description"  Width="250" HeaderText="Status"
                            ConvertEmptyStringToNull="False" Index="5" />
                        <cc1:Column ID="AuditLogType" DataField="AuditLogType" Visible="False" Width="120" HeaderText="Type"
                            ConvertEmptyStringToNull="False" Index="6">
                        </cc1:Column>
                    </Columns>
                </cc1:Grid>
            </td>
        </tr>
    </table>
    </form>
    <script runat="server">
                     
      
        
    </script>
</body>
</html>
