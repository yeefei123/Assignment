<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Assignment.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Admin - Level Management</title>
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
            position: relative;
            top: 300px; /* Center vertically */
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
                <h1>T-REX Game</h1>
                <b>Admin Management System</b>
            </div>
            <div id="buttons-container">
                <button class="level-button" type="button" onclick="showAdminModal()">View</button>
                <button class="level-button" type="button" onclick="showAdd()">Add</button>
                <button class="level-button" type="button" onclick="showMemberModal()">Modify</button>
                <button class="level-button" type="button" onclick="showMemberModal()">Delete</button>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [stageTable] WHERE [stageId] = @original_stageId AND (([stageNum] = @original_stageNum) OR ([stageNum] IS NULL AND @original_stageNum IS NULL)) AND (([codeName] = @original_codeName) OR ([codeName] IS NULL AND @original_codeName IS NULL)) AND (([vidID] = @original_vidID) OR ([vidID] IS NULL AND @original_vidID IS NULL)) AND (([noteID] = @original_noteID) OR ([noteID] IS NULL AND @original_noteID IS NULL)) AND (([exerciseID] = @original_exerciseID) OR ([exerciseID] IS NULL AND @original_exerciseID IS NULL)) AND (([assessmentID] = @original_assessmentID) OR ([assessmentID] IS NULL AND @original_assessmentID IS NULL)) AND (([progressID] = @original_progressID) OR ([progressID] IS NULL AND @original_progressID IS NULL))" InsertCommand="INSERT INTO [stageTable] ([stageNum], [codeName], [vidID], [noteID], [exerciseID], [assessmentID], [progressID]) VALUES (@stageNum, @codeName, @vidID, @noteID, @exerciseID, @assessmentID, @progressID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [stageTable]" UpdateCommand="UPDATE [stageTable] SET [stageNum] = @stageNum, [codeName] = @codeName, [vidID] = @vidID, [noteID] = @noteID, [exerciseID] = @exerciseID, [assessmentID] = @assessmentID, [progressID] = @progressID WHERE [stageId] = @original_stageId AND (([stageNum] = @original_stageNum) OR ([stageNum] IS NULL AND @original_stageNum IS NULL)) AND (([codeName] = @original_codeName) OR ([codeName] IS NULL AND @original_codeName IS NULL)) AND (([vidID] = @original_vidID) OR ([vidID] IS NULL AND @original_vidID IS NULL)) AND (([noteID] = @original_noteID) OR ([noteID] IS NULL AND @original_noteID IS NULL)) AND (([exerciseID] = @original_exerciseID) OR ([exerciseID] IS NULL AND @original_exerciseID IS NULL)) AND (([assessmentID] = @original_assessmentID) OR ([assessmentID] IS NULL AND @original_assessmentID IS NULL)) AND (([progressID] = @original_progressID) OR ([progressID] IS NULL AND @original_progressID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_stageId" Type="Int32" />
                    <asp:Parameter Name="original_stageNum" Type="Int32" />
                    <asp:Parameter Name="original_codeName" Type="String" />
                    <asp:Parameter Name="original_vidID" Type="Int32" />
                    <asp:Parameter Name="original_noteID" Type="Int32" />
                    <asp:Parameter Name="original_exerciseID" Type="Int32" />
                    <asp:Parameter Name="original_assessmentID" Type="Int32" />
                    <asp:Parameter Name="original_progressID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="stageNum" Type="Int32" />
                    <asp:Parameter Name="codeName" Type="String" />
                    <asp:Parameter Name="vidID" Type="Int32" />
                    <asp:Parameter Name="noteID" Type="Int32" />
                    <asp:Parameter Name="exerciseID" Type="Int32" />
                    <asp:Parameter Name="assessmentID" Type="Int32" />
                    <asp:Parameter Name="progressID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="stageNum" Type="Int32" />
                    <asp:Parameter Name="codeName" Type="String" />
                    <asp:Parameter Name="vidID" Type="Int32" />
                    <asp:Parameter Name="noteID" Type="Int32" />
                    <asp:Parameter Name="exerciseID" Type="Int32" />
                    <asp:Parameter Name="assessmentID" Type="Int32" />
                    <asp:Parameter Name="progressID" Type="Int32" />
                    <asp:Parameter Name="original_stageId" Type="Int32" />
                    <asp:Parameter Name="original_stageNum" Type="Int32" />
                    <asp:Parameter Name="original_codeName" Type="String" />
                    <asp:Parameter Name="original_vidID" Type="Int32" />
                    <asp:Parameter Name="original_noteID" Type="Int32" />
                    <asp:Parameter Name="original_exerciseID" Type="Int32" />
                    <asp:Parameter Name="original_assessmentID" Type="Int32" />
                    <asp:Parameter Name="original_progressID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div id="id01" class="modal" style="background-color: #f1f1f1; display: none;">
            <div class="imgcontainer">
                <span onclick="closeModal('id01')" class="close" title="Close Modal">&times;</span>
                <div id="level-info">
                    <div id="level-display"></div>
                </div>
            </div>

            <div class="container">
                <input type="hidden" id="levelId" runat="server" />
                <label for="codename"><b>CodeName</b></label>
                <asp:TextBox ID="codename" runat="server"></asp:TextBox>

                <label for="video"><b>Video URL</b></label>
                <asp:TextBox ID="url" runat="server"></asp:TextBox>

                <label for="note"><b>Note</b></label>
                <asp:TextBox ID="note" runat="server"></asp:TextBox>

                <label for="assessment"><b>Assessment</b></label>
                <asp:TextBox ID="assessment" runat="server"></asp:TextBox>

                <asp:Label ID="error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button type="button" ID="SubmitButton" runat="server" Text="Add" OnClick="SubmitButton_Click" />

            </div>

            <div class="container">
                <button type="button" onclick="closeModal('id01')" class="cancelbtn">Cancel</button>
                <span class="psw"><a href="#">Forgot password?</a></span>
                <br />
            </div>
        </div>
    </form>
    <script>
        var addModal = document.getElementById('id01');

        function showAdd() {
            addModal.style.display = "block";
        }

        function closeModal(modalId) {
            var modal = document.getElementById(modalId);
            modal.style.display = "none";
        }

    </script>
</body>

</html>
