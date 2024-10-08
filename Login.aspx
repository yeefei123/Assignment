﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment.Login" %>

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

        #buttons-container {
            margin-top: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 300px;
            text-align: center;
            gap: 15px; /* Increased the gap between buttons */
            position: absolute;
            top: 200px; /* Center vertically */
            left: 50%;
            transform: translate(-50%, -50%); /* Center horizontally and vertically */
        }

        .level-button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
            width: 300px;
            border: none;
            border-radius: 5px;
            margin: 5px 0;
            transition: background-color 0.3s;
            margin-top: 30px;
        }

            .level-button:hover {
                background-color: #555;
            }

        #words {
            color: #000000;
            font-size: 1.6rem;
            font-family: 'Nova Flat';
            text-align: center;
            position: absolute;
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

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 50%;
            width: 300px;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            border: 1px solid #888;
            width: 80%;
            max-height: 500px;
            overflow-y: auto;
            padding: 20px;
        }


        .close {
            position: absolute;
            right: 25px;
            top: 0;
            color: #000;
            font-size: 35px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }

        .animate {
            -webkit-animation: animatezoom 0.6s;
            animation: animatezoom 0.6s;
        }

        @-webkit-keyframes animatezoom {
            from {
                -webkit-transform: scale(0);
            }

            to {
                -webkit-transform: scale(1);
            }
        }

        @keyframes animatezoom {
            from {
                transform: scale(0);
            }

            to {
                transform: scale(1);
            }
        }

        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cancelbtn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="game-container">
            <div id="words">
                <h1>Login</h1>
                <b>Welcome to CutiePie Coding Learning System</b>
            </div>
            <div id="buttons-container">
                <button class="level-button" type="button" onclick="showAdminModal()">Admin</button>
                <button class="level-button" type="button" onclick="showMemberModal()">Member</button>
            </div>

            <asp:Label ID="showName" runat="server" Text="showName"></asp:Label>

            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [userTable] WHERE [userID] = @original_userID AND (([userName] = @original_userName) OR ([userName] IS NULL AND @original_userName IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL)) AND (([gender] = @original_gender) OR ([gender] IS NULL AND @original_gender IS NULL)) AND (([age] = @original_age) OR ([age] IS NULL AND @original_age IS NULL)) AND (([userType] = @original_userType) OR ([userType] IS NULL AND @original_userType IS NULL)) AND (([progressID] = @original_progressID) OR ([progressID] IS NULL AND @original_progressID IS NULL))" InsertCommand="INSERT INTO [userTable] ([userName], [email], [password], [gender], [age], [userType], [progressID]) VALUES (@userName, @email, @password, @gender, @age, @userType, @progressID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [userTable]" UpdateCommand="UPDATE [userTable] SET [userName] = @userName, [email] = @email, [password] = @password, [gender] = @gender, [age] = @age, [userType] = @userType, [progressID] = @progressID WHERE [userID] = @original_userID AND (([userName] = @original_userName) OR ([userName] IS NULL AND @original_userName IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL)) AND (([gender] = @original_gender) OR ([gender] IS NULL AND @original_gender IS NULL)) AND (([age] = @original_age) OR ([age] IS NULL AND @original_age IS NULL)) AND (([userType] = @original_userType) OR ([userType] IS NULL AND @original_userType IS NULL)) AND (([progressID] = @original_progressID) OR ([progressID] IS NULL AND @original_progressID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_userID" Type="Int32" />
                    <asp:Parameter Name="original_userName" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                    <asp:Parameter Name="original_gender" Type="String" />
                    <asp:Parameter Name="original_age" Type="Int32" />
                    <asp:Parameter Name="original_userType" Type="String" />
                    <asp:Parameter Name="original_progressID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="age" Type="Int32" />
                    <asp:Parameter Name="userType" Type="String" />
                    <asp:Parameter Name="progressID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="age" Type="Int32" />
                    <asp:Parameter Name="userType" Type="String" />
                    <asp:Parameter Name="progressID" Type="Int32" />
                    <asp:Parameter Name="original_userID" Type="Int32" />
                    <asp:Parameter Name="original_userName" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                    <asp:Parameter Name="original_gender" Type="String" />
                    <asp:Parameter Name="original_age" Type="Int32" />
                    <asp:Parameter Name="original_userType" Type="String" />
                    <asp:Parameter Name="original_progressID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>

        <div id="id01" class="modal" style="background-color: #f1f1f1; display: none;">
            <div class="imgcontainer">
                <span onclick="closeModal('id01')" class="close" title="Close Modal">&times;</span>
            </div>

            <div class="container">
                <label for="adminname"><b>AdminID</b></label>
                <asp:TextBox ID="aname" runat="server"></asp:TextBox>

                <label for="psw"><b>Password</b></label>
                <asp:TextBox ID="apsw" runat="server"></asp:TextBox>

                <asp:Label ID="errMsg" runat="server" Visible="false" ForeColor="Red"></asp:Label>

                <asp:Button type="button" ID="adminlogin" runat="server" Text="Login" OnClick="AdminButton_Click" />

                <label>
                    <input type="checkbox" checked="checked" name="remember" />
                    Remember me
                </label>
            </div>

            <div class="container">
                <button type="button" onclick="closeModal('id01')" class="cancelbtn">Cancel</button>
                <span class="psw"><a href="#">Forgot password?</a></span>
                <br />
                <span class="psw"><a href="#" onclick="window.location.href='adminRegistration.aspx'";>Not a member?</a></span>
            </div>
        </div>

        <div id="id02" class="modal" style="background-color: #f1f1f1; display: none;">
            <div class="imgcontainer">
                <span onclick="closeModal('id02')" class="close" title="Close Modal">&times;</span>
            </div>
            <div class="container">
                <label for="uname"><b>Username</b></label>
                <asp:TextBox ID="uname" runat="server"></asp:TextBox>

                <label for="upsw"><b>Password</b></label>
                <asp:TextBox ID="upsw" runat="server"></asp:TextBox>

                <asp:Label ID="error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button type="button" ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
            </div>

            <div class="container">
                <button type="button" onclick="closeModal('id02')" class="cancelbtn">Cancel</button>
                <span class="psw"><a href="#">Forgotpassword?</a></span>
                <br />
                <span class="psw"><a href="#" onclick="document.getElementById('id02').style.display='none'; document.getElementById('id03').style.display='block'">Not a member?</a></span>
            </div>
        </div>

        <div id="id03" class="modal" style="background-color: #f1f1f1;">
            <div class="imgcontainer">
                <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
                <asp:Label ID="userType" runat="server" ForeColor="Red">Member</asp:Label>
                <asp:Label ID="Label7" runat="server" ForeColor="Red">Registration Page</asp:Label>
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
                <br />
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="RegisterButton_Click" />
            </div>


            <div class="container">
                <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">Cancel</button>
            </div>
        </div>

    </form>
    <script>
        var modal1 = document.getElementById('id01');
        var modal2 = document.getElementById('id02');
        var modal3 = document.getElementById('id03');

        window.onclick = function (event) {
            if (event.target == modal1) {
                modal1.style.display = "none";
            } else if (event.target == modal2) {
                modal2.style.display = "none";
            } else if (event.target == modal3) {
                modal3.style.display = "none";
            }
        }

        function showAdminModal() {
            var modal = document.getElementById('id01');
            modal.style.display = "block";
        }

        function showMemberModal() {
            var modal = document.getElementById('id02');
            modal.style.display = "block";
        }

        function closeModal(modalId) {
            var modal = document.getElementById(modalId);
            modal.style.display = "none";
        }


    </script>

</body>
</html>

