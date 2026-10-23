<%@ page language="VB" autoeventwireup="false" inherits="Admin_ShiftRoster, App_Web_kgq5n2bg" enableeventvalidation="true" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<script type="text/javascript">	
	// Client-Side Events for Delete
	function OnBeforeDelete(record) 
	    {
	        record.Error='';
	        
		    document.getElementById("<%=Hdn_ShiftRotationMasterId.ClientID %>").value = record.ShiftRotationMasterId;
	        if(confirm("Are you sure you want to delete? "))
	            return true;
	        else
	            return false;
	    }
	
	function OnDelete(record) 
	{
	    alert(record.Error);
	}
	
	function onRecordSelect(arrSelectedRecords) 
           {
		         for(var i=0; i<Dg_ShiftRotationMasters.SelectedRecords.length;i++) 
		         {
	                var record = Dg_ShiftRotationMasters.SelectedRecords[i];
	                document.getElementById("<%=Hdn_ShiftRotationMasterId.ClientID %>").value = record.ShiftRotationMasterId;
		         }
	        }
	        
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    
    </script>
</head>
<body onload="ShiftRotationPattern_onclick();Daily_Shift_CheckedChange();WeeklyOff_CheckedChange();SetValueAfterPostback();">
    <form id="form1" runat="server">
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                        padding: 5px; color: white;">
                        <asp:HiddenField  ID="Hdn_ShiftRotationMasterId" runat="server" />
                        Shift Roster List
                    </td>
                </tr>
                <tr style="background-color: lightsteelblue;">
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    
                    
			            
                        <obout:Grid ID="Dg_ShiftRotationMasters"   runat="server" AutoGenerateColumns="false" AllowFiltering="true"   FolderStyle="~/styles/grid/styles/premiere_blue" AllowMultiRecordSelection="false" 	 AllowAddingRecords="true" OnDeleteCommand="DeleteRecord"	 PageSize="15" >
                            <ClientSideEvents OnBeforeClientDelete="OnBeforeDelete" OnClientDelete="OnDelete"  OnClientSelect="onRecordSelect"  />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                            <Columns>
                                <obout:Column ID="Column0" DataField="ShiftRotationMasterId" Visible="true" Width="300"  HeaderText="ShiftRotationMasterId" />
                                <obout:Column ID="Column1" DataField="ShiftRotationMasterName" SortOrder="Asc" Width="340" HeaderText="Shift Roster Name" />
                                <obout:Column ID="Column2" DataField="ShiftRotationType" Width="330"  HeaderText="Shift Roster Type" />
                                <obout:Column Width="65" AllowEdit="True" HeaderText="Edit" AllowDelete="True"  TemplateId="tplEditBtn"><TemplateSettings TemplateId="tplEditBtn" /></obout:Column>
                                <obout:Column Width="70" AllowEdit="false" HeaderText="Delete" AllowDelete="True"  />
                            </Columns>
                            <Templates>
                                <obout:GridTemplate runat="server" ID="tplEditBtn" ControlID="" ControlPropertyName="">
                                    <Template>
                                        <asp:LinkButton ID="lnk_Edit" runat="server" OnClick="lnk_Edit_OnClick">Edit</asp:LinkButton>
                                    </Template>
                                </obout:GridTemplate>
                                <obout:GridTemplate runat="server" ID="tplAddBtn" ControlID="" ControlPropertyName="">
                                    <Template>
                                        <asp:LinkButton ID="lnk_Add" runat="server" OnClick="lnk_Add_OnClick">Add</asp:LinkButton>
                                    </Template>
                                </obout:GridTemplate>
                            </Templates>
                        </obout:Grid>
                    </td>
                </tr>
            </table>
            <owd:Window ID="wnd_ShiftRotationDeatils" runat="server" Height="390" StyleFolder="~/Styles/mainwindow/blue"
                Title="Shift Rotation Master" Visible="false" Width="940"
                IsResizable="true" ShowStatusBar="false" Left="350" Top="155">
                <table class="rowEditTable"  style="height:100%;width:100%;" >
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Shift Rotation Master</legend>
                                <table>
                                    <tr>
                                        <td style="font-weight: bold;">
                                            Rotation Master Name</td>
                                        <td>
                                            <asp:TextBox ID="txt_RotationMasterName" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            Begin Day
                                        </td>
                                        <td>
                                            <select id="drp_FromDateday" runat="server" width="46px">
                                            </select>
                                            &nbsp;&nbsp;<select id="drp_FromDatemonth" runat="server" width="48px">
                                            </select>&nbsp;&nbsp;<select id="drp_FromDateYear" runat="server" width="69px">
                                            </select>
                                        </td>
                                        <td align="right">
                                            End Day</td>
                                        <td>
                                            <select id="drp_ToDateday" runat="server" width="46px">
                                            </select>
                                            &nbsp;&nbsp;<select id="drp_ToDatemonth" runat="server" width="48px">
                                            </select>&nbsp;&nbsp;<select id="drp_ToDateYear" runat="server" width="69px">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Shift Rotation Pattern
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="Rbtn_Daily" Checked="true" onclick="Rbtn_ShiftRotationPattern_OnChange(this)" runat="server"
                                                Text="Daily" />
                                        </td>
                                        <td colspan="1">
                                            <asp:RadioButton ID="Rbtn_Weekly" onclick="Rbtn_ShiftRotationPattern_OnChange(this)" runat="server"
                                                Text="Weekly" />
                                        </td>
                                        <td  align="left">
                                            <asp:RadioButton ID="Rbtn_Monthly" onclick="Rbtn_ShiftRotationPattern_OnChange(this)" runat="server"
                                                Text="Monthly" />&nbsp;<asp:Label id="Label8" runat="server" ForeColor="RoyalBlue" Text="Note:Hold CTRL to select cells" ></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <fieldset id="fieldset_Daily">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="chk_DailyShift1" runat="server" Text="1st Day"  onclick="Daily_Shift_CheckedChange()" />
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_1stDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="chk_DailyShift2" runat="server" Text="2nd Day" onclick="Daily_Shift_CheckedChange()" />
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_2ndDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="chk_DailyShift3" runat="server" Text="3rd Day" onclick="Daily_Shift_CheckedChange()" />
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_3rdDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="chk_DailyShift4" runat="server" Text="4th Day" onclick="Daily_Shift_CheckedChange()" />
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_4thDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="chk_DailyShift5" runat="server" Text="5th Day" onclick="Daily_Shift_CheckedChange()" />
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_5thDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="chk_DailyShift6" runat="server" Text="6th Day" onclick="Daily_Shift_CheckedChange()" />
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_6thDayShift" runat="server" Enabled="false">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="chk_DailyShift7" runat="server" Text="7th Day" onclick="Daily_Shift_CheckedChange()" />
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_7thDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                        <td >
                                            <fieldset id="fieldset_Weekly">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Monday
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_MondayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            TuesDay
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_TuesDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            WednesDay
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_WednesDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            ThursDay
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_ThursDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            FriDay
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_FriDayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Saturday
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_SaturdayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Sunday
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drp_SundayShift" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                        <td colspan="3" style="vertical-align: top;">
                                            <fieldset id="fieldset_Monthly">
                                                <div id="div_Shifts">
                                                    <table cellspacing="0" cellpadding="8" id="table_Monthly">
                                                        <tr>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: blue;">
                                                                <asp:Label ID="Label1" runat="server" Text="Mon"  ForeColor="White" Font-Bold="true"></asp:Label> 
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: blue;">
                                                                <asp:Label ID="Label2" runat="server" Text="Tue"  ForeColor="White" Font-Bold="true"></asp:Label> 
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: blue;">
                                                                <asp:Label ID="Label3" runat="server" Text="Wed"  ForeColor="White" Font-Bold="true"></asp:Label> 
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: blue;">
                                                                <asp:Label ID="Label4" runat="server" Text="Thu"  ForeColor="White" Font-Bold="true"></asp:Label> 
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: blue;">
                                                                <asp:Label ID="Label5" runat="server" Text="Fri"  ForeColor="White" Font-Bold="true"></asp:Label> 
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: blue;">
                                                                <asp:Label ID="Label6" runat="server" Text="Sat"  ForeColor="White" Font-Bold="true"></asp:Label> 
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: blue;">
                                                                <asp:Label ID="Label7" runat="server" Text="Sun"  ForeColor="White" Font-Bold="true"></asp:Label> 
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'01')">
                                                                <asp:Label ID="lbl_Monthly1" runat="server" Text="01" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;"  onmousedown="MonthCell_OnMouseDown(this,'02')">
                                                                <asp:Label ID="lbl_Monthly2" runat="server" Text="02" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'03')">
                                                                <asp:Label ID="lbl_Monthly3" runat="server" Text="03" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'04')">
                                                                <asp:Label ID="lbl_Monthly4" runat="server" Text="04" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'05')">
                                                                <asp:Label ID="lbl_Monthly5" runat="server" Text="05" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'06')">
                                                                <asp:Label ID="lbl_Monthly6" runat="server" Text="06" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'07')">
                                                                <asp:Label ID="lbl_Monthly7" runat="server" Text="07" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'08')">
                                                                <asp:Label ID="lbl_Monthly8" runat="server" Text="08" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'09')">
                                                                <asp:Label ID="lbl_Monthly9" runat="server" Text="09" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'10')">
                                                                <asp:Label ID="lbl_Monthly10" runat="server" Text="10" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'11')">
                                                                <asp:Label ID="lbl_Monthly11" runat="server" Text="11" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'12')">
                                                                <asp:Label ID="lbl_Monthly12" runat="server" Text="12" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'13')">
                                                                <asp:Label ID="lbl_Monthly13" runat="server" Text="13" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'14')">
                                                                <asp:Label ID="lbl_Monthly14" runat="server" Text="14" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'15')">
                                                                <asp:Label ID="lbl_Monthly15" runat="server" Text="15" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'16')">
                                                                <asp:Label ID="lbl_Monthly16" runat="server" Text="16" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'17')">
                                                                <asp:Label ID="lbl_Monthly17" runat="server" Text="17" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'18')">
                                                                <asp:Label ID="lbl_Monthly18" runat="server" Text="18" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'19')">
                                                                <asp:Label ID="lbl_Monthly19" runat="server" Text="19" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'20')">
                                                                <asp:Label ID="lbl_Monthly20" runat="server" Text="20" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'21')">
                                                                <asp:Label ID="lbl_Monthly21" runat="server" Text="21" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'22')">
                                                                <asp:Label ID="lbl_Monthly22" runat="server" Text="22" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'23')">
                                                                <asp:Label ID="lbl_Monthly23" runat="server" Text="23" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'24')">
                                                                <asp:Label ID="lbl_Monthly24" runat="server" Text="24" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'25')">
                                                                <asp:Label ID="lbl_Monthly25" runat="server" Text="25" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'26')">
                                                                <asp:Label ID="lbl_Monthly26" runat="server" Text="26" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'27')">
                                                                <asp:Label ID="lbl_Monthly27" runat="server" Text="27" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'28')">
                                                                <asp:Label ID="lbl_Monthly28" runat="server" Text="28" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'29')">
                                                                <asp:Label ID="lbl_Monthly29" runat="server" Text="29" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'30')">
                                                                <asp:Label ID="lbl_Monthly30" runat="server" Text="30" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                            <td style="border-right: black 1px solid; border-top: black 1px solid; border-left: black 1px solid;
                                                                border-bottom: black 1px solid; background-color: #FFFFFF;" onmousedown="MonthCell_OnMouseDown(this,'31')">
                                                                <asp:Label ID="lbl_Monthly31" runat="server" Text="31" style="white-space: nowrap;" ></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        
                                            <asp:CheckBox ID="chk_WeeklyOff1" runat="server" Text="Weekly Off 1"  onclick="WeeklyOff_CheckedChange()" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drp_WeeklyOff1" runat="server">
                                                <asp:ListItem Value="0">Sunday</asp:ListItem>
                                                <asp:ListItem Value="1">Monday</asp:ListItem>
                                                <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                                <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                                <asp:ListItem Value="4">Thrusday</asp:ListItem>
                                                <asp:ListItem Value="5">Friday</asp:ListItem>
                                                <asp:ListItem Value="6">Saturday</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chk_WeeklyOff2" runat="server" Text="Weekly Off 2" onclick="WeeklyOff_CheckedChange()" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drp_WeeklyOff2" runat="server">
                                                <asp:ListItem Value="0">Sunday</asp:ListItem>
                                                <asp:ListItem Value="1">Monday</asp:ListItem>
                                                <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                                <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                                <asp:ListItem Value="4">Thrusday</asp:ListItem>
                                                <asp:ListItem Value="5">Friday</asp:ListItem>
                                                <asp:ListItem Value="6">Saturday</asp:ListItem>
                                            </asp:DropDownList>
                                            &nbsp;&nbsp;
                                            <asp:DropDownList ID="drp_WeeklyOff2Type" runat="server">
                                                <asp:ListItem>Every</asp:ListItem>
                                                <asp:ListItem>Alt(2,4)</asp:ListItem>
                                                <asp:ListItem>Alt(1,3,5)</asp:ListItem>
                                                <asp:ListItem>1st</asp:ListItem>
                                                <asp:ListItem>2nd</asp:ListItem>
                                                <asp:ListItem>3rd</asp:ListItem>
                                                <asp:ListItem>4th</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                                                <asp:Button ID="btn_Save" OnClientClick="return btn_save_OnClientClick();" runat="server" Text="Save" />&nbsp;&nbsp;<input id="btn_Cancel" type="button" value="Close" onclick="wnd_ShiftRotationDeatils.Close()" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; &nbsp; 
                            <asp:Label runat="server" ForeColor="Red" EnableViewState="False" ID="Lbl_InvalidError"></asp:Label>
                        </td>
                    </tr>
                </table>
            </owd:Window>
            
            
            <owd:Window ID="wnd_Shift" runat="server" ShowCloseButton="true" VisibleOnLoad="false"
                Left="400" Top="200" Height="110" Width="300" StyleFolder="~/Styles/mainwindow/blue"
                Title="Assign Shift" IsModal="False" ShowStatusBar="False" MinHeight="50" MinWidth="200">
                <table class="rowEditTable" width="100%" height="100%" style="border-top-style: none;
                    border-right-style: none; border-left-style: none; border-bottom-style: none;">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Shift</legend>
                                <table width="100%" height="100%" class="Table" style="border-top-style: none; border-right-style: none;
                                    border-left-style: none; border-bottom-style: none;">
                                    <tr>
                                        <td>
                                            Shift Name</td>
                                        <td>
                                            <asp:DropDownList ID="drp_Shift" runat="server" CssClass="WebControls">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <input id="btn_ShiftOk" type="button" value="Assign" onclick="ShiftOk_Onclick();"
                                class="WebControls" />&nbsp;&nbsp;&nbsp;&nbsp;<input id="btn_ShiftCancel" type="button"
                                    value="Close" onclick="wnd_Shift.Close();" class="WebControls" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HiddenField ID="Hdn_SelectedShiftIds" runat="server" />
                        </td>
                    </tr>
                </table>
            </owd:Window>
            
            <oem:EasyMenu ID="EasyMenu1" runat="server" StyleFolder="~/styles/EasyMenu/Styles/vsnet"
                IconsFolder="MenuIcons" Width="210" UseIcons="true" AttachTo="div_Shifts" ShowEvent="ContextMenu"
                Align="Cursor">
                <Components>
                    <oem:MenuItem ID="menuItem1" InnerHtml="Select Shift" OnClientClick=" wnd_Shift.Open();">
                    </oem:MenuItem>
                </Components>
            </oem:EasyMenu>
        </div>
    </form>

    <script type="text/javascript">
    
    function ShiftRotationPattern_onclick()
    {
        document.getElementById("fieldset_Daily").disabled=true; 
        document.getElementById("fieldset_Weekly").disabled=true; 
        document.getElementById("fieldset_Monthly").disabled=true; 
        
        
        
        if(document.getElementById("<%=Rbtn_Daily.ClientID %>").checked)
        {
            document.getElementById("fieldset_Daily").disabled=false; 
        }
        if(document.getElementById("<%=Rbtn_Weekly.ClientID %>").checked)
        {
            document.getElementById("fieldset_Weekly").disabled=false; 
        }
        if(document.getElementById("<%=Rbtn_Monthly.ClientID %>").checked)
        {
            document.getElementById("fieldset_Monthly").disabled=false; 
        }
    }
    
    
    
    function Rbtn_ShiftRotationPattern_OnChange(object)
    {
        if (object.value=='Rbtn_Daily')
        {
            document.getElementById("<%=Rbtn_Weekly.ClientID %>").checked=false
            document.getElementById("<%=Rbtn_Monthly.ClientID %>").checked=false
            
        }
        else if (object.value=='Rbtn_Weekly')
        {
            document.getElementById("<%=Rbtn_Daily.ClientID %>").checked=false
            document.getElementById("<%=Rbtn_Monthly.ClientID %>").checked=false
        }
        else if (object.value=='Rbtn_Monthly')
        {
            document.getElementById("<%=Rbtn_Weekly.ClientID %>").checked=false
            document.getElementById("<%=Rbtn_Daily.ClientID %>").checked=false
        }
        ShiftRotationPattern_onclick();
    }
    
    function WeeklyOff_CheckedChange()
    {
     if(document.getElementById("<%=chk_WeeklyOff1.ClientID %>").checked)
        {
            document.getElementById("<%=drp_WeeklyOff1.ClientID %>").disabled=false; 
        }
     else
        {
            document.getElementById("<%=drp_WeeklyOff1.ClientID %>").disabled=true; 
        }   
        
        
       if(document.getElementById("<%=chk_WeeklyOff2.ClientID %>").checked)
        {
            document.getElementById("<%=drp_WeeklyOff2.ClientID %>").disabled=false; 
            document.getElementById("<%=drp_WeeklyOff2Type.ClientID %>").disabled=false; 
        }
     else
        {
            document.getElementById("<%=drp_WeeklyOff2.ClientID %>").disabled=true; 
            document.getElementById("<%=drp_WeeklyOff2Type.ClientID %>").disabled=true; 
        }
    }
    
    function Daily_Shift_CheckedChange()
    {
            
            
            if(document.getElementById("<%=chk_DailyShift1.ClientID %>").checked)
            {
                document.getElementById("<%=drp_2ndDayShift.ClientID %>").disabled=false; 
                document.getElementById("<%=chk_DailyShift2.ClientID %>").disabled=false; 
            }
            else
            {
                document.getElementById("<%=chk_DailyShift2.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift3.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift4.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift5.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift6.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").checked=false; 
                
                document.getElementById("<%=chk_DailyShift2.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift3.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift4.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift5.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift6.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").disabled=true; 
                
                document.getElementById("<%=drp_2ndDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_3rdDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_4thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_5thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_6thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_7thDayShift.ClientID %>").disabled=true; 
                
                
                
            }
            
            if(document.getElementById("<%=chk_DailyShift2.ClientID %>").checked)
            {
                document.getElementById("<%=drp_3rdDayShift.ClientID %>").disabled=false; 
                document.getElementById("<%=chk_DailyShift3.ClientID %>").disabled=false; 
            }
            else
            {
                document.getElementById("<%=chk_DailyShift3.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift4.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift5.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift6.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").checked=false; 
                
                document.getElementById("<%=chk_DailyShift3.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift4.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift5.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift6.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").disabled=true;
                
                document.getElementById("<%=drp_3rdDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_4thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_5thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_6thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_7thDayShift.ClientID %>").disabled=true;  
            }
            
            if(document.getElementById("<%=chk_DailyShift3.ClientID %>").checked)
            {
                document.getElementById("<%=drp_4thDayShift.ClientID %>").disabled=false; 
                document.getElementById("<%=chk_DailyShift4.ClientID %>").disabled=false; 
            }
            else
            {
                document.getElementById("<%=chk_DailyShift4.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift5.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift6.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").checked=false;
                
                document.getElementById("<%=chk_DailyShift4.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift5.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift6.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").disabled=true;  
                
                document.getElementById("<%=drp_4thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_5thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_6thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_7thDayShift.ClientID %>").disabled=true;  
            }
            
            if(document.getElementById("<%=chk_DailyShift4.ClientID %>").checked)
            {
                document.getElementById("<%=drp_5thDayShift.ClientID %>").disabled=false; 
                document.getElementById("<%=chk_DailyShift5.ClientID %>").disabled=false; 
            }
             else
            {
                document.getElementById("<%=chk_DailyShift5.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift6.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").checked=false; 
                
                document.getElementById("<%=chk_DailyShift5.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift6.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").disabled=true; 
                
                document.getElementById("<%=drp_5thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_6thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_7thDayShift.ClientID %>").disabled=true;
            }
            
            if(document.getElementById("<%=chk_DailyShift5.ClientID %>").checked)
            {
                document.getElementById("<%=drp_6thDayShift.ClientID %>").disabled=false; 
                document.getElementById("<%=chk_DailyShift6.ClientID %>").disabled=false; 
            }
            else
            {
                document.getElementById("<%=chk_DailyShift6.ClientID %>").checked=false; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").checked=false;
                
                document.getElementById("<%=chk_DailyShift6.ClientID %>").disabled=true; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").disabled=true; 
                
                document.getElementById("<%=drp_6thDayShift.ClientID %>").disabled=true; 
                document.getElementById("<%=drp_7thDayShift.ClientID %>").disabled=true;
            }
            
            if(document.getElementById("<%=chk_DailyShift6.ClientID %>").checked)
            {
                document.getElementById("<%=drp_7thDayShift.ClientID %>").disabled=false; 
                document.getElementById("<%=chk_DailyShift7.ClientID %>").disabled=false; 
            }
            else
            {
                document.getElementById("<%=chk_DailyShift7.ClientID %>").checked=false; 
                
                document.getElementById("<%=chk_DailyShift7.ClientID %>").disabled=true; 
                
                document.getElementById("<%=drp_7thDayShift.ClientID %>").disabled=true; 
            }
    }
    
     function MonthCell_OnMouseDown(objTD,ShiftDate)
		        {
		            ShiftDate=document.getElementById("<%=drp_FromDateYear.ClientID %>").value+'-'+document.getElementById("<%=drp_FromDatemonth.ClientID %>").value+'-'+ShiftDate
	                    var e = window.event;
	                    if(e.ctrlKey)
	                    {
	                        if(colorToHex(objTD.style.backgroundColor)=='#ffffff')
	                            {
	                                objTD.style.backgroundColor=colorToHex('#FFF7D7');
		                            document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value=document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value+ShiftDate+',';
	                            }
	                        else
	                            {
	                                objTD.style.backgroundColor=colorToHex('#ffffff');
	                                document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value=document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value.replace(ShiftDate+',', ""); 
	                            }    
	                    }
		         }
		         
		         function colorToHex(color) 
		         {
                    if (color.substr(0, 1) === '#') 
                        {
                            return color;
                        }
                    var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(color);
                    var red = parseInt(digits[2]);
                    var green = parseInt(digits[3]);
                    var blue = parseInt(digits[4]);
                    var rgb = blue | (green << 8) | (red << 16);
                    return digits[1] + '#' + rgb.toString(16);
                }
                
                function ShiftOk_Onclick11()
		                {
		                    var tds=document.getElementById("table_Monthly").getElementsByTagName('td');
		                    for(var i=0;i<tds.length;i++)
		                    {
		                                alert(tds[i].style.backgroundColor);
		                        if(colorToHex(tds[i].style.backgroundColor)=='#FFF7D7')
	                                {
	                                   
	                                }
		                    }
		                }
		                
		                function ShiftOk_Onclick()
		                {
		                    var tds=document.getElementById("table_Monthly").getElementsByTagName('td');
		                    for (objTd in tds)
                                {
                                    if(objTd>6)
                                    {
                                        if(colorToHex(tds[objTd].style.backgroundColor)=='#fff7d7')
                                            {
                                                tds[objTd].style.backgroundColor=colorToHex('#ffffff');
                                                 var object=document.getElementById("<%=drp_Shift.ClientID %>")
	                                             var SelectShift=object.options[object.selectedIndex].text
	                                             var SpanId=tds[objTd].getElementsByTagName('span');
	                                             if(SelectShift=='None')
	                                             {
	                                                SpanId[0].innerText=SpanId[0].innerText.split("-")[0] 
	                                             }
	                                             else
	                                             {
	                                                SpanId[0].innerText=SpanId[0].innerText.split("-")[0]+'-'+SelectShift;
	                                             }
	                                             
                                            }
                                    }
                                }
		                }
		                
		                
		                
		                function btn_save_OnClientClick()
		                {
		                    document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value='';
		                    var tds=document.getElementById("table_Monthly").getElementsByTagName('td');
		                    for (objTd in tds)
                                {
                                    if(objTd>6)
                                    {
                                        var TdSpanValue=tds[objTd].getElementsByTagName('span')[0].innerText;
                                        document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value=document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value+TdSpanValue+"$"
                                    }
                                  }  
		                    return true;
		                }
		                
		                function SetValueAfterPostback()
		                {
		                    if(document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value != "")
		                        {
		                            var tds=document.getElementById("table_Monthly").getElementsByTagName('td');
		                            for (objTd in tds)
                                        {
                                            if(objTd>6)
                                            {
                                                tds[objTd].getElementsByTagName('span')[0].innerText=document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value.split('$')[objTd-7];
                                            }
                                          } 
		                        }
		                }
    </script>
    
    <script type="text/javascript">
        document.getElementById("EasyMenu1").style.zIndex="99999";
        document.getElementById('wnd_Shift_container').style.zIndex = 1000000000;
        document.getElementById('wnd_Shift_container').style.position='absolute';
    </script>
</body>
</html>
