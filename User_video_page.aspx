<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_video_page.aspx.cs" Inherits="Assignment.User_video_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tutorial Videos</title>
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
                border-radius:5px;
                height:100%;
                width:100%;
                padding-bottom:3px;
                margin:20px 20px 10px 10px;
                
            }

            .videocontainer{
                 margin:80px auto;
                 width:80%;
                 height:90%;
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
                height:90%;
                margin-right:30px;
                
            }
            .text h3{
                margin-bottom:10px;
            }
            .buttons{
                margin-left:38%;
            }

            .button {
              cursor: pointer;
              position: relative;
              padding: 10px 24px;
              font-size: 18px;
              color: #82817f;
              border: 2px solid #82817f;
              border-radius: 34px;
              background-color: transparent;
              font-weight: 600;
              transition: all 0.3s cubic-bezier(0.23, 1, 0.320, 1);
              overflow: hidden;
              margin-right:3%;
            }

            .button::before {
              content: '';
              position: absolute;
              inset: 0;
              margin: auto;
              width: 50px;
              height: 50px;
              border-radius: inherit;
              scale: 0;
              z-index: -1;
              background-color: lightgray;
              transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
            }

            .button:hover {
              color: #212121;
              background-color:lightgray;
              box-shadow: 0 0px 20px rgba(193, 163, 98,0.4);
            }

          
        }
        
    </style>
    
</head>
<body>
    
    <form id="form1" runat="server">
        </form>
        
            <div class="videocontainer" >
                <h1>Tutorial Video</h1>
                <div class="buttons">
                    <button class="button">Beginner</button>
                    <button class="button">Advanced</button>
                </div>
                    <div class="col">
                        <div class="small-img-row">
                            <div class="small-img">
                                <iframe src="https://www.youtube.com/embed/sOp6g6ES9e0" title="The Python Print Function | Python Tutorial for Beginners" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
                            </div>
                            <div class="text">
                                <h3>Python For Beginner</h3>
                                <p>This video will explain about the PRINT function in python.</p>
                            </div>
                            
                            
                        </div>
                        <div class="small-img-row">
                            <div class="small-img">
                                <iframe  src="https://www.youtube.com/embed/boah9hNHhi0" title="(1/3) HTML coding for kids and caveman - HTML, Title and Tags" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
                            </div>
                            <div class="text">
                                <h3>Title</h3>
                                <p>Description</p>
                            </div>
                        </div>
                        <div class="small-img-row">
                            <div class="small-img">
                                <iframe   src="https://www.youtube.com/embed/_j4Lj-BT00g" title="PROGRAMMING for kids 👦 Basic concepts 💻 Part 1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen=""></iframe>
                            </div>
                            <div class="text">
                                <h3>Title</h3>
                                <p>Description for the video</p>
                            </div>
                        </div>
                    </div>
                </div>
        
    
</body>
</html>
