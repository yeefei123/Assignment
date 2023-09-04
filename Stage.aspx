</html>

<!DOCTYPE html>
<html>
<head>
    <title>T-Rex Game - Stage Selection</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            font-family: sans-serif;
        }

        #stage-selection-container {
            width: 100%;
            top: 200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        #game-container {
            width: 100%;
            height: 600px;
            background-color: #f7f7f7;
            position: absolute;
            overflow: hidden;
            background: lightblue url("background.jpg") no-repeat fixed center;
        }

        .stage-button {
            padding: 10px 20px;
            background-image: url("rating.jpg"); /* Wood texture background */
            background-size: cover;
            color: #fff;
            cursor: pointer;
            height: 100px;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 1.5rem;
            position: relative; /* Added for positioning the number */
            display: flex; /* Use flexbox to align text and number */
            justify-content: flex-start; /* Align content to the start */
            top:200px;
        }

        .level-number {
            font-size: 1.2rem;
            margin-right: 10px; /* Add spacing between number and text */
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
    </style>
</head>
<body>
    <div id="game-container">
        <div id="words">
            <h1>T-REX</h1>
            <b>Press space bar to start the game</b>
        </div>
        <div id="stage-selection-container">
            <div class="stage-button" onclick="selectStage(1)">
                Level 1
            </div>
            <div class="stage-button" onclick="selectStage(2)">
                Level 2
            </div>
        </div>
    </div>
    <script>
        let selectedStage = 0;
        function selectStage(stageNumber) {
            selectedStage = stageNumber;
            window.location.href = `Game.aspx?stage=${selectedStage}`;
        }
    </script>
</body>
</html>