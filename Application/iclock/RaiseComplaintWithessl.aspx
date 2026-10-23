<%@ page language="VB" autoeventwireup="false" inherits="RaiseComplaintWithessl, App_Web_wdniqpox" enableEventValidation="false" %>

<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register assembly="obout_Flyout2_NET" namespace="OboutInc.Flyout2" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   

    <script type="text/javascript">
       
    </script>
    <style type="text/css">
        .style1
        {
            
            
        }
        .style2
        {
           
        }
                
        
        
    </style>
        
</head>
<body>
    <form id="form1" runat="server">
  
        <div style="border: 2px solid black; height:560px; width:700px;">
            <table cellspacing="2" class="style1">
            <tr>
            <td colspan="4" 
                    style="background-color: #2B63C0; color: #FFFFFF; font-weight: bold;">
            Raise Complaint With eSSL
            </td>
            </tr>
                <tr>
                    <td style="font-weight: bold; text-align: right;">
                        Your&nbsp;Company&nbsp;Name:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txt_CustomerName" runat="server" Width="239px"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" Text=" City:" Font-Bold="True"></asp:Label>
                         <asp:TextBox ID="txt_City" runat="server" Width="160px"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
                    <td style="font-weight: bold; text-align: right;" class="style2">
                        Address:
                    </td>
                    <td colspan="3" class="style2">
                        <asp:TextBox ID="txt_Address" TextMode="MultiLine" runat="server" Height="80px" 
                            Width="453px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold; text-align: right;">
                        Contact&nbsp;Person&nbsp;Name:
                    </td>
                    <td colspan="3">
                       
                        <asp:TextBox ID="txt_PersonName" runat="server" Width="453px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold; text-align: right;">
                        Contact&nbsp;Person&nbsp;Number:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txt_PersonNumber" runat="server" Width="453px" height="22px"></asp:TextBox>
                        &nbsp;
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold; text-align: right;">
                        Contact&nbsp;Person&nbsp;eMail:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txt_PersoneMail" runat="server" Width="453px" height="22px"></asp:TextBox>
                        &nbsp;
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold; text-align: right;">
                        Complaint&nbsp;Description:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txt_Description" TextMode="MultiLine" runat="server" Height="156px"
                            Width="453px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: bold">
                    </td>
                    <td style="font-weight: bold" colspan="3">
                        <asp:Button ID="btn_Submit" OnClientClick="this.disabled = true; this.value = 'Processing..';" UseSubmitBehavior="false"   runat="server" Text="Submit" Width="89px" />
                       
                        &nbsp;
                        &nbsp;
                      <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" OnClientClick="javascript:closeWindow();" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        &nbsp;
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                <td colspan="4"  style="border-top: thin solid #000000">
                Disclaimer: Above mentioned page details and software related data will be sent to eSSL Support team. This information will be used for ensuring that we provide our best services and product features. And we use your information to make improvements to our Products. We do not share this information with companies, organizations, or individuals outside of eSSL.
                </td>
                </tr>
            </table>
        </div>
   
    
    </form>

    <script type="text/javascript">
        function closeWindow() {
            try {
                window.parent.location.href = 'Main.aspx';

//                ComplaintDialog.Close();
            }
            catch (ex) {
                alert(ex.message);
            }

        }
    </script>
</body>
</html>
