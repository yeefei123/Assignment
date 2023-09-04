<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_video_page.aspx.cs" Inherits="Assignment.User_video_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@700&display=swap');
        @media screen and (min-width:600px) {

            *{
                margin:0;
                padding:0;
   
            }

            body{
                display:flex;
                width:auto;
                justify-content:center;
                align-content:center;
                min-height:100vh;
                background-color: #414a4c;

            }
            
            iframe{
                border: 2px solid black;
                height:100%;
                width:100%;
                padding-bottom:3px;
                margin:10px 20px 10px 10px;
                
            }

            .videocontainer{
                 margin:80px auto;
                 width:80%;
                 height:80%;
                 background-color: #2f3030;
                 box-shadow: 0 0 .4vw rgba(0,0,0,0.5), 0 0 0 .15vw transparent;
                 border: 2px solid black;
                 border-radius: 5px;
                 padding:10px 5px 5px 10px;
                 color:white;
            }

            .videocontainer h1{
                padding:60px 0;
                color:white;
                font-size:44px;
                text-align:center;
            }
            
            .col{
                flex-basis:30%;
                min-width:250px;
                
            }

            
            .small-img-row{
                display:flex;
                background-color:#787774;
                margin:20px 0;
                align-items:center;
                border-radius:6px;
                overflow:hidden;
                width:85%;
                height:fit-content;
                margin-left:10%;
                
                
            }
            .small-img{
                position:relative;
                height:50%;
                margin-right:30px;
                
            }
            
        }
        
    </style>
    
</head>
<body>

    <form id="form1" runat="server">
        </form>
        
            <div class="videocontainer" >
                <h1>Tutorial Video</h1>
                    <div class="col">
                        <div class="small-img-row">
                            <div class="small-img">
                                <iframe  src="https://www.youtube.com/embed/8nJ0YaumTi4" title="What is Python? | Python for Kids | Python Coding for Kids | Coding for Kids | Kids Coding | Coding" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen "></iframe>
                            </div>
                            <p>Description for the video</p>
                        </div>
                        <div class="small-img-row">
                            <div class="small-img">
                                <iframe  src="https://www.youtube.com/embed/boah9hNHhi0" title="(1/3) HTML coding for kids and caveman - HTML, Title and Tags" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                            </div>
                            <p>Description for the video</p>
                        </div>
                        <div class="small-img-row">
                            <div class="small-img">
                                <iframe   src="https://www.youtube.com/embed/_j4Lj-BT00g" title="PROGRAMMING for kids 👦 Basic concepts 💻 Part 1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                            </div>
                            <p>Description for the video</p>
                        </div>
                    </div>
                </div>
            
            
               
            
        
    
</body>
</html>
