<%@ page language="VB" autoeventwireup="false" inherits="Manage_DeviceLogList, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        var popUpObj;

        function showModalPopUp(DeviceLogId,TableName) {

            popUpObj = window.open("ViewAttendancePhoto.aspx?Id=" + DeviceLogId + "&TableName=" + TableName + "",

    "ModalPopUp",

    "toolbar=no," +

    "scrollbars=no," +

    "location=no," +

    "statusbar=no," +

    "menubar=no," +

    "resizable=0," +

    "width=300," +

    "height=300," +

    "left = 490," +

    "top=300"

    );

            popUpObj.focus();

            LoadModalDiv();

        }


        function LoadModalDiv() {

            var bcgDiv = document.getElementById("divBackground");

            bcgDiv.style.display = "block";

        }

        function HideModalDiv() {

            var bcgDiv = document.getElementById("divBackground");

            bcgDiv.style.display = "none";

        }


      
    </script>
    <script type="text/javascript">

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function OpenLocationPopUpWindow(Longitude, Latitude) {

            var wide = '500';
            var high = '400';

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
	
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divBackground" style="position: fixed; z-index: 999; height: 100%; width: 100%;
        top: 0; left: 0; background-color: Black; filter: alpha(opacity=60); opacity: 0.6;
        -moz-opacity: 0.8; display: none">
    </div>
    <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
        border-left: gray 1px solid; border-bottom: gray 1px solid;">
        <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
            padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
            <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding: 5px; color: white;">
                Device Logs List
            </td>
            <td align="right">
                <asp:Label ID="lblError" runat="server" Width="300px" ForeColor="Red"></asp:Label>
                &nbsp;
            </td>
        </tr>
          <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
        <tr >
            <td colspan="2" style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">               
                Device
                <asp:DropDownList ID="drp_Devices" runat="server" Width="96px">
                </asp:DropDownList>
               
              
                From Day
                <asp:DropDownList ID="ddlFromDate" runat="server" Width="48px">
                <asp:ListItem Value="01">1</asp:ListItem>
                    <asp:ListItem Value="02">2</asp:ListItem>
                    <asp:ListItem Value="03">3</asp:ListItem>
                    <asp:ListItem Value="04">4</asp:ListItem>
                    <asp:ListItem Value="05">5</asp:ListItem>
                    <asp:ListItem Value="06">6</asp:ListItem>
                    <asp:ListItem Value="07">7</asp:ListItem>
                    <asp:ListItem Value="08">8</asp:ListItem>
                    <asp:ListItem Value="09">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                    <asp:ListItem Value="13">13</asp:ListItem>
                    <asp:ListItem Value="14">14</asp:ListItem>
                    <asp:ListItem Value="15">15</asp:ListItem>
                    <asp:ListItem Value="16">16</asp:ListItem>
                    <asp:ListItem Value="17">17</asp:ListItem>
                    <asp:ListItem Value="18">18</asp:ListItem>
                    <asp:ListItem Value="19">19</asp:ListItem>
                    <asp:ListItem Value="20">20</asp:ListItem>
                    <asp:ListItem Value="21">21</asp:ListItem>
                    <asp:ListItem Value="22">22</asp:ListItem>                    
                    <asp:ListItem Value="23">23</asp:ListItem>
                    <asp:ListItem Value="24">24</asp:ListItem>
                    <asp:ListItem Value="25">25</asp:ListItem>
                    <asp:ListItem Value="26">26</asp:ListItem>
                    <asp:ListItem Value="27">27</asp:ListItem>
                    <asp:ListItem Value="28">28</asp:ListItem>
                    <asp:ListItem Value="29">29</asp:ListItem>
                    <asp:ListItem Value="30">30</asp:ListItem>
                    <asp:ListItem Value="31">31</asp:ListItem>
                </asp:DropDownList>
                To Day
                <asp:DropDownList ID="ddlToDate" runat="server" Width="48px">
                <asp:ListItem Value="01">1</asp:ListItem>
                    <asp:ListItem Value="02">2</asp:ListItem>
                    <asp:ListItem Value="03">3</asp:ListItem>
                    <asp:ListItem Value="04">4</asp:ListItem>
                    <asp:ListItem Value="05">5</asp:ListItem>
                    <asp:ListItem Value="06">6</asp:ListItem>
                    <asp:ListItem Value="07">7</asp:ListItem>
                    <asp:ListItem Value="08">8</asp:ListItem>
                    <asp:ListItem Value="09">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                    <asp:ListItem Value="13">13</asp:ListItem>
                    <asp:ListItem Value="14">14</asp:ListItem>
                    <asp:ListItem Value="15">15</asp:ListItem>
                    <asp:ListItem Value="16">16</asp:ListItem>
                    <asp:ListItem Value="17">17</asp:ListItem>
                    <asp:ListItem Value="18">18</asp:ListItem>
                    <asp:ListItem Value="19">19</asp:ListItem>
                    <asp:ListItem Value="20">20</asp:ListItem>
                    <asp:ListItem Value="21">21</asp:ListItem>
                    <asp:ListItem Value="22">22</asp:ListItem>                    
                    <asp:ListItem Value="23">23</asp:ListItem>
                    <asp:ListItem Value="24">24</asp:ListItem>
                    <asp:ListItem Value="25">25</asp:ListItem>
                    <asp:ListItem Value="26">26</asp:ListItem>
                    <asp:ListItem Value="27">27</asp:ListItem>
                    <asp:ListItem Value="28">28</asp:ListItem>
                    <asp:ListItem Value="29">29</asp:ListItem>
                    <asp:ListItem Value="30">30</asp:ListItem>
                    <asp:ListItem Value="31">31</asp:ListItem>
                </asp:DropDownList>
                 Month
                <asp:DropDownList ID="ddlMonth" runat="server" Width="40px" >
                    <asp:ListItem Value="01">1</asp:ListItem>
                    <asp:ListItem Value="02">2</asp:ListItem>
                    <asp:ListItem Value="03">3</asp:ListItem>
                    <asp:ListItem  Value="04">4</asp:ListItem>
                    <asp:ListItem Value="05">5</asp:ListItem>
                    <asp:ListItem Value="06">6</asp:ListItem>
                    <asp:ListItem Value="07">7</asp:ListItem>
                    <asp:ListItem Value="08">8</asp:ListItem>
                    <asp:ListItem Value="09">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                </asp:DropDownList>
                 Year
                <asp:DropDownList ID="ddlYear" runat="server" Width="55px">
                </asp:DropDownList>

                VerifyMode
                <asp:DropDownList ID="drp_VerifyMode" runat="server" Width="96px">
                </asp:DropDownList>
                Sort By
                <asp:DropDownList ID="ddlSortBy" runat="server" Width="120">
                    <asp:ListItem Value="DownloadDate">Download Date</asp:ListItem>
                    <asp:ListItem Value="SerialNumber">Serial Number</asp:ListItem>
                    <asp:ListItem Value="LogDate">Log Date</asp:ListItem>
                    <asp:ListItem Value="UserId">User Id</asp:ListItem>
                    <asp:ListItem Value="DeviceSName">Device Name</asp:ListItem>
                </asp:DropDownList>
                SortOrder
                <asp:DropDownList ID="ddlSortOrder" runat="server" Width="55px">
                    <asp:ListItem>Desc</asp:ListItem>
                    <asp:ListItem>Asc</asp:ListItem>
                </asp:DropDownList>
                Page Size
                <asp:TextBox ID="txtPageSize" runat="server"
                    Width="40" Text="10" />
                   <asp:Button ID="btnGo"  runat="server" Text="Filter" OnClientClick="SetSource(this.id)"/>
                   <asp:Button ID="btnExport" runat="server" Text="Export" />
                    
                          <asp:HiddenField ID="hidSourceID" runat="server"  />

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
            <td colspan="2" valign="top" style="padding: 5px;">
                <cc1:Grid ID="DG_DeviceLogRecords" AutoGenerateColumns="false" runat="server" ShowLoadingMessage="true"
                    EnableRecordHover="true" AllowFiltering="true" Serialize="false" KeepSelectedRecords="true"
                    AllowAddingRecords="false" AllowSorting="false" FolderStyle="~/styles/grid/styles/premiere_blue">
                    <Columns>
                        <cc1:Column ID="Id" DataField="DeviceLogId" Visible="False" Width="100" ReadOnly="True"
                            HeaderText="DeviceCommandId" ConvertEmptyStringToNull="False" Index="0" />
                        <cc1:Column ID="DownloadDate" DataField="DownloadDate" Width="130" HeaderText="Download Date"
                            DataFormatString="{0:dd MMM yyyy HH:mm:ss}" ConvertEmptyStringToNull="False"
                            DataFormatString_GroupHeader="{0:dd MMM yyyy HH:mm:ss}" Index="1" />
                        <cc1:Column ID="DeviceId" DataField="DeviceId" Visible="False" Width="200" HeaderText="Device Id"
                            ConvertEmptyStringToNull="False" Index="2" />
                        <cc1:Column ID="UserId" DataField="UserId" Width="90" HeaderText="User Id" ConvertEmptyStringToNull="False"
                            Index="3" />

                         <cc1:Column ID="EmployeeName" DataField="EmployeeName" Width="130" HeaderText="User Name" ConvertEmptyStringToNull="False"
                            Index="4" />

                        <cc1:Column ID="LogDate" DataField="LogDate" Width="130" HeaderText="Log Date" DataFormatString="{0:dd MMM yyyy HH:mm:ss}"
                            ConvertEmptyStringToNull="False" DataFormatString_GroupHeader="{0:dd MMM yyyy HH:mm:ss}"
                            Index="5" />
                        <cc1:Column ID="DeviceSName" DataField="DeviceSName" Width="130" HeaderText="Device Name"
                            ConvertEmptyStringToNull="False" Index="6" />
                        <cc1:Column ID="DeviceSNo" DataField="SerialNumber" Width="100" HeaderText="Serial No"
                            ConvertEmptyStringToNull="False" Index="7" />
                        <cc1:Column ID="C4" DataField="C4" Width="140" HeaderText="Att State" AllowFilter="false"  ConvertEmptyStringToNull="False"
                            Index="8">
                        </cc1:Column>
                        <cc1:Column ID="C5" DataField="C5" Width="150" HeaderText="Verify Mode" AllowFilter="false"  ConvertEmptyStringToNull="False"
                            Index="9">
                        </cc1:Column>
                        <cc1:Column ConvertEmptyStringToNull="False" DataField="Longitude" HeaderText="Longitude"
                            Visible="False">
                        </cc1:Column>
                        <cc1:Column ConvertEmptyStringToNull="False" DataField="Latitude" HeaderText="Latitude"
                            Visible="False">
                        </cc1:Column>
                        <cc1:Column Width="80" HeaderText="GPS" ConvertEmptyStringToNull="False" Index="16"
                            TemplateId="tplViewMaps">
                            <TemplateSettings TemplateId="tplViewMaps" />
                        </cc1:Column>
                        <cc1:Column Width="80" HeaderText="Att Photo" ConvertEmptyStringToNull="False" Index="17"
                            TemplateId="tplViewPhoto">
                            <TemplateSettings TemplateId="tplViewPhoto" />
                        </cc1:Column>
                        <cc1:Column ConvertEmptyStringToNull="False" DataField="FileName" HeaderText="FileName"
                            Visible="False">
                        </cc1:Column>
                        <cc1:Column ConvertEmptyStringToNull="False" DataField="TableName" HeaderText="TableName"
                            Visible="False" Index="18">
                        </cc1:Column>
                    </Columns>
                    <Templates>
                        <cc1:GridTemplate runat="server" ID="tplViewMaps">
                            <Template>
                                <a href="Javascript:void(0);" onclick="OpenLocationPopUpWindow('<%#Container.DataItem.Item("Longitude")%>','<%#Container.DataItem.Item("Latitude")%>')">
                                    <%#ShowGPSColumn(Container.DataItem.Item("Longitude"),Container.DataItem.Item("Latitude"))%>
                                </a>
                            </Template>
                        </cc1:GridTemplate>
                        <cc1:GridTemplate runat="server" ID="tplViewPhoto">
                            <Template>
                                <a href="Javascript:void(0);" onclick="showModalPopUp('<%#Container.DataItem.Item("DeviceLogId")%>','<%#Container.DataItem.Item("TableName")%>')">
                                    <%#ShowPhotoColumn(Container.DataItem.Item("FileName"))%>
                                </a>
                            </Template>
                        </cc1:GridTemplate>
                    </Templates>
                </cc1:Grid>
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
        
        Function ShowGPSColumn(ByVal Longitude As String, ByVal Latitude As String)
            Try
                If Not String.IsNullOrEmpty(Longitude) Then
                    If Not String.IsNullOrEmpty(Latitude) Then
                        If Not Longitude = 0 Then
                            If Not Latitude = 0 Then
                                Return "View"
                            End If
                        End If
                    End If
                End If
            Catch ex As Exception
                Return ""
            End Try
        End Function
        
        Function ShowPhotoColumn(ByVal FileName As String)
            Try
                If Not String.IsNullOrEmpty(FileName) Then
                    Return "View"
                Else
                    Return ""
                End If
              
            Catch ex As Exception
                Return ""
            End Try
            
        End Function
        
    </script>
</body>
</html>
