<%@ page language="VB" autoeventwireup="false" inherits="Utilities_ImportLeave, App_Web_vcxdl3a3" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Import Employee Leave Balance</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
<body background="../Images/bck1.gif" style="background-repeat:no-repeat;background-position-x:right;background-position-y:top;">
    <form id="form1" runat="server">
    <div >
<uctrl:header ID="MyHeader" runat="server" />
    
        <owd:Window ID="wnd_LeaveBalance" runat="server" Height="160" StyleFolder="~/Styles/mainwindow/blue"
            Title="Import Leave Balance" Width="425" IsResizable="true"
            ShowStatusBar="false" Left="350" Top="155">
            
        
            
            
            <table width="100%" height="100%" cellpadding="1" cellspacing="0" class="Table" style="border-top-style: none; border-right-style: none; border-left-style: none; border-bottom-style: solid;">
            
                <tr>
                <td>
                <fieldset><legend>Select the File</legend>
                <table>
                <tr>
                
            <td colspan="2">Example File Format&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lnk_FileFormat" runat="server" CssClass="WebControls" >FileFormat</asp:LinkButton>
            </td>
            </tr>
            <tr> </tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            
            
             <tr>
                <td align="right">Year
                </td>
                <td>
                    <asp:DropDownList ID="drp_Year" runat="server">
                    </asp:DropDownList>
                </td>
                    
                </tr>
            
                <tr>
                <td align="right">Import From
                </td>
                <td><asp:FileUpload ID="fleup_Employee" runat="server" Width="290px"   CssClass="WebControls"  /></td>
                    
                </tr>
                </table>
                </fieldset>
                </td>
                </tr>
                <tr>
                <td align="right">
                <asp:Button ID="btn_OK" runat="server" Text="Import" OnClientClick="return CheckFileExistence()"   CssClass="WebControls" />&nbsp;&nbsp;
                    <input id="btn_Cancel" type="button" value="Close" OnClick="closeWindow();"  class="WebControls" /></td>
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
		        
		        wnd_LeaveBalance.Close();
		         }
		         catch(ex)
		         {
		            alert(ex.message);
		         }
		    }
		    
		     
		     function CheckFileExistence()
		    {
		        var filePath=document.getElementById("<%=fleup_Employee.ClientID %>").value;
		        if(filePath.length<1) 
                    {
                    alert('Error:-File Name Can not be empty');
                    return false; 
                    }
                    
                var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase(); 
               
                    if(ext=='csv' || ext=='xls' )
                        {
                            return true; 
                        }
                       else 
                        {
                            alert('Error:-The file extension ' + ext.toUpperCase() + ' is not allowed!');
                            return false; 
                        }

		    }
		    
		    
    </script>
    
     
		    
</body>
</html>