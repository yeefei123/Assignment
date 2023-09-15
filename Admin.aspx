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

        #SubmitButton {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

            #SubmitButton:hover {
                opacity: 0.8;
            }

        #Button1 {
            background-color: #fefefe;
            color: white;
            padding: 8px 10px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            color: black;
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

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

                /* Change the link color to #111 (black) on hover */
                li a:hover {
                    background-color: #111;
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
                <button class="level-button" type="button" onclick="">View</button>
                <button class="level-button" type="button" onclick="showAdd()">Add</button>
                <button class="level-button" type="button" onclick="">Modify</button>
                <button class="level-button" type="button" onclick="showDelete()">Delete</button>


            </div>

            <div id="id03" class="modal" style="background-color: #f1f1f1; display: none; width: 400px; height: 500px;">
                <div class="imgcontainer">
                    <h1>Delete Details</h1>
                    <span onclick="closeModal('id03')" class="close" title="Close Modal">&times;</span>
                </div>
                <ul>
                    <li><a href="#" onclick="showDetailsView('stageDetailsView1')">Stage</a></li>
                    <li><a href="#" onclick="showDetailsView('stageDetailsView2')">Assessment</a></li>
                    <li><a href="#">Execise</a></li>
                </ul>
                <div id="stageDetailsView1" class="details-view" style="display: none;">
                    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="stageId" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
                        <Fields>
                            <asp:BoundField DataField="stageId" HeaderText="stageId" ReadOnly="True" SortExpression="stageId" />
                            <asp:BoundField DataField="codeName" HeaderText="codeName" SortExpression="codeName" />
                            <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                            <asp:BoundField DataField="note" HeaderText="note" SortExpression="note" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Fields>
                    </asp:DetailsView>
                </div>
                <div id="stageDetailsView2" class="details-view" style="display: none;">

                    <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="assessmentId" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
                        <Fields>
                            <asp:BoundField DataField="assessmentId" HeaderText="assessmentId" ReadOnly="True" SortExpression="assessmentId" />
                            <asp:BoundField DataField="assessmentName" HeaderText="assessmentName" SortExpression="assessmentName" />
                            <asp:BoundField DataField="questionName" HeaderText="questionName" SortExpression="questionName" />
                            <asp:BoundField DataField="option1" HeaderText="option1" SortExpression="option1" />
                            <asp:BoundField DataField="option2" HeaderText="option2" SortExpression="option2" />
                            <asp:BoundField DataField="option3" HeaderText="option3" SortExpression="option3" />
                            <asp:BoundField DataField="option4" HeaderText="option4" SortExpression="option4" />
                            <asp:BoundField DataField="stageId" HeaderText="stageId" SortExpression="stageId" />
                            <asp:CommandField ShowDeleteButton="True" />

                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [assessmentTable] WHERE [assessmentId] = @original_assessmentId AND (([assessmentName] = @original_assessmentName) OR ([assessmentName] IS NULL AND @original_assessmentName IS NULL)) AND (([questionName] = @original_questionName) OR ([questionName] IS NULL AND @original_questionName IS NULL)) AND (([option1] = @original_option1) OR ([option1] IS NULL AND @original_option1 IS NULL)) AND (([option2] = @original_option2) OR ([option2] IS NULL AND @original_option2 IS NULL)) AND (([option3] = @original_option3) OR ([option3] IS NULL AND @original_option3 IS NULL)) AND (([option4] = @original_option4) OR ([option4] IS NULL AND @original_option4 IS NULL)) AND (([stageId] = @original_stageId) OR ([stageId] IS NULL AND @original_stageId IS NULL))" InsertCommand="INSERT INTO [assessmentTable] ([assessmentId], [assessmentName], [questionName], [option1], [option2], [option3], [option4], [stageId]) VALUES (@assessmentId, @assessmentName, @questionName, @option1, @option2, @option3, @option4, @stageId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [assessmentTable]" UpdateCommand="UPDATE [assessmentTable] SET [assessmentName] = @assessmentName, [questionName] = @questionName, [option1] = @option1, [option2] = @option2, [option3] = @option3, [option4] = @option4, [stageId] = @stageId WHERE [assessmentId] = @original_assessmentId AND (([assessmentName] = @original_assessmentName) OR ([assessmentName] IS NULL AND @original_assessmentName IS NULL)) AND (([questionName] = @original_questionName) OR ([questionName] IS NULL AND @original_questionName IS NULL)) AND (([option1] = @original_option1) OR ([option1] IS NULL AND @original_option1 IS NULL)) AND (([option2] = @original_option2) OR ([option2] IS NULL AND @original_option2 IS NULL)) AND (([option3] = @original_option3) OR ([option3] IS NULL AND @original_option3 IS NULL)) AND (([option4] = @original_option4) OR ([option4] IS NULL AND @original_option4 IS NULL)) AND (([stageId] = @original_stageId) OR ([stageId] IS NULL AND @original_stageId IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_assessmentId" Type="Int32" />
                    <asp:Parameter Name="original_assessmentName" Type="String" />
                    <asp:Parameter Name="original_questionName" Type="String" />
                    <asp:Parameter Name="original_option1" Type="String" />
                    <asp:Parameter Name="original_option2" Type="String" />
                    <asp:Parameter Name="original_option3" Type="String" />
                    <asp:Parameter Name="original_option4" Type="String" />
                    <asp:Parameter Name="original_stageId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="assessmentId" Type="Int32" />
                    <asp:Parameter Name="assessmentName" Type="String" />
                    <asp:Parameter Name="questionName" Type="String" />
                    <asp:Parameter Name="option1" Type="String" />
                    <asp:Parameter Name="option2" Type="String" />
                    <asp:Parameter Name="option3" Type="String" />
                    <asp:Parameter Name="option4" Type="String" />
                    <asp:Parameter Name="stageId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="assessmentName" Type="String" />
                    <asp:Parameter Name="questionName" Type="String" />
                    <asp:Parameter Name="option1" Type="String" />
                    <asp:Parameter Name="option2" Type="String" />
                    <asp:Parameter Name="option3" Type="String" />
                    <asp:Parameter Name="option4" Type="String" />
                    <asp:Parameter Name="stageId" Type="Int32" />
                    <asp:Parameter Name="original_assessmentId" Type="Int32" />
                    <asp:Parameter Name="original_assessmentName" Type="String" />
                    <asp:Parameter Name="original_questionName" Type="String" />
                    <asp:Parameter Name="original_option1" Type="String" />
                    <asp:Parameter Name="original_option2" Type="String" />
                    <asp:Parameter Name="original_option3" Type="String" />
                    <asp:Parameter Name="original_option4" Type="String" />
                    <asp:Parameter Name="original_stageId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>







            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [stageTable] WHERE [stageId] = @original_stageId AND (([codeName] = @original_codeName) OR ([codeName] IS NULL AND @original_codeName IS NULL)) AND (([URL] = @original_URL) OR ([URL] IS NULL AND @original_URL IS NULL)) AND (([note] = @original_note) OR ([note] IS NULL AND @original_note IS NULL))" InsertCommand="INSERT INTO [stageTable] ([stageId], [codeName], [URL], [note]) VALUES (@stageId, @codeName, @URL, @note)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [stageTable]" UpdateCommand="UPDATE [stageTable] SET [codeName] = @codeName, [URL] = @URL, [note] = @note WHERE [stageId] = @original_stageId AND (([codeName] = @original_codeName) OR ([codeName] IS NULL AND @original_codeName IS NULL)) AND (([URL] = @original_URL) OR ([URL] IS NULL AND @original_URL IS NULL)) AND (([note] = @original_note) OR ([note] IS NULL AND @original_note IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_stageId" Type="Int32" />
                    <asp:Parameter Name="original_codeName" Type="String" />
                    <asp:Parameter Name="original_URL" Type="String" />
                    <asp:Parameter Name="original_note" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="stageId" Type="Int32" />
                    <asp:Parameter Name="codeName" Type="String" />
                    <asp:Parameter Name="URL" Type="String" />
                    <asp:Parameter Name="note" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="codeName" Type="String" />
                    <asp:Parameter Name="URL" Type="String" />
                    <asp:Parameter Name="note" Type="String" />
                    <asp:Parameter Name="original_stageId" Type="Int32" />
                    <asp:Parameter Name="original_codeName" Type="String" />
                    <asp:Parameter Name="original_URL" Type="String" />
                    <asp:Parameter Name="original_note" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div id="id01" class="modal" style="background-color: #f1f1f1; display: none; width: 400px; height: 500px;">
                <div class="imgcontainer">
                    <h1>Add Stage Details</h1>
                    <span onclick="closeModal('id01')" class="close" title="Close Modal">&times;</span>
                </div>
                <div class="container">
                    <label for="codename"><b>CodeName</b></label>
                    <asp:TextBox ID="codename" runat="server"></asp:TextBox>

                    <label for="video"><b>Video URL</b></label>
                    <asp:TextBox ID="url" runat="server"></asp:TextBox>

                    <label for="note"><b>Note</b></label>
                    <asp:TextBox ID="note" runat="server"></asp:TextBox>

                    <span class="psw"><a href="#" onclick="showAddAssessmentModal()">Add Assessment</a></span>
                    <asp:Label ID="error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                    <br />

                    <asp:Button ID="SubmitButton" runat="server" Text="Confirm" OnClick="SubmitButton_Click" />

                    <div class="container">
                        <button type="button" onclick="closeModal('id01')" class="cancelbtn">Cancel</button>
                    </div>
                </div>
            </div>
            <div id="id02" class="modal" style="background-color: #f1f1f1; width: 600px; height: 500px; overflow: auto;">
                <div class="imgcontainer">
                    <h1>Add assessment Details</h1>
                    <span onclick="closeModal('id02')" class="close" title="Close Modal">&times;</span>
                </div>

                <div class="container">
                    <label for="assessment"><b>Assessment Name:</b></label>
                    <asp:TextBox ID="assessmentField" runat="server"></asp:TextBox>

                </div>
                <div class="container">
                    <label for="testname"><b>Assessment Details</b></label>
                    <br />

                    <label for="title"><b>Question:</b></label>
                    <asp:TextBox ID="titlebox" runat="server"></asp:TextBox>

                    <label for="title"><b>Options:</b></label><br />
                    <div class="Question_Container">
                        <asp:TextBox ID="txtBox1" runat="server" placeholder="Option 1"></asp:TextBox><br />
                        <asp:TextBox ID="txtBox2" runat="server" placeholder="Option 2"></asp:TextBox><br />
                        <asp:TextBox ID="txtBox3" runat="server" placeholder="Option 3"></asp:TextBox><br />
                        <asp:TextBox ID="txtBox4" runat="server" placeholder="Option 4"></asp:TextBox><br />
                    </div>
                    <div id="questionPages" runat="server">
                        <!-- Pages for adding questions will be dynamically generated here -->
                    </div>

                </div>


                <div class="container">
                    <button type="button" onclick="Delete()">Delete</button>
                    <button type="button" id="add" onclick="AddNewQuestion()">Add New Question</button>
                    <button type="button" id="close" onclick="closeAssessment()">Confirm</button>
                    <asp:Label ID="errorMsg" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                </div>
                <div class="container">
                    <button type="button" onclick="closeModal('id02')" class="cancelbtn">Cancel</button>
                </div>
            </div>
        </div>
    </form>
    <script>
        var modal1 = document.getElementById('id01');
        var modal2 = document.getElementById('id02');

        function showAdd() {
            modal1.style.display = "block";
        }

        function closeModal(modalId) {
            var modal = document.getElementById(modalId);
            modal.style.display = "none";
        }

        function showAddAssessmentModal() {
            var modal2 = document.getElementById('id02');
            modal2.style.display = "block";
        }

        function closeAssessment() {
            var modal2 = document.getElementById('id02');
            modal2.style.display = "none";
        }


        var questionPagesContainer = document.getElementById('questionPages');

        function AddNewQuestion() {
            // Create a new page for adding a question
            var newPage = document.createElement('div');
            newPage.classList.add('question-page');

            var title = document.createElement('label');
            title.textContent = 'Question:';
            var questionBox = document.createElement('input');
            questionBox.type = 'text';
            questionBox.classList.add('question'); // Add a class for identification
            questionBox.id = 'titlebox' + (questionPagesContainer.children.length + 1); // Generate unique ID for the input

            // Add the question and its input box to the new page
            newPage.appendChild(title);
            newPage.appendChild(questionBox);

            // Add options
            for (var i = 1; i <= 4; i++) {
                var optionBox = document.createElement('input');
                optionBox.type = 'text';
                optionBox.id = 'txtBox' + i + (questionPagesContainer.children.length + 1);
                optionBox.placeholder = 'Option ' + i;
                newPage.appendChild(optionBox);
                newPage.appendChild(document.createElement('br'));
            }

            // Add the new page to the container
            questionPagesContainer.appendChild(newPage);
        }




        function showDelete() {
            var modal2 = document.getElementById('id03');
            modal2.style.display = "block";
        }

        function showDetailsView(detailsViewId) {
            var modal = document.getElementById('id03');
            modal.style.display = "block";

            // Get all the details view elements
            var detailsViews = document.querySelectorAll('.details-view');

            // Hide all the details views
            detailsViews.forEach(function (detailsView) {
                detailsView.style.display = "none";
            });

            // Display the selected details view
            var selectedDetailsView = document.getElementById(detailsViewId);
            selectedDetailsView.style.display = "block";
        }




        function Delete() {
            // Get all question pages
            var questionPages = document.getElementsByClassName('question-page');

            // Check if there's at least one question page
            if (questionPages.length > 0) {
                // Remove the last question page
                questionPages[questionPages.length - 1].remove();
            }
        }

    </script>
</body>

</html>
