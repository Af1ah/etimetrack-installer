<%@ page language="VB" autoeventwireup="false" inherits="ShiftCalendarShedular, App_Web_usmjemmz" enableeventvalidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="~/styles/EasyMenu/Styles/vsnet/style.css" rel="stylesheet" type="text/css" />
</head>
		               
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                    <td style="width: 465px">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Shift Calendar:&nbsp;<asp:Label ID="lbl_shiftCalendarName"
                            runat="server" Text="Label" Font-Names="Verdana" Font-Bold="false" ForeColor="#0c416f"></asp:Label>
                    </td>
                    <td align="right" runat="server" id="td_DeviceCommand" style="width: 400px">
                        <asp:Label ID="Label2" runat="server" Text="Month"></asp:Label>&nbsp;<asp:DropDownList
                            ID="drp_Month" runat="server">
                        </asp:DropDownList>&nbsp;&nbsp;Year&nbsp;<asp:DropDownList ID="drp_Year" runat="server" />
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="btn_OK" runat="server" Text="OK" OnClientClick="return btn_OK_OnClientClick();" />&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" width="100%">
                     <div id="div_Shifts"  >
                        <asp:PlaceHolder ID="plchld_shiftCalender" runat="server"></asp:PlaceHolder>
                        </div>
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid">
                
                <tr style=" background-color: lightsteelblue">
                    <td style="width: 272px; height: 38px;">
                        &nbsp;&nbsp;<a style="font-family: Verdana; font-size: 13px; color: #0c416f;" href="ShiftCalenders.aspx">«
                            Go to Shift Calendar</a>
                    </td>
                    <td align="right" style="width: 609px; height: 38px;">
                        <asp:Label ID="Label1" runat="server" ForeColor="RoyalBlue" Text="Note: Hold CTRL to select cells" Font-Size="Small"></asp:Label>
                        <asp:Button style="display:none;"  ID="btn_Update" runat="server" OnClientClick=" return btn_Update_OnClientClick();"  Text="Update" Width="65px" />&nbsp;
                    </td>
                </tr>
            </table>
            <owd:Window ID="wnd_Shift" runat="server" ShowCloseButton="true" VisibleOnLoad="false"
                Left="400" Top="200" Height="110" Width="300" StyleFolder="~/Styles/mainwindow/blue"
                Title="Assign Shift" IsModal="False" ShowStatusBar="False" MinHeight="50" MinWidth="200">
                <table class="rowEditTable" width="100%" height="100%"  style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
                    <tr>
                        <td >
                            <fieldset>
                                <legend>Shift</legend>
                                <table width="100%" height="100%"  class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
                                    <tr>
                                        <td>
                                            Shift Name</td>
                                        <td>
                                            <asp:DropDownList ID="drp_Shift" runat="server"  CssClass="WebControls" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2">
                            <input id="btn_ShiftOk" type="button" value="Assign" onclick="ShiftOk_Onclick();"   class="WebControls" />&nbsp;&nbsp;&nbsp;&nbsp;<input
                                id="btn_ShiftCancel" type="button" value="Close" onclick="javascript:closeShiftWindow();"   class="WebControls" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HiddenField ID="Hdn_ShiftIds" runat="server" />
                            <asp:HiddenField ID="Hdn_SelectedShiftIds" runat="server" />
                            <asp:HiddenField ID="Hdn_ShiftDates" runat="server" />
                            <asp:HiddenField ID="HDN_IsUpdateMade" runat="server" />
                        </td>
                    </tr>
                </table>
            </owd:Window>
            <oem:EasyMenu ID="EasyMenu1" runat="server" StyleFolder="~/styles/EasyMenu/Styles/vsnet"
                IconsFolder="MenuIcons" Width="210" UseIcons="true" AttachTo="div_Shifts" ShowEvent="ContextMenu"
                Align="Cursor">
                <Components>
                    <oem:MenuItem ID="menuItem1" InnerHtml="Assign Shift" OnClientClick="ShowAddWindow();">
                    </oem:MenuItem>
                    <oem:MenuSeparator ID="menuSeparator1" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                    </oem:MenuSeparator>
                    <oem:MenuItem ID="menuItem4" InnerHtml="Delete Shift" OnClientClick="DeleteShift();">
                    </oem:MenuItem>
                    <oem:MenuSeparator ID="menuSeparator2" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                    </oem:MenuSeparator>
                    <oem:MenuItem ID="menuItem5" InnerHtml="WeeklyOff" OnClientClick="SetWeeklyOff();">
                    </oem:MenuItem>
                    <oem:MenuSeparator ID="menuSeparator3" InnerHtml="&amp;nbsp;" AllowsIcon="true">
                    </oem:MenuSeparator>
                </Components>
            </oem:EasyMenu>
        </div>
    </form>

    <script type="text/javascript">
        var IsChangesMade=false;
        var objTableCell;
        var Move;
        var Action;
         
        function closeShiftWindow()
		     {
		         try
		         {
		            wnd_Shift.Close();
		         }
		         catch(ex)
		         {
		            alert(ex.message);
		         }
		    }
		    
		       
		    function ShowAddWindow() {	
		    Action='';
		        try {
		           wnd_Shift.Open();
                } catch(ex){
					alert(ex);
				}
		    }
		    
		    function DeleteShift()
		        {	
		            Action='Delete Shift';
		            document.getElementById("btn_ShiftOk").click();
    		        
    		       
		        }
		        
		        function SetWeeklyOff()
		        {	
		            Action='WeeklyOff';
    		        document.getElementById("btn_ShiftOk").click();
		        }
		     
		        function MonthCell_OnMouseDown(objTD,ShiftDate)
		        {
	                   var e = window.event;
	                   if (e.ctrlKey)
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
		        
		        
		    
		        function btn_Update_OnClientClick()
		            { 
		                var ShiftsId='';
		                var ShiftDates='';
		                document.getElementById("<%=Hdn_ShiftDates.ClientID %>").value='';
                        document.getElementById("<%=Hdn_ShiftIds.ClientID %>").value='';
		                var myTable = document.getElementById('Shif_Table');
                        var mytablebody = myTable.getElementsByTagName("tbody")[0];
                        var tds = mytablebody.getElementsByTagName('td');
                        for (i=0;i<tds.length;i++)
                        { 
                            var ElementTitle=tds[i].title;
                            if (ElementTitle != '')
                            {
                                ShiftsId=ShiftsId+ElementTitle.split("_")[0]+',';
                                ShiftDates=ShiftDates+ElementTitle.split("_")[1]+',';
                            }

                        }
                        document.getElementById("<%=Hdn_ShiftDates.ClientID %>").value=ShiftDates;
                        
                        document.getElementById("<%=Hdn_ShiftIds.ClientID %>").value=ShiftsId;
                        return true;
		            }

		            function ShiftOk_Onclick()
		                {
		                    document.getElementById("<%=HDN_IsUpdateMade.ClientID %>").value='';
		                    var selected_text;
		                    var ShiftId;
		                    
		                    if(Action=='Delete Shift')
		                    {
		                        ShiftId=0;
		                        selected_text='';
		                    }
		                    else if(Action=='WeeklyOff')
		                    {
		                        ShiftId=1;
		                        selected_text='WO';
		                    }
		                    else
		                    {
		                        var w = document.getElementById("<%=drp_Shift.ClientID %>").selectedIndex;
		                        selected_text = document.getElementById("<%=drp_Shift.ClientID %>").options[w].text;
		                        ShiftId=document.getElementById("<%=drp_Shift.ClientID %>").value;
		                    }
		                    
		                    IsChangesMade=true;
		                    document.getElementById("<%=HDN_IsUpdateMade.ClientID %>").value='true';
		                    var myTable = document.getElementById('Shif_Table');
                            var mytablebody = myTable.getElementsByTagName("tbody")[0];
                            var tds = mytablebody.getElementsByTagName('td');
                            for (i=0;i<tds.length;i++)
                            { 
                            if(tds[i].style.backgroundColor != '')
                               {

                                 var ShiftDate=document.getElementById("<%=drp_Year.ClientID %>").value+"-"+document.getElementById("<%=drp_Month.ClientID %>").value+"-"+tds[i].parentElement.previousSibling.getElementsByTagName('td')[0].innerHTML.replace(document.getElementById("<%=drp_Month.ClientID %>").options[document.getElementById("<%=drp_Month.ClientID %>").selectedIndex].text+' ', "");
                                 if(colorToHex(tds[i].style.backgroundColor)=='#fff7d7')
                                    {
                                        if(document.getElementById("<%=Hdn_SelectedShiftIds.ClientID %>").value.indexOf(ShiftDate)>=0)
                                            {
		                                        tds[i].innerText=selected_text;
		                                        tds[i].title=ShiftId+"_"+ShiftDate;
		                                        tds[i].style.backgroundColor=colorToHex('#ffffff');    
                                            }
                                    }
                                }    
                            }
		                        document.getElementById("<%=btn_Update.ClientID %>").click();
		                }

		    
		           function btn_OK_OnClientClick()
		                {
		                    if(IsChangesMade==true)
		                        {
		                             var Status=confirm('You Made Some Changes. Do You Want To Update it.');
		                             if(Status==true)
		                             {
		                                document.getElementById("<%=HDN_IsUpdateMade.ClientID %>").value='true';
		                                document.getElementById("<%=btn_Update.ClientID %>").click();
		                             }
		                             else
		                             {
		                                document.getElementById("<%=HDN_IsUpdateMade.ClientID %>").value='';
		                             }
		                             return true;
		                        }
		                     else
		                            return true;
		                }
		        
    </script>

</body>
</html>
