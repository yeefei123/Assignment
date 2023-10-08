<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_video_page.aspx.cs" Inherits="Assignment.Admin_video_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Video Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@700&display=swap');
        @media screen and (min-width:600px) {

            .addvideoform {
                margin-top: 5%;
                margin-left: 34%;
                background-color: #414a4c;
                height: auto;
                width: 400px;
                padding: 3% 3% 3% 3%;
                box-shadow: 1px 1px 2px rgba(0, 0, 0, 125);
                border-radius: 5px;
            }

            .container2 {
                height: 100%;
                width: 100%;
                background-size: cover;
                background-position: center;
                position: inherit;
            }

            .formtitle {
                font-size: 24px;
                font-weight: 700;
                margin-bottom: 25px;
                color: #ffff;
                text-transform: uppercase;
                text-align: center;
                font-family: 'Inter', sans-serif;
            }

            .videodetails {
                color: white;
                padding: 3px;
            }

            

            .button {
                background-color: #ffffff00;
                color: #fff;
                width: 8.5em;
                height: 2.9em;
                border: #3fb089 0.2rem solid;
                border-radius: 11px;
                text-align: right;
                transition: all 0.6s ease;
                margin-left: 35%;
                margin-top: 5%;
            }

            .button:hover {
                background-color: #67e087;
                cursor: pointer;
            }

            .button svg {
               width: 1.6em;
               margin: -0.2em 0.8em 1em;
               position: absolute;
               display: flex;
               transition: all 0.6s ease;
            }

            .button:hover svg {
               transform: translateX(5px);
            }

            .text {
                margin: 0 1.5em
            }

            #input {
                font-family: 'Inter', sans-serif;
                font-weight: 500;
                font-size: .8vw;
                background-color: black;
                box-shadow: 0 0 .4vw rgba(0,0,0,0.5), 0 0 0 .15vw transparent;
                border: none;
                outline: none;
                padding: 0.4vw;
                max-width: 370px;
                transition: .4s;
                width: 500px;
                border-radius: 5px;
                color: white;
                padding: 4px;
                margin-top: 10px;
                margin-bottom: 10px;
                padding-left: 3%;
}
            }

            #input:hover {
                box-shadow: 0 0 0 .15vw rgba(135, 207, 235, 0.186);
                    
            }

            #input:focus {
                box-shadow: 0 0 0 .15vw skyblue;
            }

    </style>
</head>

<body>

        <div class="container2">
            <div class="addvideoform">
                <div class="formtitle">Add Video</div>
                <form action="" method="post"">
                    <div class="videodetails">
                        <div>
                            <label >Title</label> <br/>
                            <input id="input"  type="text" required="required" placeholder="Enter title" /> <br/>
                            <label >Description</label> <br>
                            <textarea id="input" required="required" placeholder="Enter Description"></textarea><br/>
                            <label >Programming Language</label>
                            <br />
                            <br/> 
                            <input type="radio" name="language" required="required" />Python
                            <input type="radio" name="language" required="required" />HTML
                            <input type="radio" name="language" required="required" />Java 
                            <br />
                            <br />
                            <label>Upload Video or URL</label>
                            
                            <br />
                            <input id="input" type="file" accept=".mp4" />
                            
                            <br />
                            <label>Insert URL</label>
                            <br />
                           
                            <input id="input" type="url" placeholder="Insert URL"/>
                        </div>
                        </div>
                    <div>
                        <button class="button">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M4.5 12h15m0 0l-6.75-6.75M19.5 12l-6.75 6.75"></path>
                            </svg>
                            <div class="text">
                              Add
                            </div>
                          </button>
                    </div>
                </form>
            </div>
        </div>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
