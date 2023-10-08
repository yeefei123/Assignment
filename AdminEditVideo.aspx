<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminEditVideo.aspx.cs" Inherits="Assignment.AdminEditVideo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table class="auto-style1">
                <tr>
                    <td>&nbsp;<asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="titlebox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
                    </td>
                    <td>
                        <textarea id="descriptionbox" cols="20" name="S1" rows="2" runat="server"></textarea></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="URL"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="URLBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Stage ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="stageidbox" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [stageId] FROM [videoTable]"></asp:SqlDataSource>
        <asp:Label ID="Label5" runat="server" Text="42"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="stageId" DataValueField="stageId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
    </form>
</body>
</html>
