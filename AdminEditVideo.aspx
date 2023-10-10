<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminEditVideo.aspx.cs" Inherits="Assignment.AdminEditVideo" %>

 

<!DOCTYPE html>

 

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Admin Edit Video Page</title>
<style type="text/css">

     @import url('https://fonts.googleapis.com/css2?family=Inter:wght@700&display=swap');
    @media screen and (min-width:600px) {
        /* General styling */
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container2 {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
            width: 80%;
        }

        .table {
            width: 100%;
        }

        .textbox {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        .auto-style2 {
            vertical-align: top;
            padding: 20px;
        }

        .videodetails {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            resize: vertical;
        }

    }

</style>
</head>
<body>
<form id="form1" runat="server">
    
    <div class="container2">
        <asp:Label ID="Label1" runat="server" Text="Edit Video" Font-Bold="True" Font-Size="30pt"></asp:Label>
        <br />

    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
       
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="stageId" DataValueField="stageId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" Height="16px">
</asp:DropDownList>
         
                
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
       
            <br />
            <!-- First Video --> 

            <asp:Label ID="title1" runat="server" Text="Title"></asp:Label>
            <asp:TextBox ID="titlebox" class="textbox" runat="server"></asp:TextBox>
             <br />
             <asp:Label ID="url1" runat="server" Text="URL"></asp:Label>
            <asp:TextBox ID="URLBox"  class="textbox"  runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="des1" runat="server" Text="Description"></asp:Label>
            <textarea id="descriptionbox" cols="20" name="S2" rows="2" runat="server"></textarea>
            <br />
            <asp:Label ID="stageid1" runat="server" Text="Stage ID"></asp:Label>
            <asp:TextBox ID="stageidbox"  class="textbox"   runat="server"></asp:TextBox>
         
                
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete" />
                <br />
         
                
            </td>
            <td>
         <!-- Second  Video --> 

         <asp:Label ID="title2" runat="server" Text="Title"></asp:Label>
         <asp:TextBox ID="titlebox2" class="textbox" runat="server"></asp:TextBox>
          <br />
          <asp:Label ID="url2" runat="server" Text="URL"></asp:Label>
         <asp:TextBox ID="URLBox2"  class="textbox"  runat="server"></asp:TextBox>
         <br />
         <asp:Label ID="des2" runat="server" Text="Description"></asp:Label>
         <textarea id="descriptionbox2" cols="20" name="S1" rows="2" runat="server"></textarea>
         <br />
         <asp:Label ID="stageid2" runat="server" Text="Stage ID"></asp:Label>
         <asp:TextBox ID="stageidbox2"  class="textbox"   runat="server"></asp:TextBox>
      
                
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
      
                
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete" Visible="False" />
      
                
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <div class="videodetails">
                    <br />
                    <!-- Third  Video --> 

                    <asp:Label ID="title3" runat="server" Text="Title"></asp:Label>
                    <asp:TextBox ID="titlebox3" runat="server" class="textbox"></asp:TextBox>
                    <br />
                    <asp:Label ID="url3" runat="server" Text="URL"></asp:Label>
                    <asp:TextBox ID="URLBox3" runat="server" class="textbox"></asp:TextBox>
                    <br />
                    <asp:Label ID="des3" runat="server" Text="Description"></asp:Label>
                    <textarea id="descriptionbox3" runat="server" cols="20" name="S3" rows="2"></textarea>
                    <br />
                    <asp:Label ID="stageid3" runat="server" Text="Stage ID"></asp:Label>
                    <asp:TextBox ID="stageidbox3" runat="server" class="textbox"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Delete" Visible="False" />
                </div>
            </td>
            <td>
                
                <div class="videodetails">
                    <br />
                    <!-- Fourth  Video --> 

                    <asp:Label ID="title4" runat="server" Text="Title"></asp:Label>
                    <asp:TextBox ID="titlebox4" runat="server" class="textbox"></asp:TextBox>
                    <br />
                    <asp:Label ID="url4" runat="server" Text="URL"></asp:Label>
                    <asp:TextBox ID="URLBox4" runat="server" class="textbox"></asp:TextBox>
                    <br />
                    <asp:Label ID="des4" runat="server" Text="Description"></asp:Label>
                    <textarea id="descriptionbox4" runat="server" cols="20" name="S4" rows="2"></textarea>
                    <br />
                    <asp:Label ID="stageid4" runat="server" Text="Stage ID"></asp:Label>
                    <asp:TextBox ID="stageidbox4" runat="server" class="textbox"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Delete" Visible="False" />
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">

    

  <asp:Button ID="updatebutton" runat="server" Text="Update" OnClick="updatebutton_Click"  />
    
  
         
                
            </td>
            <td>
                
                &nbsp;</td>
        </tr>
 </table>
        </div>
    
    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [stageId] FROM [videoTable]"></asp:SqlDataSource>

    

                
</form>
</body>
</html>