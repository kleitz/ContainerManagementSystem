<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ShipmentManagementSystem.Views.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ###############################################<br />
            Welcome to <br />
                        Maersk Line CMS<br />
            ###############################################<br />
            <br />
            Login:<br />
            <asp:TextBox ID="LoginBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Password:<br />
            <asp:TextBox ID="PasswordBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" Text="Login" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="RegisterButton" runat="server" OnClick="RegisterButton_Click" Text="Register" />
        </div>
    </form>
</body>
</html>
