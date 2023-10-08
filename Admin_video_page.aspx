﻿ <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_video_page.aspx.cs" Inherits="Assignment.Admin_video_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Video Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@700&display=swap');
        @media screen and (min-width:600px) {
            body {
                margin: 0;
                padding: 0;
                background-color: #f7f7f7;
                height:100%;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .videocontainer{
                display:grid;
                height:500px;
                grid-template-columns: 2fr 1fr;
                gap: 15px;
                padding:5px 5%;

            }
            .videocontainer .video{
                height:500px;
                
            }
            .videocontainer .video iframe{
                width:100%;
                height:100%;
                border-radius: 5px;
            }
            


            .videocontainer .video-list .vid iframe{
                width:50%;
                height:100%;
                border-radius: 5px;
                display:flex;
                
            }
            
        }


        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 100%;
            
        }


        .auto-style3 {
            width: 33%;
        }

        

    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div id="background">
            <div class="title">

                <asp:Label ID="tutorialvideolabel" runat="server" Text="Tutorial Videos" Font-Bold="True" Font-Size="30pt" ForeColor="Black"></asp:Label>

                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="stageId" DataValueField="stageId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>

                <br />
                </div>

            
            <div>
                <div class="videocontainer">
                    <div class="video">
                        <iframe id="videoIframe1" runat="server" allowfullscreen="true"></iframe>
                        
                        <br />
                        <asp:Label ID="videoTitle1" class= "vidtitle" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                        
                        <br />
                        <asp:Label ID="des1" runat="server" Text="Label"></asp:Label>
                        
                        </div>
                    <div class="video-list">
                        
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style3">
                         <iframe id="videoIframe2" runat="server" allowfullscreen="true"></iframe>
                                </td>
                                <td>
                        <asp:Label ID="videoTitle2" class= "vidtitle" runat="server" Font-Bold="True" ></asp:Label>
                                    <br />
                                    <asp:Label ID="des2" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                        <iframe id="videoIframe3" runat="server" allowfullscreen="true"></iframe>
                                </td>
                                <td>
                        <asp:Label ID="videoTitle3" class= "vidtitle" runat="server" Font-Bold="True"></asp:Label>
                                    <br />
                                    <asp:Label ID="des3" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                         <iframe id="videoIframe4" runat="server" allowfullscreen="true"></iframe>
                                </td>
                                <td class="auto-style2">
                         <asp:Label ID="videoTitle4" class= "vidtitle" runat="server" Font-Bold="True"></asp:Label>
                                    <br />
                                    <asp:Label ID="des4" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            
                        </table>
                        
                        <br />
                    </div>
                    </div>
                
                    
               
           
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [stageId] FROM [videoTable]">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
