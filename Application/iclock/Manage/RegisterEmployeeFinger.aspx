<%@ page language="VB" autoeventwireup="false" inherits="Manage_RegisterEmployeeFinger, App_Web_usmjemmz" enableEventValidation="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="uctrl" Src="~/Header.ascx" TagName="header" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
   
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../cssFPSensor/box.css" type="text/css" />
    <script type="text/javascript" src="../jsFpSensor/main.js"></script>
    <script type="text/javascript" src="../jsFpSensor/fingerprint.js"></script>
    <script type="text/javascript" src="../jsFpSensor/jquery.js"></script>
    <script type="text/javascript" src="../jsFpSensor/baseMoth.js"></script>
    <script type="text/javascript" src="../jsFpSensor/dhtmlxCommon.js"></script>
</head>
<body onload="myfunction()">
    <form id="form1" runat="server">
    <div>
        <uctrl:header ID="MyHeader" runat="server" />
        <table cellpadding="0" cellspacing="0" style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; border-bottom: gray 1px solid; width: 400px;">
            <tr style="font-weight: bold; font-size: 14px; background-color: lightsteelblue;
                padding-left: 5px; padding-top: 3px; padding-bottom: 3px; color: white;">
                <td style="font-weight: bold;" colspan="2">
                    Register Employee Finger&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label
                        runat="server" ID="lbl_EmpName" Style="font-family: Verdana; font-size: 13px;
                        color: #0c416f; font-weight: normal;"></asp:Label>
                </td>
            </tr>
            <tr style="padding-right: 5px; padding-left: 1px; padding-bottom: 1px; padding-top: 1px;
                background-color: lightsteelblue; height: 100px;">
                <td colspan="2">
                    <hr />
                    <br />
                    <div id="fpRegisterDiv" style="display: inline; height: do">
                        <a id="fpRegister" onclick='submitRegister("fingerprint", "Number of fingerprints:", "Are you sure you want to save the current changes?", "Driver Download", false)'
                            title="Please install a fingerprint driver or start the service" class="showGray"
                            onmouseover="this.className='showGray'">Registration</a>
                    </div>
                    <div id="driverDownload" style="display: inline; margin: 0 0 0 5px;">
                        <a id='downloadDriver' href='../ZKBioOnline.exe' title='Driver Download'>Driver Download</a>
                    </div>
                    <br />
                    <br />
                    <br />
                    <input type="hidden" id="fingerTemplate10" runat="server" />
                    <input type="hidden" id="fingerId" runat="server" />

                    <input type="hidden" id="fingerTemplate10DB" runat="server" />
                    <input type="hidden" id="fingerIdDB" runat="server" />

                    <asp:Button ID="btn_Save" runat="server" Text="Save To DB" />&nbsp; &nbsp;<asp:Label
                        ID="lblResult" runat="server" Text=""></asp:Label>
                    <div id="bg" style="display: none;">
                    </div>
                    <div id="box" class="box" style="display: none;">
                        <h2>
                            Fingerprint registration</h2>
                        <div class="list">
                            <canvas id="canvas" width="430" height="450" style="background: rgb(243, 245, 240)"></canvas>
                            <input type="hidden" id="whetherModify" name="whetherModify" alt="" value="111" />
                            <div style="position: absolute; left: 310px; top: 325px; width: 130px; height: 28px;">
                                <button type="button" id="submitButtonId" name="makeSureName" onclick="submitEvent()"
                                    class="button-form">
                                    Capture Changes</button>
                            </div>
                            <div style="position: absolute; left: 310px; top: 365px; width: 70px; height: 28px;">
                                <button class="button-form" type="button" id="closeButton" name="closeButton" onclick='cancelEvent("Are you sure to save the current changes?", "Number of fingerprints:");'>
                                    Cancel</button>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="background-color: lightsteelblue; padding-bottom: 5px;">
                    <hr />
                    &nbsp;&nbsp;<a 
                        style="font-family: Verdana; font-size: 13px; color: #0c416f; text-decoration: underline;" 
                        href="Employees.aspx" >«
                        Go to Employees</a>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <script runat="server">
       
    </script>
    <script type="text/javascript">
           
    </script>
</body>
</html>
