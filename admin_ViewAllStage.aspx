<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_ViewAllStage.aspx.cs" Inherits="Assignment.admin_ViewAllStage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View all Stage</title>
</head>
<body>
    <h1>View all Stage</h1>
        <form id="form1" runat="server">
        <div>
                <asp:GridView ID="userGridView" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="stageId" HeaderText="stageId" SortExpression="StageId" />
        <asp:BoundField DataField="codeName" HeaderText="codeName" SortExpression="codeName" />
        <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
        <asp:BoundField DataField="note" HeaderText="note" SortExpression="note" />
    </Columns>
</asp:GridView>
                <br />
                <asp:Button ID="backBtn" runat="server" OnClick="backBtn_Click" Text="Back" />
        </div>
    </form>
</body>
</html>
