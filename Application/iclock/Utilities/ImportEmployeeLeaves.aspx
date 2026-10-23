<%@ page language="VB" autoeventwireup="false" inherits="Utilities_ImportEmployeeLeaves, App_Web_vcxdl3a3" enableeventvalidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body background="../Images/bck1.gif" style="background-repeat: no-repeat; background-position-x: right;
    background-position-y: top;">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <owd:Window ID="wnd_AddUpdate" runat="server" Height="190" StyleFolder="~/Styles/mainwindow/blue"
            Title="Select the File" Width="425" IsResizable="true" ShowStatusBar="false"
            Left="350" Top="155">
            <table width="100%" cellpadding="1" class="Table" style="border-top-style: none;
                border-right-style: none; border-left-style: none; border-bottom-style: solid;">
                <tr>
                    <td>
                        <fieldset style="width: 395px; height: 90px;">
                            <legend>Select the File</legend>
                            <table>
                                <tr>
                                    <td colspan="2">
                                        Example File Format&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lnk_FileFormat" runat="server"
                                            CssClass="WebControls">FileFormat</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;Import From&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="fleup_Employee" runat="server" Width="290px" CssClass="WebControls" />
                                    </td>
                                </tr>
                                
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input id="btnDisplayError" runat="server" type="button" style="font-size: 12px;
                            color: Red; display: none; border: 0px; background-color: #EEEEEE; text-decoration: underline;"
                            value="Display Error" />
                        <asp:Button ID="btn_OK" runat="server" Text="Import" OnClientClick="return CheckFileExistence()"
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

         
       
        <obout:Flyout runat="server" ID="Flyout1" AttachTo="btnDisplayError" Position="BOTTOM_CENTER"
            Align="TOP" zIndex="100000">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <asp:TextBox runat="server" ReadOnly="true" BorderStyle="None" Wrap="true" Width="400px"
                            CssClass="WebControls" BackColor="#EEEEEE" Height="150px" TextMode="MultiLine"
                            BorderWidth="0" ID="lbl_DisplayError"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input id="Button2" type="button" value="Close" class="WebControls" onclick="<%=Flyout1.getClientID()%>.Close();" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
       
    </div>
    </form>
    <script type="text/javascript">

    function closeWindow()
		     {
		         try
		         {
		        alert(1);


		        wnd_AddUpdate.Close();
		         }
		         catch(ex)
		         {
		            alert(ex.message);
		         }
		    }
		    
		     function attachFlyoutToLink(oLink)
		        {	
		             <%=Flyout1.getClientID()%>.AttachTo(oLink.id);		            		            
	                 <%=Flyout1.getClientID()%>.Open();
	               return false;
		        }
		    
		     function closeFlyout() 
		        {
		            <%=Flyout1.getClientID()%>.Close();
		        }
		    
		     function CheckFileExistence()
		    {
		        var filePath=document.getElementById("<%=fleup_Employee.ClientID %>").value;
		        if(filePath.length<1) 
                    {
                    document.getElementById("<%=lbl_Error.ClientId %>").innerHTML='Error:-File Name Can not be empty'
                                      
                    return false; 
                    }
                    
                        var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase(); 
                       
                            if(ext=='csv' || ext=='xls' || ext='xlsx' )
                                {
                                    return true; 
                                }
                               else 
                                {
                                    document.getElementById("<%=lbl_Error.ClientId %>").innerHTML='Error:-The file extension ' + ext.toUpperCase() + ' is not allowed!'
                                    return false; 
                                }
                       
                   
                    

		    }
		    
		    
    </script>
</body>
</html>
