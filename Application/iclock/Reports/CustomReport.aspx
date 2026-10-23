<%@ page language="VB" autoeventwireup="false" inherits="Reports_CustomReport, App_Web_z1ac55br" enableeventvalidation="false" %>

<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function jsShowHideProgress() {
            setTimeout(function () { document.getElementById('imgloadinggif').style.display = 'block'; }, 200);
            deleteCookie();

            var timeInterval = 200; // milliseconds (checks the cookie for every half second )

            var loop = setInterval(function () {
                if (IsCookieValid()) {
                    document.getElementById("<%=btn_GenerateReport.ClientID %>").disabled = false;
                    document.getElementById('imgloadinggif').style.display = 'none'; clearInterval(loop)
                }

            }, timeInterval);
        }

        // cookies
        function deleteCookie() {
            var cook = getCookie('ExcelDownloadFlag');
            document.getElementById('ReportProtoType_lblStatus').innerHTML = '';
            document.getElementById("<%=btn_GenerateReport.ClientID %>").disabled = true;
            if (cook != "") {
                document.cookie = "ExcelDownloadFlag=; Path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
            }
        }

        function IsCookieValid() {
            var cook = getCookie('ExcelDownloadFlag');
            return cook != '';
        }

        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
     <div>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
    </div>
 
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="ReportProtoType" runat="server" IsModal="true" Height="370" Width="548"
            StyleFolder="~/Styles/mainwindow/blue" Title="Continuous Abnormality  Report"
            VisibleOnLoad="true" ShowCloseButton="true" Left="80" Top="45" ShowStatusBar="False">
            <table width="100%" height="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td>
                        &nbsp;From Date&nbsp;&nbsp;
                    </td>
                    <td style="width: 173px">
                        <asp:DropDownList ID="Drp_FromDateDD" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_FromDateMM" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_FromDateYYYY" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                    <td>
                        &nbsp;To Date&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:DropDownList ID="Drp_ToDateDD" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_ToDateMM" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                        <asp:DropDownList ID="Drp_ToDateYYYY" runat="server" CssClass="WebControls">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;Available Field&nbsp;&nbsp;
                    </td>
                    <td>
                    </td>
                    <td colspan="2" align="center">
                        &nbsp;Export to Excel&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ListBox ID="lst_AvailableField" runat="server" CssClass="WebControls" Width="150"
                            Height="210"></asp:ListBox>
                    </td>
                    <td>
                        <table cellpadding="1">
                            <tr>
                                <td align="center">
                                    <input type="button" id="btn_next" runat="server" value=">" style="font-size: 11px;
                                        font-family: Verdana; height: 20px; width: 50px" onclick="btn_next_onclick();" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="button" id="btn_NextAll" runat="server" value=">>" style="font-size: 11px;
                                        font-family: Verdana; height: 20px; width: 50px" onclick="NextAll();" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="button" id="btn_Previous" runat="server" value="<" style="font-size: 11px;
                                        font-family: Verdana; height: 20px; width: 50px" onclick="btn_previous_onclick();" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="button" id="btn_PreviousAll" runat="server" value="<<" style="font-size: 11px;
                                        font-family: Verdana; height: 20px; width: 50px" onclick="PreviousAll();" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2" align="right">
                        <asp:ListBox ID="lst_exportToCsv" EnableViewState="true" CssClass="WebControls" runat="server"
                            Width="150" Height="210"></asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:CheckBox ID="chk_IncludeHeader" Text="Include Header" Checked="true" runat="server" />
                        </br>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_SaveFormat" runat="server" CssClass="WebControls" Text="Save Format"
                            OnClientClick="GetSelectedItem();" />
                    </td>
                    <td>
                        <img style="display: none" id="imgloadinggif" src="../Images/loading.gif" alt="loading.." />
                    </td>
                    <td colspan="2" align="right">
                        <asp:HiddenField ID="Hdn_ExportName" runat="server" />
                        <asp:HiddenField ID="Hdn_SourceExportName" runat="server" />
                        <asp:HiddenField ID="Hdn_ExportValueName" runat="server" />
                        <asp:HiddenField ID="Hdn_SourceExportValueName" runat="server" />
                        <asp:Button ID="btn_GenerateReport" runat="server" Text="Generate Report" CssClass="WebControls"
                              OnClientClick="jsShowHideProgress();GetSelectedItem();" UseSubmitBehavior="false" />&nbsp;<input type="button"
                                style="font-size: 11px; font-family: Verdana; height: 20px;" value="Close" id="btn_Close"
                                onclick="ReportProtoType.Close();" />
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <hr />
                        <asp:Label ID="lblStatus" EnableViewState="false" CssClass="WebControls" runat="server"
                            Text="" ForeColor="red" Height="20"></asp:Label>
                    </td>
                </tr>
            </table>
        </owd:Window>
    </div>
    </form>
