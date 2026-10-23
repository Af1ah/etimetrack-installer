<%@ page language="VB" autoeventwireup="false" inherits="Utilities_ExportEmployeesLeaveSummary, App_Web_vcxdl3a3" enableeventvalidation="false" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
   <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="wnd_AddUpdate" runat="server" Height="102" StyleFolder="~/Styles/mainwindow/blue"
            Title="Export Leave Summary" Width="180" IsResizable="true" ShowStatusBar="false"
            Left="450" Top="150">
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: solid;">
                <tr>
                    <td>
                        <fieldset style="width: 150px; height: 35px;">
                            <legend>Select Year</legend>
                            <table>
                                <tr>
                                    <td colspan="2">
                                       <asp:DropDownList ID="drp_Year" runat="server">
                    </asp:DropDownList>
                                    </td>
                                </tr>
                                                            
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btn_OK" runat="server" Text="Export" OnClientClick="return CheckFileExistence()"
                            CssClass="WebControls" />&nbsp;&nbsp;
                        <input id="btn_Cancel" type="button" value="Close" onclick="return closeWindow();"
                            class="WebControls" />
                    </td>
                </tr>
            </table>
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: none;">
                <tr>
                    <td width="100%">
                        <asp:Label ID="lbl_Error" runat="server" EnableViewState="False" ForeColor="Red"
                            Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                            CssClass="WebControls"></asp:Label>
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
		       

		        wnd_AddUpdate.Close();
		         }
		         catch(ex)
		         {
		            alert(ex.message);
		         }
		    }
		    
		 
		   
    </script>



</body>
</html>
