<%@ page language="VB" autoeventwireup="false" inherits="Manage_MasterSettings, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body onload="IsFixedShift_OnChange();">
    <form id="form1" runat="server">
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
            <owd:Window ID="MasterSettings" runat="server" IsModal="true" Height="300" Width="550"
                StyleFolder="~/Styles/mainwindow/blue" Title="Master Settings"
                ShowCloseButton="true" ShowStatusBar="False" Left="150" Top="20" >
              <table width="100%" cellpadding="1" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: none;">
                    <tr>
                        <td>
                            <fieldset>
                                <legend></legend>
                                <table>
                                    <tr>
                                        <td align="left">
                                            <asp:CheckBox ID="chk_EmployeeCodeindeviceisnotsame" runat="server" Text="Employee Code in Device is Same" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:CheckBox ID="chk_FixedShift" runat="server" Text="Fixed Shift" onclick="IsFixedShift_OnChange();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Begin
                                            Time
                                        </td>
                                        <td align="left" colspan="1">
                                            <asp:DropDownList runat="server" ID="msktxt_hhBeginTime" Width="70px">
                                            </asp:DropDownList>&nbsp;:&nbsp;<asp:DropDownList runat="server" ID="msktxt_mmBeginTime"
                                                Width="67px">
                                            </asp:DropDownList>&nbsp;HH:MM 24 hr fmt
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            End Time&nbsp;<asp:DropDownList runat="server" ID="msktxt_hhEndTime" Width="70px">
                                            </asp:DropDownList>&nbsp;:&nbsp;<asp:DropDownList runat="server" ID="msktxt_mmEndTime"
                                                Width="67px">
                                            </asp:DropDownList>&nbsp;HH:MM 24 hr fmt
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Attendence Year Starts On</td>
                                        <td align="left">
                                            <asp:DropDownList runat="server" ID="drp_Date" Width="70px">
                                            </asp:DropDownList>&nbsp;&nbsp;&nbsp;<asp:DropDownList runat="server" ID="drp_Month"
                                                Width="70px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Minimum Difference Between Two Punches</td>
                                        <td>
                                            <asp:TextBox ID="txt_DiffBetweenTwoPunch" runat="server"></asp:TextBox>&nbsp;in
                                            Mins
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Punch Begin Duration</td>
                                        <td>
                                            <asp:TextBox ID="txt_PunchbeginDuration" runat="server"></asp:TextBox>&nbsp;in Mins
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            When no shift assigned Consider&nbsp;
                                        </td>
                                        <td>
                                            <select id="drp_IsAutoShift" runat="server">
                                            <option>Previous Day Shift</option>
                                                <option>Auto Shift</option>
                                            </select>
                                        </td>
                                    </tr>
                                     <tr id="trGetEmployeeLogs" runat="server">
                                        <td>
                                            Get Employee Logs Using&nbsp;
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdoWebService" Checked="true" GroupName="Logs" Text="Web Process" runat="server" />&nbsp;
                                            <asp:RadioButton ID="rdoWebApplication" GroupName="Logs" Text="Web Application" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        Allow Department Head To Update OT
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chk_AllowOTToDepartmentHead" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Lbl_Error" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label><asp:Button ID="Btn_Save" runat="server" Text="Save" Width="60px"  OnClientClick="return Btn_SaveOnClientClick();" />
                            &nbsp;&nbsp;&nbsp;<input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeWindow();" /><asp:HiddenField ID="hdn_FixedShift" runat="server" />
                                
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    
                    
                    
                </table>
            </owd:Window>
        </div>
  
    </form>

    <script type="text/javascript">
       function closeWindow()
       {
            try
		         {
		        
		        MasterSettings.Close();
		         }
		         catch(ex)
		         {
		            alert(ex.message);
		         }
	   }
	   
	    function Btn_SaveOnClientClick()
           {
            if(document.getElementById('<%=hdn_FixedShift.ClientID %>').value.toLowerCase()=='false' && document.getElementById('<%=chk_FixedShift.ClientID %>').checked==true)
                    return confirm('Are you sure you wants to change the Settings. Application Will Relogin');
            else if(document.getElementById('<%=hdn_FixedShift.ClientID %>').value.toLowerCase()=='true' && document.getElementById('<%=chk_FixedShift.ClientID %>').checked==false)
                    return confirm('Are you sure you wants to change the settings. Application Will Relogin');        
            else
                    return true;        
           }
	   
	   function IsFixedShift_OnChange()
	        {
	            var Object=document.getElementById('<%=chk_FixedShift.ClientID %>')
	            if(Object.checked)
	            {
	                document.getElementById('<%=msktxt_hhBeginTime.ClientID %>').disabled=false;
	                document.getElementById('<%=msktxt_mmBeginTime.ClientID %>').disabled=false;
	                document.getElementById('<%=msktxt_hhEndTime.ClientID %>').disabled=false;
	                document.getElementById('<%=msktxt_mmEndTime.ClientID %>').disabled=false;
	            }
	            else
	            {
	                document.getElementById('<%=msktxt_hhBeginTime.ClientID %>').disabled=true;
	                document.getElementById('<%=msktxt_mmBeginTime.ClientID %>').disabled=true;
	                document.getElementById('<%=msktxt_hhEndTime.ClientID %>').disabled=true;
	                document.getElementById('<%=msktxt_mmEndTime.ClientID %>').disabled=true;
	            }
	        }
    </script>
</body>
</html>
