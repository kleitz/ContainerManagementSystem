<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="ShipmentManagementSystem.Views.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ----------------------------------------------------------------<br />
            *******************************************<br />
                         Registration<br />
            *******************************************<br />
            *******************************************<br />
            <br />
            Username:<br />
            <asp:TextBox ID="UsernameBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Password:<br />
            <asp:TextBox ID="PasswordBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="SignUpButton" runat="server" OnClick="SignUpButton_Click" Text="Sign Up" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Back" />
            <br />
        </div>
    </form>
</body>
</html>
