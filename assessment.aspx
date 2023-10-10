<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="assessment.aspx.cs" Inherits="Assignment.assessment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="display" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [assessmentTable] WHERE [assessmentId] = @original_assessmentId AND (([assessmentName] = @original_assessmentName) OR ([assessmentName] IS NULL AND @original_assessmentName IS NULL)) AND (([questionName] = @original_questionName) OR ([questionName] IS NULL AND @original_questionName IS NULL)) AND (([option1] = @original_option1) OR ([option1] IS NULL AND @original_option1 IS NULL)) AND (([option2] = @original_option2) OR ([option2] IS NULL AND @original_option2 IS NULL)) AND (([option3] = @original_option3) OR ([option3] IS NULL AND @original_option3 IS NULL)) AND (([option4] = @original_option4) OR ([option4] IS NULL AND @original_option4 IS NULL)) AND (([isAns] = @original_isAns) OR ([isAns] IS NULL AND @original_isAns IS NULL)) AND (([stageId] = @original_stageId) OR ([stageId] IS NULL AND @original_stageId IS NULL))" InsertCommand="INSERT INTO [assessmentTable] ([assessmentName], [questionName], [option1], [option2], [option3], [option4], [isAns], [stageId]) VALUES (@assessmentName, @questionName, @option1, @option2, @option3, @option4, @isAns, @stageId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [assessmentTable]" UpdateCommand="UPDATE [assessmentTable] SET [assessmentName] = @assessmentName, [questionName] = @questionName, [option1] = @option1, [option2] = @option2, [option3] = @option3, [option4] = @option4, [isAns] = @isAns, [stageId] = @stageId WHERE [assessmentId] = @original_assessmentId AND (([assessmentName] = @original_assessmentName) OR ([assessmentName] IS NULL AND @original_assessmentName IS NULL)) AND (([questionName] = @original_questionName) OR ([questionName] IS NULL AND @original_questionName IS NULL)) AND (([option1] = @original_option1) OR ([option1] IS NULL AND @original_option1 IS NULL)) AND (([option2] = @original_option2) OR ([option2] IS NULL AND @original_option2 IS NULL)) AND (([option3] = @original_option3) OR ([option3] IS NULL AND @original_option3 IS NULL)) AND (([option4] = @original_option4) OR ([option4] IS NULL AND @original_option4 IS NULL)) AND (([isAns] = @original_isAns) OR ([isAns] IS NULL AND @original_isAns IS NULL)) AND (([stageId] = @original_stageId) OR ([stageId] IS NULL AND @original_stageId IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_assessmentId" Type="Int32" />
                <asp:Parameter Name="original_assessmentName" Type="String" />
                <asp:Parameter Name="original_questionName" Type="String" />
                <asp:Parameter Name="original_option1" Type="String" />
                <asp:Parameter Name="original_option2" Type="String" />
                <asp:Parameter Name="original_option3" Type="String" />
                <asp:Parameter Name="original_option4" Type="String" />
                <asp:Parameter Name="original_isAns" Type="String" />
                <asp:Parameter Name="original_stageId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="assessmentName" Type="String" />
                <asp:Parameter Name="questionName" Type="String" />
                <asp:Parameter Name="option1" Type="String" />
                <asp:Parameter Name="option2" Type="String" />
                <asp:Parameter Name="option3" Type="String" />
                <asp:Parameter Name="option4" Type="String" />
                <asp:Parameter Name="isAns" Type="String" />
                <asp:Parameter Name="stageId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="assessmentName" Type="String" />
                <asp:Parameter Name="questionName" Type="String" />
                <asp:Parameter Name="option1" Type="String" />
                <asp:Parameter Name="option2" Type="String" />
                <asp:Parameter Name="option3" Type="String" />
                <asp:Parameter Name="option4" Type="String" />
                <asp:Parameter Name="isAns" Type="String" />
                <asp:Parameter Name="stageId" Type="Int32" />
                <asp:Parameter Name="original_assessmentId" Type="Int32" />
                <asp:Parameter Name="original_assessmentName" Type="String" />
                <asp:Parameter Name="original_questionName" Type="String" />
                <asp:Parameter Name="original_option1" Type="String" />
                <asp:Parameter Name="original_option2" Type="String" />
                <asp:Parameter Name="original_option3" Type="String" />
                <asp:Parameter Name="original_option4" Type="String" />
                <asp:Parameter Name="original_isAns" Type="String" />
                <asp:Parameter Name="original_stageId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="quesNum" runat="server" Text="Label"></asp:Label>
        <br />
        Please select an option.<br />
        <br />
        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Ans" />
        <br />
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Ans"/>
        <br />
        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="Ans"/>
        <br />
        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="Ans"/>
        <br />
        <asp:Label ID="notification" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="quesNum0" runat="server" Text="Label"></asp:Label>
        <br />
        Please select an option.<br />
        <br />
        <asp:RadioButton ID="RadioButton5" runat="server"  GroupName="Ans" />
        <br />
        <asp:RadioButton ID="RadioButton6" runat="server" GroupName="Ans"/>
        <br />
        <asp:RadioButton ID="RadioButton7" runat="server" GroupName="Ans"/>
        <br />
        <asp:RadioButton ID="RadioButton8" runat="server" GroupName="Ans"/>
        <br />
        <asp:Label ID="notification0" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="quesNum1" runat="server" Text="Label"></asp:Label>
        <br />
        Please select an option.<br />
        <br />
        <asp:RadioButton ID="RadioButton9" runat="server"  GroupName="Ans" />
        <br />
        <asp:RadioButton ID="RadioButton10" runat="server" GroupName="Ans"/>
        <br />
        <asp:RadioButton ID="RadioButton11" runat="server" GroupName="Ans"/>
        <br />
        <asp:RadioButton ID="RadioButton12" runat="server" GroupName="Ans"/>
        <br />
        <asp:Label ID="notification1" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="quesNum2" runat="server" Text="Label"></asp:Label>
        <br />
        Please select an option.<br />
        <br />
        <asp:RadioButton ID="RadioButton13" runat="server" GroupName="Ans" />
        <br />
        <asp:RadioButton ID="RadioButton14" runat="server" GroupName="Ans"/>
        <br />
        <asp:RadioButton ID="RadioButton15" runat="server" GroupName="Ans"/>
        <br />
        <asp:RadioButton ID="RadioButton16" runat="server" GroupName="Ans"/>
        <br />
        <asp:Label ID="notification2" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit" Width="316px" />
        <br/>
        <asp:Button ID="allCorrect" runat="server" Text="All Correct Debug Button" OnClick="allCorrect_Click" />
    </form>
</body>
</html>