</body>
</html>
<script type="text/javascript">

    // ONLY NEXT BUTTON ON CLICK 

    function btn_next_onclick() {

        var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");
        var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");
        var i = 0
        for (var j = 0; j < ListViewObject.options.length; j++) {
            if (ListViewObject.options[j].selected) {
                var Options = document.createElement("OPTION");
                ListExportObject.add(new Option(ListViewObject.options[j].text, ListViewObject.options[j].value));
                i = i + 1
            }
        }
        removeOptionSelected(ListViewObject)
    }


    // NEXT ALL BUTTON ONCLICK      

    function NextAll() {

        var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");
        var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");

        for (var j = 0; j < ListViewObject.options.length; j++) {

            ListExportObject.add(new Option(ListViewObject.options[j].text, ListViewObject.options[j].value));
        }
        removeAllOption(ListViewObject);


    }

    function GetSelectedItem() {
        document.getElementById("<%=Hdn_ExportName.ClientID %>").value = '';
        document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value = '';
        var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");
        var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");



        for (var j = 0; j < ListExportObject.options.length; j++) {
            document.getElementById("<%=Hdn_ExportName.ClientID %>").value = document.getElementById("<%=Hdn_ExportName.ClientID %>").value + ListExportObject.options[j].text + ',';
            document.getElementById("<%=Hdn_ExportValueName.ClientID %>").value = document.getElementById("<%=Hdn_ExportValueName.ClientID %>").value + ListExportObject.options[j].value + ',';
        }

        for (var k = 0; k < ListViewObject.options.length; k++) {
            document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value = document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value + ListViewObject.options[k].text + ',';
            document.getElementById("<%=Hdn_SourceExportValueName.ClientID %>").value = document.getElementById("<%=Hdn_SourceExportValueName.ClientID %>").value + ListViewObject.options[k].value + ',';
        }


        

    }




    // REMOVE SELECTED OPTIONS         

    function removeOptionSelected(object) {
        var k;
        for (k = object.length - 1; k >= 0; k--) {
            if (object.options[k].selected) {
                object.remove(k);
            }
        }
    }

    //REMOVE ALL OPTIONS           
    function removeAllOption(object) {
        var k;
        for (k = object.length - 1; k >= 0; k--) {
            object.remove(k);
        }
    }



    // PREVIOUS BUTTON ON CLICK


    function btn_previous_onclick() {

        var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");
        var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");
        var i = 0
        for (var j = 0; j < ListExportObject.options.length; j++) {
            if (ListExportObject.options[j].selected) {
                ListViewObject.add(new Option(ListExportObject.options[j].text, ListExportObject.options[j].value));
                i = i + 1
            }
        }
        removeOptionSelected(ListExportObject)

    }



    // PREVIOUS ALL BUTTON ONCLICK      

    function PreviousAll() {
        var ListViewObject = document.getElementById("<%=lst_AvailableField.ClientID %>");
        var ListExportObject = document.getElementById("<%=lst_exportToCsv.ClientID %>");

        for (var j = 0; j < ListExportObject.options.length; j++) {
            ListViewObject.add(new Option(ListExportObject.options[j].text, ListExportObject.options[j].value));
        }
        removeAllOption(ListExportObject);
    }
            
</script>
