<!DOCTYPE html>
<html>
<head>
    <title>Admin - Level Management</title>
    <style>
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

        .level-button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            margin: 5px 0;
            transition: background-color 0.3s;
            margin-top: 30px;
        }

            .level-button:hover {
                background-color: #555;
            }

        body {
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #game-container {
            width: 100%;
            height: 600px;
            background-color: #f7f7f7;
            position: absolute;
            overflow: hidden;
            background: lightblue url("background.jpg") no-repeat fixed center;
        }

        #buttons-container {
            margin-top: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 300px;
            text-align: center;
            gap: 15px; /* Increased the gap between buttons */
            position: absolute;
            top: 200px; /* Center vertically */
            left: 50%;
            transform: translate(-50%, -50%); /* Center horizontally and vertically */
        }

        #level-list {
            list-style-type: none;
            padding: 0;
        }

            #level-list li {
                margin-bottom: 10px;
            }
    </style>
</head>
<body>

    <div id="game-container">
        <div id="words">
            <h1>T-REX Game</h1>
            <b>Admin Management System</b>
        </div>
        <div id="buttons-container">
            <div class="level-button" onclick="viewLevel()">View</div>
            <div class="level-button" onclick="addLevel()">Add</div>
            <div class="level-button" onclick="modifyLevel()">Modify</div>
            <div class="level-button" onclick="deleteLevel()">Delete</div>
        </div>
        <ul id="level-list"></ul>
    </div>
   
</body>

</html>
