<%@ page language="VB" autoeventwireup="false" inherits="Reports_ExportThirdPartyPayroll, App_Web_z1ac55br" enableeventvalidation="false" %>

<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.window" Assembly="obout_Window_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CSV Export for Third Party Payroll</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
    </div>
 
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="ReportProtoType" runat="server" IsModal="true" Height="440" Width="600"
            StyleFolder="~/Styles/mainwindow/blue" Title="CSV Export for Third Party Payroll"
            VisibleOnLoad="true" ShowCloseButton="true" Left="80" Top="45" ShowStatusBar="False">
            <table width="100%" height="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td>
                        <fieldset>
                            <table>
                                <tr>
                                    <td>
                                        From Date
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="Drp_FromDateDD" runat="server" CssClass="WebControls">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="Drp_FromDateMM" runat="server" CssClass="WebControls">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="Drp_FromDateYYYY" runat="server" CssClass="WebControls">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        To Date
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
                                    <td>
                                        File Format
                                    </td>
                                    <td>
                                        <obout:Combobox Validate="false" ID="drp_FileFormat" CssClass="WebControls" runat="server"
                                            Width="157" FolderStyle="~/styles/default" SelectedIndex="0">
                                            <Options>
                                                <obout:Option runat="server" Text="dd-MM-yyyy"></obout:Option>
                                                <obout:Option runat="server" Text="MM-dd-yyyy"></obout:Option>
                                                <obout:Option runat="server" Text="dd_MM_yyyy"></obout:Option>
                                                <obout:Option runat="server" Text="MM_dd_yyyy"></obout:Option>
                                                <obout:Option runat="server" Text="ddMMyyyy"></obout:Option>
                                                <obout:Option ID="Option1" runat="server" Text="MMddyyyy"></obout:Option>
                                            </Options>
                                        </obout:Combobox>
                                    </td>
                                    <td>
                                        File Extn
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_FileExtn" runat="server" Width="82px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        LogDate Format
                                    </td>
                                    <td>
                                        <obout:Combobox Validate="false" ID="drp_LogDateFormat" CssClass="WebControls" runat="server"
                                            Width="157" FolderStyle="~/styles/default" SelectedIndex="0">
                                            <Options>
                                                <obout:Option ID="Option2" runat="server" Text="dd-MM-yyyy HH:mm"></obout:Option>
                                                <obout:Option ID="Option3" runat="server" Text="MM-dd-yyyy HH:mm"></obout:Option>
                                                <obout:Option ID="Option4" runat="server" Text="MM-yyyy HH:mm"></obout:Option>
                                                <obout:Option ID="Option5" runat="server" Text="HH:mm"></obout:Option>
                                                <obout:Option ID="Option6" runat="server" Text="dd MM yyyy HH:mm"></obout:Option>
                                                <obout:Option ID="Option7" runat="server" Text="MM dd yyyy HH:mm"></obout:Option>
                                                <obout:Option ID="Option8" runat="server" Text="MM yyyy HH:mm"></obout:Option>
                                                <obout:Option ID="Option9" runat="server" Text="ddMMyyyy HH:mm"></obout:Option>
                                                <obout:Option ID="Option10" runat="server" Text="MMddyyyy HH:mm"></obout:Option>
                                                <obout:Option ID="Option11" runat="server" Text="MMyyyy HH:mm"></obout:Option>
                                                <obout:Option ID="Option23" runat="server" Text=""></obout:Option>
                                            </Options>
                                        </obout:Combobox>
                                    </td>
                                    <td>
                                        Separator
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_Separator" runat="server">
                                            <asp:ListItem Selected="True">Space</asp:ListItem>
                                            <asp:ListItem>Tab</asp:ListItem>
                                            <asp:ListItem>Comma</asp:ListItem>
                                            <asp:ListItem>Semicolon</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        In Symbol
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_InSymbol" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        Out Symbol
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_OutSymbol" runat="server" Width="82px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        No of Digits in Employee Code
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_DigitsInEmpCode" Text="9" runat="server"></asp:TextBox>&nbsp;<asp:CheckBox
                                            ID="chk_DigitsInEmpCode" Checked="true" Text="Prefix Zero" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Custom Fixed/Reserved Field 1
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_ReservedField1" Text="R1" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Custom Fixed/Reserved Field 2
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txt_ReservedField2" Text="R1" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Available Field
                                    </td>
                                    <td colspan="2">
                                        Export to Excel
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:ListBox ID="lst_AvailableField" runat="server" CssClass="WebControls" BorderStyle="Solid"
                                            BorderWidth="1px" SelectionMode="Multiple" Width="200px" Height="131px"></asp:ListBox>
                                    </td>
                                    <td colspan="2">
                                        <table>
                                            <tr>
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
                                                <td>
                                                    <asp:ListBox ID="lst_exportToCsv" runat="server" CssClass="WebControls" BorderStyle="Solid"
                                                        BorderWidth="1px" SelectionMode="Multiple" Width="200px" Height="131px"></asp:ListBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <table>
                                            <tr>
                                                <td>
                                                    Enter&nbsp;Path
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPath" Width="300px" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btn_Export" CssClass="WebControls" OnClientClick="GetSelectedItem();this.disabled = true; this.value = 'Exporting...';"
                               UseSubmitBehavior="false" runat="server" Text="Export" />&nbsp;<input type="button" class="WebControls" value="Close"
                                    id="btn_Close" onclick="ReportProtoType.Close();" />&nbsp;&nbsp;
                        </td>
                    </tr>
                    <asp:HiddenField ID="Hdn_ExportName" runat="server" />
                    <asp:HiddenField ID="Hdn_SourceExportName" runat="server" />
                    <asp:HiddenField ID="Hdn_ExportValueName" runat="server" />
                    <asp:HiddenField ID="Hdn_SourceExportValueName" runat="server" />
            </table>
        </owd:Window>
    </div>
    </form>
    <script type="text/javascript">
        document.getElementById("ob_drp_FileFormatContainer").style.zIndex = "99999";
        document.getElementById("ob_drp_LogDateFormatContainer").style.zIndex = "99999";
    </script>
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
            document.getElementById("<%=Hdn_ExportValueName.ClientID %>").value = '';
            document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value = '';
            document.getElementById("<%=Hdn_SourceExportValueName.ClientID %>").value = '';

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
</body>
</html>
