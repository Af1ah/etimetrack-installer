<%@ control language="VB" autoeventwireup="false" inherits="Manage_EmployeePhotoMenu, App_Web_kgq5n2bg" %>
<style type="text/css">
a:link {
  color: #2E4053; 
  background-color: transparent; 
  text-decoration: none;
  font-size:14px;
}

a:visited {
  color: #2E4053;
  background-color: transparent;
  text-decoration: none;
}

a:hover {
  color: red;
  background-color: transparent;
  text-decoration: underline;
}

a:active {
  color: #F4F6F6;
  background-color: transparent;
  text-decoration: underline;
}
</style>
<div id="header" align="center">
    <table width="100%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="left">
            
             <a href="UpdateEmployeeProfilePhoto.aspx?EmployeeCode=<%= Request.QueryString("EmployeeCode")%>&EmployeeName=<%= Request.QueryString("EmployeeName")%>&EmployeeId=<%= Request.QueryString("EmployeeId")%>">Profile Photo</a> |
             <a href="ViewEnrolledUserPic.aspx?EmployeeCode=<%= Request.QueryString("EmployeeCode")%>&EmployeeName=<%= Request.QueryString("EmployeeName")%>&EmployeeId=<%= Request.QueryString("EmployeeId")%>">Device Enrolled User Pic</a>
            
            </td>
        </tr>
    </table>
</div>



