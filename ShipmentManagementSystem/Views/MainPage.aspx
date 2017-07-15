<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="ShipmentManagementSystem.Views.MainPage" %>

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
            Welcome to <br />
                        Container Management System<br />
            *******************************************<br />
            *******************************************<br />
            <br />
            Shipment ID&nbsp;&nbsp;&nbsp; :
            <asp:TextBox ID="ShipmentIDBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Import Date&nbsp;&nbsp;&nbsp; :
            <asp:TextBox ID="ImDateBox" runat="server"></asp:TextBox>
            <br />
            Import Time&nbsp;&nbsp;&nbsp; :
            <asp:TextBox ID="ImTimeBox" runat="server"></asp:TextBox>
            <br />
            Import Location&nbsp; :
            <asp:TextBox ID="ImLocationBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Export Date&nbsp;&nbsp;&nbsp; :
            <asp:TextBox ID="ExDateBox" runat="server"></asp:TextBox>
            <br />
            Export Time&nbsp;&nbsp;&nbsp; :
            <asp:TextBox ID="ExTimeBox" runat="server"></asp:TextBox>
            <br />
            Export Location&nbsp; :
            <asp:TextBox ID="ExLocationBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="InsertButton" runat="server" OnClick="InsertButton_Click" Text="Add New Shipment" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="LogOutButton" runat="server" OnClick="LogOutButton_Click" Text="Log out" />
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ShipmentID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="ShipmentID" HeaderText="ShipmentID" ReadOnly="True" SortExpression="ShipmentID" />
                    <asp:BoundField DataField="ImportDate" HeaderText="ImportDate" SortExpression="ImportDate" />
                    <asp:BoundField DataField="ImportTime" HeaderText="ImportTime" SortExpression="ImportTime" />
                    <asp:BoundField DataField="ImportLocation" HeaderText="ImportLocation" SortExpression="ImportLocation" />
                    <asp:BoundField DataField="ExportDate" HeaderText="ExportDate" SortExpression="ExportDate" />
                    <asp:BoundField DataField="ExportTime" HeaderText="ExportTime" SortExpression="ExportTime" />
                    <asp:BoundField DataField="ExportLocation" HeaderText="ExportLocation" SortExpression="ExportLocation" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShipmentDBConnectionString1 %>" DeleteCommand="DELETE FROM [ShipmentInfo] WHERE [ShipmentID] = @ShipmentID" InsertCommand="INSERT INTO [ShipmentInfo] ([ShipmentID], [ImportDate], [ImportTime], [ImportLocation], [ExportDate], [ExportTime], [ExportLocation]) VALUES (@ShipmentID, @ImportDate, @ImportTime, @ImportLocation, @ExportDate, @ExportTime, @ExportLocation)" SelectCommand="SELECT * FROM [ShipmentInfo]" UpdateCommand="UPDATE [ShipmentInfo] SET [ImportDate] = @ImportDate, [ImportTime] = @ImportTime, [ImportLocation] = @ImportLocation, [ExportDate] = @ExportDate, [ExportTime] = @ExportTime, [ExportLocation] = @ExportLocation WHERE [ShipmentID] = @ShipmentID">
                <DeleteParameters>
                    <asp:Parameter Name="ShipmentID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ShipmentID" Type="String" />
                    <asp:Parameter Name="ImportDate" Type="String" />
                    <asp:Parameter Name="ImportTime" Type="String" />
                    <asp:Parameter Name="ImportLocation" Type="String" />
                    <asp:Parameter Name="ExportDate" Type="String" />
                    <asp:Parameter Name="ExportTime" Type="String" />
                    <asp:Parameter Name="ExportLocation" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ImportDate" Type="String" />
                    <asp:Parameter Name="ImportTime" Type="String" />
                    <asp:Parameter Name="ImportLocation" Type="String" />
                    <asp:Parameter Name="ExportDate" Type="String" />
                    <asp:Parameter Name="ExportTime" Type="String" />
                    <asp:Parameter Name="ExportLocation" Type="String" />
                    <asp:Parameter Name="ShipmentID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
