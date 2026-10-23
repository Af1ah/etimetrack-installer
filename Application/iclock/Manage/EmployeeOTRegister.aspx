<%@ page language="VB" autoeventwireup="false" inherits="Manage_EmployeeOTRegister, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            return ret;
        }

        
    </script>
    <style type="text/css">
        .hiddencol
        {
            display: none;
        }
        
        .GridPager a, .GridPager span
        {
            display: block;
            height: 15px;
            width: 15px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }
        .GridPager a
        {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }
        .GridPager span
        {
            background-color: #84A5C1;
            color: #000;
            border: 1px solid #808080;
        }
        
         .myGridStyle
        {
            border-collapse:collapse;
             
        }
         
        .myGridStyle tr th
        {
            padding: 8px;
        }
        .myGridStyle td
        {
            padding: 2px;
        }
        
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; ">
                <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Employee OT Register
                </td>
                <td  style="font-size: 12px; background-color: lightsteelblue;
                    padding: 5px;" align="right">
                    <asp:Label ID="lbl_Note" runat="server" Font-Size="12px" Text="Note:"></asp:Label>&nbsp;<asp:CheckBox
                        ID="chk_Note" Font-Size="12px" Text="Represents, Preserve OverTime Value while Attendance Recalculation"
                        runat="server" />&nbsp;
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
                    <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                    <asp:DropDownList Width="100" ID="drpCompny" runat="server" AutoPostBack="true">
                    </asp:DropDownList>
                    <asp:Label ID="Label2" runat="server" Text="Department"></asp:Label>
                    <asp:DropDownList Width="100" ID="drpDepartment" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label8" runat="server" Text="Month"></asp:Label>
                    <asp:DropDownList Width="50px" ID="drpMonth" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label9" runat="server" Text="Year"></asp:Label>
                    <asp:DropDownList Width="52px" ID="drpYear" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label3" runat="server" Text="Emp Code"></asp:Label>
                    <asp:TextBox Width="50px" ID="txtCode" runat="server"></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox Width="67px" ID="txtName" runat="server"></asp:TextBox>
                    <asp:Label ID="Label5" runat="server" Text="Designation"></asp:Label>
                    <asp:DropDownList Width="80" ID="drpDesignation" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label7" runat="server" Text="Status"></asp:Label>
                    <asp:DropDownList Width="80" ID="drpStatus" runat="server">
                    </asp:DropDownList>
                    <asp:Label ID="Label6" runat="server" Text="Employment"></asp:Label>
                    <asp:DropDownList Width="80" ID="drpEmployment" runat="server">
                    </asp:DropDownList>
                    <asp:Button ID="btnGo" runat="server" Text="Go" />
                    <asp:Label ID="lblMonth" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="lblYear" runat="server" Visible="False"></asp:Label>
                    &nbsp;
                </td>
            </tr>
           <tr style="background-color: lightsteelblue;">
                <td colspan="2" style="height: 10px">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div style="overflow: auto; height: 300;">
                        <asp:GridView ID="dg_AttendanceLogsForOT"  runat="server" CssClass="myGridStyle" AutoGenerateColumns="False"
                            AllowPaging="True" OnPageIndexChanging="OnPageIndexChanging" BorderStyle="None"
                            PageSize="15" HeaderStyle-BackColor="#84A5C1" HeaderStyle-ForeColor="White" RowStyle-BackColor="#F6F7F7"
                            AlternatingRowStyle-BackColor="#EBECEC" AlternatingRowStyle-ForeColor="#000" Font-Size="11px" Font-Names="verdana">
                            <Columns>
                                <asp:BoundField ItemStyle-Width="20px" ReadOnly="true" DataField="EmployeeId" ItemStyle-CssClass="hiddencol"
                                    HeaderStyle-CssClass="hiddencol" HeaderText="EmployeeId">
                                    <ItemStyle Width="20px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="90px" ReadOnly="true" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-HorizontalAlign="Left" DataField="EmployeeCode" HeaderText="Emp.Code">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" Width="100px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="120px" ReadOnly="true" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-HorizontalAlign="Left" DataField="EmployeeName" HeaderText="Emp.Name">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" Width="90px"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="1" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_1" runat="server" Text='<%# Bind("1") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_1" Text='<%# Bind("1") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_1" Checked='<%# If(Eval("OT1").ToString() = "-1", "False", "True") %>'
                                            runat="server" />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="2" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_2" runat="server" Text='<%# Bind("2") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_2" Text='<%# Bind("2") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_2" runat="server" Checked='<%# If(Eval("OT2").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="3" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_3" runat="server" Text='<%# Bind("3") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_3" Text='<%# Bind("3") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_3" runat="server" Checked='<%# If(Eval("OT3").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="4" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_4" runat="server" Text='<%# Bind("4") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_4" Text='<%# Bind("4") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_4" runat="server" Checked='<%# If(Eval("OT4").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="5" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_5" runat="server" Text='<%# Bind("5") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_5" Text='<%# Bind("5") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_5" runat="server" Checked='<%# If(Eval("OT5").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="6" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_6" runat="server" Text='<%# Bind("6") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_6" Text='<%# Bind("6") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_6" runat="server" Checked='<%# If(Eval("OT6").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="7" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_7" runat="server" Text='<%# Bind("7") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_7" Text='<%# Bind("7") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_7" runat="server" Checked='<%# If(Eval("OT7").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="8" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_8" runat="server" Text='<%# Bind("8") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_8" Text='<%# Bind("8") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_8" runat="server" Checked='<%# If(Eval("OT8").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="9" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_9" runat="server" Text='<%# Bind("9") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_9" Text='<%# Bind("9") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_9" runat="server" Checked='<%# If(Eval("OT9").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="10" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_10" runat="server" Text='<%# Bind("10") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_10" Text='<%# Bind("10") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_10" runat="server" Checked='<%# If(Eval("OT10").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="11" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_11" runat="server" Text='<%# Bind("11") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_11" Text='<%# Bind("11") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_11" runat="server" Checked='<%# If(Eval("OT11").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="12" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_12" runat="server" Text='<%# Bind("12") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_12" Text='<%# Bind("12") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_12" runat="server" Checked='<%# If(Eval("OT12").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="13" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_13" runat="server" Text='<%# Bind("13") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_13" Text='<%# Bind("13") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_13" runat="server" Checked='<%# If(Eval("OT13").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="14" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_14" runat="server" Text='<%# Bind("14") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_14" Text='<%# Bind("14") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_14" runat="server" Checked='<%# If(Eval("OT14").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="15" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_15" runat="server" Text='<%# Bind("15") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_15" Text='<%# Bind("15") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_15" runat="server" Checked='<%# If(Eval("OT15").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="16" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_16" runat="server" Text='<%# Bind("16") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_16" Text='<%# Bind("16") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_16" runat="server" Checked='<%# If(Eval("OT16").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="17" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_17" runat="server" Text='<%# Bind("17") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_17" Text='<%# Bind("17") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_17" runat="server" Checked='<%# If(Eval("OT17").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="18" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_18" runat="server" Text='<%# Bind("18") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_18" Text='<%# Bind("18") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_18" runat="server" Checked='<%# If(Eval("OT18").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="19" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_19" runat="server" Text='<%# Bind("19") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_19" Text='<%# Bind("19") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_19" runat="server" Checked='<%# If(Eval("OT19").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="20" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_20" runat="server" Text='<%# Bind("20") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_20" Text='<%# Bind("20") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_20" runat="server" Checked='<%# If(Eval("OT20").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="21" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_21" runat="server" Text='<%# Bind("21") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_21" Text='<%# Bind("21") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_21" runat="server" Checked='<%# If(Eval("OT21").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="22" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_22" runat="server" Text='<%# Bind("22") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_22" Text='<%# Bind("22") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_22" runat="server" Checked='<%# If(Eval("OT22").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="23" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_23" runat="server" Text='<%# Bind("23") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_23" Text='<%# Bind("23") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_23" runat="server" Checked='<%# If(Eval("OT23").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="24" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_24" runat="server" Text='<%# Bind("24") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_24" Text='<%# Bind("24") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_24" runat="server" Checked='<%# If(Eval("OT24").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="25" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_25" runat="server" Text='<%# Bind("25") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_25" Text='<%# Bind("25") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_25" runat="server" Checked='<%# If(Eval("OT25").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="26" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_26" runat="server" Text='<%# Bind("26") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_26" Text='<%# Bind("26") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_26" runat="server" Checked='<%# If(Eval("OT26").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="27" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_27" runat="server" Text='<%# Bind("27") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_27" Text='<%# Bind("27") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_27" runat="server" Checked='<%# If(Eval("OT27").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="28" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_28" runat="server" Text='<%# Bind("28") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_28" Text='<%# Bind("28") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_28" runat="server" Checked='<%# If(Eval("OT28").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="29" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_29" runat="server" Text='<%# Bind("29") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_29" Text='<%# Bind("29") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_29" runat="server" Checked='<%# If(Eval("OT29").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="30" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_30" runat="server" Text='<%# Bind("30") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_30" Text='<%# Bind("30") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_30" runat="server" Checked='<%# If(Eval("OT30").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="31" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_31" runat="server" Text='<%# Bind("31") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_31" Text='<%# Bind("31") %>' Width="30px" Onkeypress="return IsNumeric(event);"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:CheckBox ID="chk_31" runat="server" Checked='<%# If(Eval("OT31").ToString() = "-1", "False", "True") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" Text="Update"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Right" CssClass="GridPager" />
                        </asp:GridView>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
