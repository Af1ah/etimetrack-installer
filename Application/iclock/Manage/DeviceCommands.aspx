<%@ page language="VB" autoeventwireup="false" inherits="Manage_DeviceCommands, App_Web_kgq5n2bg" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
		    document.getElementById("<%=Hdn_DeviceCommandId.ClientID %>").value = record.DeviceCommandId;
	        if(confirm("Are you sure you want to delete? "))
	            return true;
	        else
	            return false;
	    }
	
	function OnDelete(record) 
	{
	    alert(record.Error);
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
        <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />

</head>
<body>
 <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; ">
                    <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;padding:5px; color: white;">
                        Device Commands List
                    </td>
                    <td></td>
                </tr>

                <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
                <tr>

                <td colspan=2 align="right" style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">
                        <asp:HiddenField ID="Hdn_DeviceCommandId" runat="server" />
                        
                        Device
                        <asp:DropDownList ID="drp_Devices" runat="server"></asp:DropDownList>
                        From&nbsp;Date
                        <asp:DropDownList ID="Drp_FromDateDD" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_FromDateMM" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_FromDateYYYY" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        To&nbsp;Date
                        <asp:DropDownList ID="Drp_ToDateDD" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_ToDateMM" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_ToDateYYYY" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <input id="btn_Refresh"  onclick="Dg_DeviceCommands.refresh()"
                            type="button" value="Refresh" />
                            <asp:Button ID="btn_SelectedRecord" runat="server" Text="Delete Selected Commands"  OnClientClick="SetSource(this.id)"/>

                          <asp:HiddenField ID="hidSourceID" runat="server" />

                         <script type="text/javascript">
                             function SetSource(SourceID) {
                                 var hidSourceID = document.getElementById("<%=hidSourceID.ClientID%>");
                                 hidSourceID.value = SourceID;
                             }
                  </script>

                    </td>
                </tr>
       <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
                
                
                <tr>
                    <td colspan="2">
                       <obout:Grid ID="Dg_DeviceCommands" runat="server" AllowFiltering="true" CallbackMode="true"
                            EnableRecordHover="true" KeepSelectedRecords="true" Serialize="false" AutoGenerateColumns="false"
                            FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="false" ShowLoadingMessage="false"
                            OnRebind="RebindGrid"  OnDeleteCommand="DeleteRecord">
                            <ClientSideEvents  OnBeforeClientDelete="OnBeforeDelete"
                                OnClientDelete="OnDelete" />
                            <Columns>
                                <obout:Column ID="Id" DataField="DeviceCommandId" Visible="false" Width="100" ReadOnly="true"
                                    HeaderText="DeviceCommandId" runat="server" />
                                <obout:Column ID="Column6" DataField="CreationDate" Visible="true" Width="150" HeaderText="Creation Date" DataFormatString="{0:dd MMM yyyy HH:mm:ss}" 
                                    runat="server" SortOrder="Desc" />
                                <obout:Column ID="Column2" DataField="DeviceSName" Visible="true" Width="200" HeaderText="Device Name"
                                    runat="server" />
                                <obout:Column ID="Column3" DataField="Title" Visible="true" Width="220" HeaderText="Command"
                                    runat="server" />
                                <obout:Column ID="Column4" DataField="Status" Visible="true" Width="100" HeaderText="Status"
                                    runat="server" />
                                 <obout:Column ID="Column5" Visible="true" Width="150" HeaderText="Execution Date" DataFormatString="{0:dd MMM yyyy HH:mm}" 
                                    runat="server" >
                                     <TemplateSettings TemplateId="ExecutionDate_Template" />
                                </obout:Column>                                    
                                 <obout:Column HeaderText="" Width="90" AllowEdit="false" AllowDelete="true"
                                    Visible="true" />
                            </Columns>
                            <Templates>
                            <obout:GridTemplate runat="server" ID="ExecutionDate_Template" ControlID="" ControlPropertyName="">
                                    <Template>
                                        <%#ParseExecutionDate(Container.DataItem.Item("ExecutionDate"))%>
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
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
