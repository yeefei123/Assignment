<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_ViewAllUser.aspx.cs" Inherits="Assignment.ViewAllUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View all User</title>
</head>
<body>
    <h1>View All User</h1>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="userGridView" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                    <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="backBtn" runat="server" OnClick="backBtn_Click" Text="Back" />
        </div>
    </form>
</body>
</html>
