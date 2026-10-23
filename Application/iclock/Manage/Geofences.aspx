<%@ page language="VB" autoeventwireup="false" inherits="Manage_Geofences, App_Web_kgq5n2bg" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    // Client-Side Events for Delete
    function OnBeforeDelete(record) {
        record.Error = '';
        var Name = record.GeofenceName;

        document.getElementById("<%=Hdn_GeofenceId.ClientID %>").value = record.GeofenceId;
        document.getElementById("<%=Hdn_GeofenceName.ClientID %>").value = record.GeofenceName;
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
    <script type="text/javascript">

        function isNumberKey(evt, id) {
            try {

                var charCode = (evt.which) ? evt.which : event.keyCode;
                var txt = document.getElementById(id).value;

                if (charCode == 46) {

                    if (!(txt.indexOf(".") > -1)) {
                        return true;

                    }
                }
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {

                    return false;
                }


                return true;
            } catch (w) {
                alert(w);
            }
        }


        function validateRange(id) {
            var txt = document.getElementById(id).value;
            if (id.includes("Latitude")) {
                if (txt < -90 || txt > 90) {
                    document.getElementById(id).value = 0;
                    alert("Latitude must be between -90 and 90 degrees inclusive.");
                    return false;
                }

            }
            else if (id.includes("Longitude")) {
                if (txt < -180 || txt > 180) {
                    document.getElementById(id).value = 0;
                    alert("Longitude must be between -180 and 180 degrees inclusive.");
                    return false;
                }
            }

            return true;
        }

        function OpenLocationPopUpWindow(Latitude, Longitude) {

            var wide = '800';
            var high = '500';

            //this gets the total available width and height of the users screen
            screen_height = window.screen.availHeight;
            screen_width = window.screen.availWidth;

            //this gets the left and top point by saying total width of the screen divided by 2 (center), minus the width of your window divided by 2, which make its center point the middle of the screen. Same for the top
            left_point = parseInt(screen_width / 2) - (wide / 2);
            top_point = parseInt(screen_height / 2) - (high / 2);

            //just doing a simple popup window here, but plugging your info into it, and setting the top and left corners to be our calculated points that will center your window.
            win = window.open('ViewMobileLocationInMaps.aspx?Longitude=' + Longitude + '&Latitude=' + Latitude + '', 'myPopup', 'width=' + wide + ',height=' + high + ',left=' + left_point + ',top=' + top_point + ',toolbar=no,location=no,scrollbars=no,status=no,resizable=no,fullscreen=no');     //make sure your window is in the front 
            win.focus();
        }

    </script>
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
                    Geofences List
                </td>
            </tr>
            <tr style="background-color: lightsteelblue;">
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <obout:Grid ID="Dg_Geofences" runat="server" AllowFiltering="true" CallbackMode="true"
                        EnableRecordHover="true" KeepSelectedRecords="true" Serialize="true" AutoGenerateColumns="false"
                        FolderStyle="~/styles/grid/styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
                        OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord">
                        <ClientSideEvents OnClientInsert="OnInsert" OnBeforeClientDelete="OnBeforeDelete"
                            OnClientDelete="OnDelete" />
                        <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                        <Columns>
                            <obout:Column DataField="GeofenceId" Visible="false" ReadOnly="true" HeaderText="GeofenceId " />
                            <obout:Column ID="Column1" DataField="GeofenceName" SortOrder="Asc" Visible="true"
                                Width="450" HeaderText="Geofence Name" runat="server" />
                            <obout:Column ID="Column4" DataField="Description" Width="250" HeaderText="Description"
                                runat="server" />
                            <obout:Column ID="Column2" DataField="Locations" Visible="false" Width="250" HeaderText="Locations"
                                runat="server" />
                            <obout:Column HeaderText="Edit" Width="100" AllowEdit="true" AllowDelete="true">
                                <TemplateSettings TemplateId="tplEditBtn" />
                            </obout:Column>
                            <obout:Column HeaderText="Delete" Width="100" AllowEdit="false" AllowDelete="true"
                                Visible="true" />
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
        <obout:Flyout runat="server" ID="Flyout_Geofence" Position="BOTTOM_CENTER"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
            <table class="rowEditTable">
                <tr>
                    <td>
                        <fieldset>
                            <legend>Geofence Details</legend>
                            <table>
                                <tr>
                                    <td style="font-weight: bold;">
                                        Geofence Name
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_GeofenceName" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Description
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txt_Description" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Location1
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Lattitude:<asp:TextBox runat="server" ID="txt_Location1Latitude" onchange="return validateRange(this.id);"
                                            autocomplete="off" onkeypress="return isNumberKey(event,this.id);" Text="0" Width="100px"></asp:TextBox>
                                        Longitude:<asp:TextBox runat="server" ID="txt_Location1Longitude" onchange="return validateRange(this.id);"
                                            autocomplete="off" onkeypress="return isNumberKey(event,this.id);" Text="0" Width="100px"></asp:TextBox>
                                        <a href="Javascript:void(0);" onclick="OpenLocationPopUpWindow(document.getElementById('<%=txt_Location1Latitude.ClientID %>').value,document.getElementById('<%=txt_Location1Longitude.ClientID %>').value)">
                                            View</a> Radius:<asp:TextBox runat="server" ID="txt_Location1Radius" autocomplete="off"
                                                onkeypress="return isNumberKey(event,this.id);" Text="0" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Location2
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Lattitude:<asp:TextBox runat="server" ID="txt_Location2Latitude" onchange="return validateRange(this.id);"
                                            autocomplete="off" onkeypress="return isNumberKey(event,this.id);" Text="0" Width="100px"></asp:TextBox>
                                        Longitude:<asp:TextBox runat="server" ID="txt_Location2Longitude" onchange="return validateRange(this.id);"
                                            autocomplete="off" onkeypress="return isNumberKey(event,this.id);" Text="0" Width="100px"></asp:TextBox>
                                        <a href="Javascript:void(0);" onclick="OpenLocationPopUpWindow(document.getElementById('<%=txt_Location2Latitude.ClientID %>').value,document.getElementById('<%=txt_Location2Longitude.ClientID %>').value)">
                                            View</a> Radius:<asp:TextBox runat="server" ID="txt_Location2Radius" autocomplete="off"
                                                onkeypress="return isNumberKey(event,this.id);" Text="0" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Location3
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Lattitude:<asp:TextBox runat="server" autocomplete="off" onchange="return validateRange(this.id);"
                                            onkeypress="return isNumberKey(event,this.id);" ID="txt_Location3Latitude" Text="0"
                                            Width="100px"></asp:TextBox>
                                        Longitude:<asp:TextBox runat="server" autocomplete="off" onchange="return validateRange(this.id);"
                                            onkeypress="return isNumberKey(event,this.id);" ID="txt_Location3Longitude" Text="0"
                                            Width="100px"></asp:TextBox>
                                        <a href="Javascript:void(0);" onclick="OpenLocationPopUpWindow(document.getElementById('<%=txt_Location3Latitude.ClientID %>').value,document.getElementById('<%=txt_Location3Longitude.ClientID %>').value)">
                                            View</a> Radius:<asp:TextBox runat="server" autocomplete="off" onkeypress="return isNumberKey(event,this.id);"
                                                ID="txt_Location3Radius" Text="0" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Location4
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Lattitude:<asp:TextBox runat="server" autocomplete="off" onchange="return validateRange(this.id);"
                                            onkeypress="return isNumberKey(event,this.id);" ID="txt_Location4Latitude" Text="0"
                                            Width="100px"></asp:TextBox>
                                        Longitude:<asp:TextBox runat="server" autocomplete="off" onchange="return validateRange(this.id);"
                                            onkeypress="return isNumberKey(event,this.id);" ID="txt_Location4Longitude" Text="0"
                                            Width="100px"></asp:TextBox>
                                        <a href="Javascript:void(0);" onclick="OpenLocationPopUpWindow(document.getElementById('<%=txt_Location4Latitude.ClientID %>').value,document.getElementById('<%=txt_Location4Longitude.ClientID %>').value)">
                                            View</a> Radius:<asp:TextBox runat="server" autocomplete="off" onkeypress="return isNumberKey(event,this.id);"
                                                ID="txt_Location4Radius" Text="0" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Location5
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        Lattitude:<asp:TextBox runat="server" ID="txt_Location5Latitude" onchange="return validateRange(this.id);"
                                            autocomplete="off" onkeypress="return isNumberKey(event,this.id);" Text="0" Width="100px"></asp:TextBox>
                                        Longitude:<asp:TextBox runat="server" ID="txt_Location5Longitude" onchange="return validateRange(this.id);"
                                            autocomplete="off" onkeypress="return isNumberKey(event,this.id);" Text="0" Width="100px"></asp:TextBox>
                                        <a href="Javascript:void(0);" onclick="OpenLocationPopUpWindow(document.getElementById('<%=txt_Location5Latitude.ClientID %>').value,document.getElementById('<%=txt_Location5Longitude.ClientID %>').value)">
                                            View</a> Radius:<asp:TextBox runat="server" ID="txt_Location5Radius" autocomplete="off"
                                                onkeypress="return isNumberKey(event,this.id);" Text="0" Width="100px"></asp:TextBox>
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
                        <asp:HiddenField ID="Hdn_GeofenceId" runat="server" />
                        <asp:HiddenField ID="Hdn_GeofenceName" runat="server" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
    </div>
    </form>
    <script runat="server">
        Function CheckPermissions(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddGeofences") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
        Function CheckPermissionsEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditGeofences") Then
                    Return Action
                End If
                Return ""
            End If
        End Function
        
    </script>
    <script type="text/javascript">
		   
		    function attachFlyoutToLink(oLink,Action)
		     {	
		       <%=Flyout_Geofence.getClientID()%>.AttachTo(oLink.id);		            		            
		        <%=Flyout_Geofence.getClientID()%>.Open();
		        clearFlyout();
		        if(Action=='Update')
		        {
		            populateEditControls(oLink.id.toString().replace("grid_link_", ""));
		        }
              }
		    
		    
		function closeFlyout() 
		    {
		        <%=Flyout_Geofence.getClientID()%>.Close();
		    }
		    

	  function populateEditControls(iRecordIndex) 
		   {	
		        document.getElementById("<%=txt_GeofenceName.ClientID%>").value = Dg_Geofences.Rows[iRecordIndex].Cells[1].Value;
		        document.getElementById("<%=txt_Description.ClientID%>").value=Dg_Geofences.Rows[iRecordIndex].Cells[2].Value.replace(/<BR>/gi,'\n');
                document.getElementById("<%=Hdn_GeofenceId.ClientID %>").value = Dg_Geofences.Rows[iRecordIndex].Cells[0].Value;  

                var Locations=Dg_Geofences.Rows[iRecordIndex].Cells[3].Value;
                var split_Locations = Locations.split(':');
            
                for(var i = 0; i < split_Locations.length; i++) {
                    
                    split_Locations[i] = split_Locations[i].replace(/^\s*/, "").replace(/\s*$/, ""); 
                    var split_LocationsValues = split_Locations[i].split(',');

                    switch(i+1) {

                         case 1:
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location1Latitude").ClientID %>').value=split_LocationsValues[0];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location1Longitude").ClientID %>').value=split_LocationsValues[1];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location1Radius").ClientID %>').value=split_LocationsValues[2];
                         break;

                         case 2:
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location2Latitude").ClientID %>').value=split_LocationsValues[0];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location2Longitude").ClientID %>').value=split_LocationsValues[1];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location2Radius").ClientID %>').value=split_LocationsValues[2];
                         break;

                         case 3:
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location3Latitude").ClientID %>').value=split_LocationsValues[0];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location3Longitude").ClientID %>').value=split_LocationsValues[1];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location3Radius").ClientID %>').value=split_LocationsValues[2];
                         break;

                         case 4:
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location4Latitude").ClientID %>').value=split_LocationsValues[0];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location4Longitude").ClientID %>').value=split_LocationsValues[1];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location4Radius").ClientID %>').value=split_LocationsValues[2];
                         break;

                         case 5:
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location5Latitude").ClientID %>').value=split_LocationsValues[0];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location5Longitude").ClientID %>').value=split_LocationsValues[1];
                         document.getElementById('<%= Flyout_Geofence.FindControl("txt_Location5Radius").ClientID %>').value=split_LocationsValues[2];
                         break;
  
                    }                    
                    

                 }

		   }

		   
       function btn_Save_onclick()
         {
            var oRecord = new Object();
            oRecord.GeofenceId =document.getElementById("<%=Hdn_GeofenceId.ClientID %>").value;
            oRecord.Error='';
            Dg_Geofences.executeInsert(oRecord);
         }
		    
        function clearFlyout() 
        {
            document.getElementById("<%=txt_GeofenceName.ClientID %>").value = '';
	        document.getElementById("<%=txt_GeofenceName.ClientID%>").disabled=false;
	        document.getElementById("<%=txt_Description.ClientID %>").value =  '';
	        document.getElementById("<%=Hdn_GeofenceId.ClientID %>").value = '0';
            document.getElementById("<%=Lbl_InvalidError.ClientID %>").innerHTML ='';

            document.getElementById("<%=txt_Location1Latitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location1Longitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location1Radius.ClientID %>").value = '0';

            document.getElementById("<%=txt_Location2Latitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location2Longitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location2Radius.ClientID %>").value = '0';

            document.getElementById("<%=txt_Location3Latitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location3Longitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location3Radius.ClientID %>").value = '0';

            document.getElementById("<%=txt_Location4Latitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location4Longitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location4Radius.ClientID %>").value = '0';

            document.getElementById("<%=txt_Location5Latitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location5Longitude.ClientID %>").value = '0';
            document.getElementById("<%=txt_Location5Radius.ClientID %>").value = '0';
	    }



      
    </script>
</body>
</html>
