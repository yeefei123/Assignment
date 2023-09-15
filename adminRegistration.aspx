<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminRegistration.aspx.cs" Inherits="Assignment.adminRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>CutiePie Coding Learning System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #game-container {
            width: 100%;
            height: 100%;
            background-color: #f7f7f7;
            position: absolute;
            overflow: hidden;
            background: lightblue url("jungle.jpg") no-repeat fixed center;
            background-size: cover;
        }

        #words {
            color: #000000;
            font-size: 1.6rem;
            font-family: 'Nova Flat';
            text-align: center;
            position: relative;
            top: 100px;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        input[type=text], input[type=password], input[type=email], input[type=number] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

            button:hover {
                opacity: 0.8;
            }

        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }

        .imgcontainer {
            margin-top:50px;
            font-size: 1.6rem;
            text-align: center;
            margin: 24px 0 12px 0;
            position: relative;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }
        .auto-style1 {
            left: 5%;
            top: 125px;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="game-container">
            <div id="words" class="auto-style1">
                <b>Welcome to CutiePie Coding Learning System</b>
            </div>
            <div class="imgcontainer">
                <b>
                <asp:Label ID="userType" runat="server" ForeColor="Red">Admin</asp:Label>
                &nbsp;<asp:Label ID="Label7" runat="server" ForeColor="Red">Registration Page</asp:Label>
                </b>
            </div>
            <div class="container">
                <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

                <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>

                <asp:Label ID="Label4" runat="server" Text="Gender:"></asp:Label>
                <asp:RadioButton ID="rbMale" runat="server" Text="Male" GroupName="gender" required="required" />
                <asp:RadioButton ID="rbFemale" runat="server" Text="Female" GroupName="gender" required="required" />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Age:"></asp:Label>
                <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                <asp:Label ID="Label6" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                <asp:Label ID="error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="RegisterButton_Click" />
            </div>
            <asp:Button ID="login" runat="server" Text="Login" OnClick="OnMove" />
        </div>

    </form>
</body>
</html>
