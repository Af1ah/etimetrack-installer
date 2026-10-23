<%@ page language="VB" autoeventwireup="false" inherits="Manage_ShiftGroups, App_Web_kgq5n2bg" enableeventvalidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Combobox" Assembly="obout_Combobox_Net" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Register TagPrefix="fup" Namespace="OboutInc.FileUpload" Assembly="obout_FileUpload" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<script type="text/javascript">	
	function onRecordSelect(arrSelectedRecords) 
           {
		         for(var i=0; i<Dg_ShiftGroup.SelectedRecords.length;i++) 
		         {
	                var record = Dg_ShiftGroup.SelectedRecords[i];
	                document.getElementById("<%=Hdn_ShiftGroupId.ClientID %>").value = record.ShiftGroupId;
		         }
	        }
	        
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uctrl:header ID="MyHeader" runat="server" />
                    <asp:HiddenField ID="Hdn_ShiftGroupId" runat="server" />
            <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
                border-left: gray 1px solid; border-bottom: gray 1px solid;">
                <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                    color: white;">
                    <td colspan="2" style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                        padding: 5px; color: white;">
                        Shift Group
                    </td>
                </tr>
                <tr style="background-color: lightsteelblue;">
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="div_Employees">
                        <obout:Grid id="Dg_ShiftGroup" runat="server"  CallbackMode="true" Serialize="true" AutoGenerateColumns="false" AllowFiltering="true"  EmbedFilterInSortExpression="true" FolderStyle="~/styles/grid/styles/premiere_blue" AllowMultiRecordSelection="false" AllowKeyNavigation="true" 	 AllowAddingRecords="true"	 PageSize="15" >
                            <ClientSideEvents  OnClientSelect="onRecordSelect"  />
                            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
                                <Columns>
                                    <obout:Column ID="Column0" Align="left" DataField="ShiftGroupId" Visible="false"
                                        Width="300" HeaderText="ShiftId" runat="server" />
                                    <obout:Column ID="Column2" DataField="ShiftGroupFName" Visible="true" Width="300"
                                        HeaderText="Shift Group F Name" runat="server" />
                                    <obout:Column ID="Column1" DataField="ShiftGroupSName" Visible="true" Width="300"
                                        HeaderText="Shift Group S Name" runat="server" />
                                    <obout:Column ID="Column8"  AllowFilter="False"  Width="100" Index="6"  ShowHeader="False" ><TemplateSettings  TemplateId="tplCommand"/>
                                    </obout:Column>
                                </Columns>
                                <Templates>
                                    <obout:GridTemplate runat="server" ID="tplCommand" ControlID="" ControlPropertyName=""  >
			                       <Template>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="ob_gAL" OnClick="lnkEdit_Click" OnClientClick="lnkEdit_Click"><%#CheckPermissionEdit("Edit")%> </asp:LinkButton>&nbsp;|&nbsp;<asp:LinkButton ID="lnkDelte" runat="server" CssClass="ob_gAL" OnClick="lnkDelete_Click" OnClientClick="return confirm('Are you sure you want to delete? ');"><%#CheckPermissionDelete("Delete")%> </asp:LinkButton>
			                    </Template>
			                        </obout:GridTemplate>
			                          <obout:GridTemplate runat="server" ID="tplAddBtn">
                                    <Template>
                                    <asp:LinkButton ID="lnkAdd" runat="server" CssClass="ob_gAL" OnClick="lnkAdd_Click" OnClientClick="lnkAdd_Click"><%#CheckPermissionAdd("Add")%>  </asp:LinkButton>
                                    </Template>
                                </obout:GridTemplate>
                                </Templates>
                            </obout:Grid>
                        </div>
                    </td>
                </tr>
            </table>
            
            
            <owd:Window ID="wnd_ShiftGroupDeatils" runat="server" VisibleOnLoad="true"  
                     Left="350" Top="155" Height="250"  Width="580"
                    StyleFolder="~/Styles/mainwindow/blue"  Title="Shift Group Details" IsModal="True" ShowStatusBar="False" ShowCloseButton="true" >               
                <table width="100%" height="100%" cellpadding="1" cellspacing="0" class="rowEditTable" style="border-top-style: none;
                    border-right-style: none; border-left-style: none; border-bottom-style: none;">
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Shift Group Details</legend>
                                <table width="100%" height="100%" >
                                    <tr>
                                        <td style="font-weight: bold;" align="right">
                                            Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_ShiftGroupName" runat="server" Width="195px"></asp:TextBox>
                                        </td>
                                        <td style="font-weight: bold;">
                                            Short Name</td>
                                        <td>
                                            <asp:TextBox ID="txt_Shortname" runat="server" Width="195px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Shift Access
                                        </td>
                                        <td>
                                            <asp:ListBox ID="lst_AvailableShift" runat="server" CssClass="WebControls" BorderStyle="Solid"
                                                BorderWidth="1px" SelectionMode="Multiple" Width="200px" Height="131px"></asp:ListBox>
                                        </td>
                                        <td>
                                            <table cellpadding="1">
                                                <tr>
                                                    <td align="center">
                                                        <input type="button" id="btn_next" runat="server" value=">" style="font-size: 11px;
                                                            font-family: Verdana; height: 20px; width: 50px" onclick="btn_next_onclick();" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <input type="button" id="btn_NextAll" runat="server" value=">>" style="font-size: 11px;
                                                            font-family: Verdana; height: 20px; width: 50px" onclick="NextAll();" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <input type="button" id="btn_Previous" runat="server" value="<" style="font-size: 11px;
                                                            font-family: Verdana; height: 20px; width: 50px" onclick="btn_previous_onclick();" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <input type="button" id="btn_PreviousAll" runat="server" value="<<" style="font-size: 11px;
                                                            font-family: Verdana; height: 20px; width: 50px" onclick="PreviousAll();" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <asp:ListBox ID="lst_AllowedShift" runat="server" CssClass="WebControls" BorderStyle="Solid"
                                                BorderWidth="1px" SelectionMode="Multiple" Width="200px" Height="131px"></asp:ListBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btn_OK" runat="server" Text="Save" OnClientClick="GetSelectedItem();"
                                CssClass="WebControls" />&nbsp;&nbsp;
                            <input id="Button1" type="button" value="Close" onclick="wnd_ShiftGroupDeatils.Close();"
                                class="WebControls" /></td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    
                    
                    <asp:HiddenField ID="Hdn_ExportName" runat="server" />
                    <asp:HiddenField ID="Hdn_SourceExportName" runat="server" />
                    <asp:HiddenField ID="Hdn_ExportValueName" runat="server" />
                    <asp:HiddenField ID="Hdn_SourceExportValueName" runat="server" />
                </table>
            </owd:Window>
        </div>
    </form>

    <script runat="server">
        Function CheckPermissionAdd(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
            
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("AddShifts") Then
                    Return Action
                End If
                Return ""
            End If
            Return ""
        End Function
        
        Function CheckPermissionEdit(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("EditShifts") Then
                    Return Action
                End If
                Return ""
            End If
            Return ""
        End Function
        
        Function CheckPermissionDelete(ByVal Action As String) As String
            If Not Session.Item("LoginUser") Is Nothing Then
                If CType(Session("LoginUser"), eTimeTrackLiteLibrary.Data.Admin.User).PermissionNameList.Contains("DeleteShifts") Then
                    Return Action
                End If
                Return ""
            End If
            Return ""
        End Function
        
    </script>

    <script type="text/javascript">

// ONLY NEXT BUTTON ON CLICK 

        function btn_next_onclick()
        
        {
        
        var ListViewObject=document.getElementById("<%=lst_AvailableShift.ClientID %>");
        var ListExportObject=document.getElementById("<%=lst_AllowedShift.ClientID %>");
        var i=0
        for(var j=0;j<ListViewObject.options.length;j++)
            {
            if (ListViewObject.options[j].selected)
            {
            var Options=document.createElement("OPTION");
                    ListExportObject.add(new Option(ListViewObject.options[j].text,ListViewObject.options[j].value));
                    i=i+1
              }
            }
            removeOptionSelected(ListViewObject)
            }
            
            
  // NEXT ALL BUTTON ONCLICK      
      
            function NextAll()
            {
          
                var ListViewObject=document.getElementById("<%=lst_AvailableShift.ClientID %>");
                var ListExportObject=document.getElementById("<%=lst_AllowedShift.ClientID %>");
                
                 for(var j=0;j<ListViewObject.options.length;j++)
                 {
                       
                     ListExportObject.add(new Option(ListViewObject.options[j].text,ListViewObject.options[j].value));
                 }
                removeAllOption(ListViewObject);
                
               
            }
            
            function GetSelectedItem()
            {
                document.getElementById("<%=Hdn_ExportName.ClientID %>").value='';
                document.getElementById("<%=Hdn_ExportValueName.ClientID %>").value='';
                document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value='';
                document.getElementById("<%=Hdn_SourceExportValueName.ClientID %>").value='';
                
                var ListExportObject=document.getElementById("<%=lst_AllowedShift.ClientID %>");
                var ListViewObject=document.getElementById("<%=lst_AvailableShift.ClientID %>");
                
                
                
                for(var j=0;j<ListExportObject.options.length;j++)
                 {
                       document.getElementById("<%=Hdn_ExportName.ClientID %>").value=document.getElementById("<%=Hdn_ExportName.ClientID %>").value+ListExportObject.options[j].text+',';
                       document.getElementById("<%=Hdn_ExportValueName.ClientID %>").value=document.getElementById("<%=Hdn_ExportValueName.ClientID %>").value+ListExportObject.options[j].value+',';
                 }
                 
                  for(var k=0;k<ListViewObject.options.length;k++)
                 {
                       document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value=document.getElementById("<%=Hdn_SourceExportName.ClientID %>").value+ListViewObject.options[k].text+',';
                       document.getElementById("<%=Hdn_SourceExportValueName.ClientID %>").value=document.getElementById("<%=Hdn_SourceExportValueName.ClientID %>").value+ListViewObject.options[k].value+',';
                 }
                 
            }
            
           
            
            
   // REMOVE SELECTED OPTIONS         
            
            function removeOptionSelected(object)
                {
                  var k;
                  for (k = object.length - 1; k>=0; k--) {
                    if (object.options[k].selected) {
                      object.remove(k);
                    }
                  }
                }
                
     //REMOVE ALL OPTIONS           
                function removeAllOption(object)
                {
                  var k;
                  for (k = object.length - 1; k>=0; k--) {
                      object.remove(k);
                  }
                }



// PREVIOUS BUTTON ON CLICK


 function btn_previous_onclick()
        
        {
        
        var ListViewObject=document.getElementById("<%=lst_AvailableShift.ClientID %>");
        var ListExportObject=document.getElementById("<%=lst_AllowedShift.ClientID %>");
        var i=0
        for(var j=0;j<ListExportObject.options.length;j++)
            {
            if (ListExportObject.options[j].selected)
            {
                ListViewObject.add(new Option(ListExportObject.options[j].text,ListExportObject.options[j].value));
            i=i+1
              }
            }
            removeOptionSelected(ListExportObject)
           
            }
            
            
            
            // PREVIOUS ALL BUTTON ONCLICK      
      
            function PreviousAll()
            {            
                var ListViewObject=document.getElementById("<%=lst_AvailableShift.ClientID %>");
                var ListExportObject=document.getElementById("<%=lst_AllowedShift.ClientID %>");
                
                 for(var j=0;j<ListExportObject.options.length;j++)
                 {
                     ListViewObject.add(new Option(ListExportObject.options[j].text,ListExportObject.options[j].value));
                 }
                removeAllOption(ListExportObject);
            }
            
    </script>

</body>
</html>
