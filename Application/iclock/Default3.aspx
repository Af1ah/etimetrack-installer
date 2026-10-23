<%@ page language="VB" autoeventwireup="false" inherits="Default3, App_Web_wdniqpox" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
          <asp:ScriptManager ID="ScriptManager2" runat="server">
                        </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanelProcess" runat="server">
                <ContentTemplate>
                    <asp:Button runat="server" Text="Process" ID="btnProcess" OnClientClick="Process();"
                        OnClick="btnProcess_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Button runat="server" Text="DummyButton" ID="btnDummy" Style="display: none;"
                        OnClick="btnDummy_Click" />
                    <asp:Label ID="lblCounterStatus" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <script type="text/javascript">


            function Process() {
                var btn = document.getElementById('<%=btnDummy.ClientID%>');
                btn.click();
                setTimeout(Process, 100);

            }
        </script>
    </div>
    </form>
</body>
</html>
