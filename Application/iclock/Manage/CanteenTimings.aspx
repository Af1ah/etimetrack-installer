<%@ page language="VB" autoeventwireup="false" inherits="Manage_CanteenTimings, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        record.Error = '';
        var Name = record.CanteenTimingName;

        document.getElementById("<%=Hdn_CanteenTimingId.ClientID %>").value = record.CanteenTimingId;
        document.getElementById("<%=Hdn_CanteenTimingName.ClientID %>").value = record.CanteenTimingName;
        if (confirm("Are you sure you want to delete? "))
            return true;
        else
            return false;
    }

    function OnDelete(record) {
        alert(record.Error);
    }

    function OnInsert(record) {
        document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML = record.Error;
    }
	
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid;">
            <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                <td style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    padding: 5px; color: white;">
                    Canteen Timing List
                </td>
            </tr>
            <tr style="background-color: lightsteelblue;">
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <obout:Grid ID="Dg_CanteenTimings" runat="server" AllowFiltering="true" CallbackMode="true"
                        EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                        FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                        <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                            OnClientDelete="OnDelete" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column DataField="CanteenTimingId" Visible="false" ReadOnly="true" HeaderText="CanteenTimingId "
                                Index="0" />
                            <obout:Column ID="Column1" DataField="CanteenTimingName" SortOrder="Asc" Visible="true"
                                Width="450" HeaderText="Name" runat="server" Index="1" />
                            <obout:Column ID="Column2" DataField="CanteenTimingCode" Visible="false" Width="430"
                                HeaderText="Code" runat="server" Index="2" />
                            <obout:Column ID="Column3" DataField="BeginTime" Visible="true" Width="200" HeaderText="Begin Time"
                                runat="server" Index="3" />
                            <obout:Column ID="Column5" DataField="EndTime" Visible="true" Width="200" HeaderText="End Time"
                                runat="server" Index="4" />
                            <obout:Column ID="Column6" DataField="DefaultItem" Visible="false" Width="200" HeaderText="DefaultItem"
                                runat="server" Index="5" />
                            <obout:Column HeaderText="Edit" Width="65" AllowEdit="true" AllowDelete="true" Index="6">
                                <TemplateSettings TemplateId="tplEditBtn" />
                            </obout:Column>
                            <obout:Column HeaderText="Delete" Width="70" AllowEdit="false" AllowDelete="true"
                                Visible="true" Index="7" />
                        </Columns>
                        <Templates>
                            <obout:GridTemplate runat="server" ID="tplEditBtn">
                                <Template>
                                    <a href="javascript: //" id="grid_link_<%# Container.PageRecordIndex %>" onclick="attachFlyoutToLink(this,'Update')"
                                        class="ob_gAL">
                                        <%#CheckPermissionsEdit("Edit")%></a>
                                </Template>
                            </obout:GridTemplate>
                            <obout:GridTemplate runat="server" ID="tplAddBtn">
                                <Template>
                                    <a href="javascript: //" id="btAdd" onclick="attachFlyoutToLink(this,'Add');" class="ob_gAL">
                                        <%#CheckPermissions("Add")%></a>
                                </Template>
                            </obout:GridTemplate>
                        </Templates>
                    </obout:Grid>
                </td>
            </tr>
        </table>
        <obout:Flyout runat="server" ID="Flyout_CanteenTimings" Align="left" Position="BOTTOM_left"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Canteen Timing Details</legend>
                            <table>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_TimingFullName" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Short Name
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="txt_TimingShortName" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Begin Time
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" CssClass="WebControls" ID="drp_HHBeginTime"
                                            Width="40">
                                        </asp:DropDownList>
                                        &nbsp;:&nbsp;<asp:DropDownList runat="server" ID="drp_mmBeginTime" Width="50">
                                        </asp:DropDownList>
                                        &nbsp;HH:MM 24 hr fmt
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       End Time
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" CssClass="WebControls" ID="drp_HHEndTime"
                                            Width="40">
                                        </asp:DropDownList>
                                        &nbsp;:&nbsp;<asp:DropDownList runat="server" ID="drp_mmEndTime" Width="50">
                                        </asp:DropDownList>
                                        &nbsp;HH:MM 24 hr fmt
                                    </td>
                                </tr>
                                <tr>
                                  <td>
                                       Default Item
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drp_CanteenItem" Width="96px" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Label runat="server" ForeColor="red" EnableViewState="false" ID="Lbl_InvalidError"></asp:Label><input
                            id="btn_Add" type="button" value="Save" onclick="javascript:btn_Save_onclick();" />&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="btn_Cancel" type="button" value="Close" onclick="javascript:closeFlyout();" />
                        <asp:HiddenField ID="Hdn_CanteenTimingId" runat="server" />
                        <asp:HiddenField ID="Hdn_CanteenTimingName" runat="server" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
    </div>
    </form>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                Return Action
                'If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddDepartments") Then
                '    Return Action
                'End If
                'Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                Return Action
                'If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditDepartments") Then
                '    Return Action
                'End If
                'Return ""
            End If
        End Function
        
    </script>
    <script type="text/javascript">
		   
		    function attachFlyoutToLink(oLink,Action)
		     {	
		       <%=Flyout_CanteenTimings.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_CanteenTimings.getClientID()%>.Open();
		        clearFlyout();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout_CanteenTimings.getClientID()%>.Close();
		    }
		    

	  function populateEditControls(iRecordIndex) 
		   {	
		        document.getElementById("<%=txt_TimingFullName.ClientID%>").value = Dg_CanteenTimings.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=txt_TimingShortName.ClientID%>").value = Dg_CanteenTimings.Rows[iRecordIndex].Cells[2].Value;

                document.getElementById("<%=drp_CanteenItem.ClientID %>").value = Dg_CanteenTimings.Rows[iRecordIndex].Cells[5].Value;

                document.getElementById("<%=Hdn_CanteenTimingId.ClientID %>").value = Dg_CanteenTimings.Rows[iRecordIndex].Cells[0].Value;  

                SetValueInDropDown(document.getElementById("<%=drp_HHBeginTime.ClientID%>"),document.getElementById("<%=drp_mmBeginTime.ClientID%>"),Dg_CanteenTimings.Rows[iRecordIndex].Cells[3].Value);
		        SetValueInDropDown(document.getElementById("<%=drp_HHEndTime.ClientID%>"),document.getElementById("<%=drp_mmEndTime.ClientID%>"),Dg_CanteenTimings.Rows[iRecordIndex].Cells[4].Value);

               
		   }

            function SetValueInDropDown(HHobject,mmobject,Value)
		    {
		        var Hours=Value.split(':')[0];
		        var Minutes=Value.split(':')[1];
		        
		        HHobject.value=Hours;
		        mmobject.value=Minutes;
		    }
		    	  
		   
       function btn_Save_onclick()
         {
            var oRecord = new Object();
            oRecord.CanteenTimingId =document.getElementById("<%=Hdn_CanteenTimingId.ClientID %>").value;
            oRecord.Error='';
            Dg_CanteenTimings.executeInsert(oRecord);
         }
		    
        function clearFlyout() 
        {

        
		            

            document.getElementById("<%=txt_TimingFullName.ClientID %>").value = '';
	        document.getElementById("<%=txt_TimingShortName.ClientID %>").value = '';   
            
            document.getElementById("<%=Hdn_CanteenTimingId.ClientID %>").value = '0';
            document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';

            document.getElementById("<%=drp_CanteenItem.ClientID %>").selectedIndex = 0;

             var CurrentTime=new Date();
              var minutes=CurrentTime.getMinutes();
		      var hours=CurrentTime.getHours();
		        
		        if(minutes<10)
		            minutes='0'+minutes
		        
		         if(hours<10)
		            hours='0'+hours
                               

            document.getElementById("<%=drp_HHBeginTime.ClientID %>").value = hours;
		    document.getElementById("<%=drp_mmBeginTime.ClientID %>").value =  minutes
		        
		    document.getElementById("<%=drp_HHEndTime.ClientID %>").value =  hours;
		    document.getElementById("<%=drp_mmEndTime.ClientID %>").value =  minutes
             
	       
	    }
	    
    </script>
</body>
</html>
