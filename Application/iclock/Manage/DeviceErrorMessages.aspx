<%@ page language="VB" autoeventwireup="false" inherits="Manage_DeviceErrorMessages, App_Web_kgq5n2bg" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Device Error Messages</title>
        <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; ">
                    <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;padding:5px; color: white;">
                        Device Error Messages
                    </td>
                    
                     <td align="right" style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;">
                        Device
                        <asp:DropDownList ID="drp_Devices"  runat="server"></asp:DropDownList>
                        <asp:Button ID="btnUpdate"  runat="server" Text="Refresh" OnClientClick="SetSource(this.id)"/>
                          <asp:HiddenField ID="hidSourceID" runat="server" />

                         <script type="text/javascript">
                             function SetSource(SourceID) {
                                 var hidSourceID = document.getElementById("<%=hidSourceID.ClientID%>");
                                 hidSourceID.value = SourceID;
                             }
                  </script>
                    </td>
                    
                </tr>
                <tr style=" background-color: lightsteelblue;">
                <td colspan="2">
                <hr />
                </td>
                </tr>
                <tr>
                    <td colspan="2">
                       <obout:Grid ID="Dg_DeviceErrorMessages" runat="server" AllowFiltering="true" CallbackMode="true"
                            EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                            FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="false" >
                            <Columns>
                                <obout:Column ID="Id" DataField="DeviceErrorMessageId" Visible="false" Width="0" ReadOnly="true"
                                    HeaderText="DeviceErrorMessageId" runat="server" />
                                <obout:Column ID="Column2" DataField="DeviceSName" Visible="true" Width="120" HeaderText="Device Name"
                                    runat="server" />
                                     <obout:Column ID="Column1" DataField="ErrorMessage" Visible="true" Width="250" HeaderText="Error Message"
                                    runat="server" />
                                <obout:Column ID="Column3" DataField="LogStream" Visible="true" Width="500" HeaderText="Log Stream"
                                    runat="server" />
                                 <obout:Column ID="Column5" DataField="CreatedDate" Visible="true" Width="110" HeaderText="Created Date" DataFormatString="{0:dd MMM yyyy HH:mm}" 
                                    runat="server" />
                            </Columns>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
