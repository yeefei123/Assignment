<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_video_page.aspx.cs" Inherits="Assignment.User_video_page" %>

 

 

<!DOCTYPE html>

 

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Tutorial Videos</title>

    <style>

        /* Your CSS */

    </style>

    <script>

        function loadYouTubeVideo(codeName, videoId) {

            var videoContainer = document.getElementById('videoContainer');



            var videoDiv = document.createElement('div');

            videoDiv.className = 'small-img-row';



            var playerDiv = document.createElement('div');

            playerDiv.id = 'player-' + codeName;



            videoDiv.appendChild(playerDiv);

            videoContainer.appendChild(videoDiv);



            // Create a YouTube player

            var player;

            window.onYouTubeIframeAPIReady = function () {

                player = new YT.Player('player-' + codeName, {

                    height: '360',

                    width: '640',

                    videoId: videoId,

                    events: {

                        'onReady': function (event) {

                            event.target.playVideo();

                        }

                    }

                });

            }

        }



        (function () {

            var tag = document.createElement('script');

            tag.src = 'https://www.youtube.com/iframe_api';

            var firstScriptTag = document.getElementsByTagName('script')[0];

            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        }());



    </script>

</head>

<body>

    <form id="form1" runat="server">

        <div class="videocontainer">

            <h1>Tutorial Video</h1>

            <div class="col" id="videoContainer"></div>

        </div>
    </form>

</body>

</html>