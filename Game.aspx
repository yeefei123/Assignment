<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Game.aspx.cs" Inherits="Assignment.Game" %>

<!DOCTYPE html>
<html>
<head>
    <title>T-Rex Game</title>
    <link href='https://fonts.googleapis.com/css?family=Nova Flat' rel='stylesheet'>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #trex {
            width: auto;
            height: auto;
            position: absolute;
            bottom: 0;
            left: 100px;
        }

        .obstacle {
            width: 40px;
            height: 40px;
            position: absolute;
            bottom: 0;
        }

        #buttons-container div {
            padding: 10px 20px;
            background-image: url("wooden.png"); /* Wood texture background */
            background-size: cover;
            color: #fff;
            height: 30px;
            cursor: pointer;
            width: 300px;
            margin-bottom: 10px;
            text-align: center;
            font-weight: bold;
        }

        .alphabet {
            position: absolute;
            bottom: 120px; /* Adjust as needed */
            font-size: 1.6rem; /* Adjust as needed */
            color: #000000;
        }

        #buttons-container div:hover {
            color: #0024da;
        }


        #restart-button {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            width: 150px;
            height: 45px;
            text-align: center;
            font-size: 1.6rem;
            transform: translate(-50%, -50%);
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
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

        #buttons-container {
            margin-top: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            position: absolute;
            top: 50%; /* Center vertically */
            left: 50%;
            transform: translate(-50%, -50%); /* Center horizontally and vertically */
        }

        #level-info {
            margin-top: 120px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
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

        #level-display {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        #codeLiteral {
            font-size: 2rem;
            color: red;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
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
    <form id="form1" runat="server">
        <div id="game-container">
            <div id="trex">
                <img src="running.gif" />
            </div>
            <div id="words">
                <h1>T-REX Game</h1>
                <b>Press space bar to start the game</b>
            </div>
            <div id="level-info">
                <div id="level-display">
                </div>
            </div>
            <div id="codeLiteral" runat="server"></div>


            <div id="buttons-container">
                <div id="tutorials-button">Tutorials</div>
                <div id="video-button" onclick="window.location.href='User_video_page.aspx'">Learning Videos</div>
                <div id="exit-button" onclick="window.location.href='Login.aspx'">Exit</div>

            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [stageTable] WHERE [stageId] = @original_stageId AND (([codeName] = @original_codeName) OR ([codeName] IS NULL AND @original_codeName IS NULL)) AND (([URL] = @original_URL) OR ([URL] IS NULL AND @original_URL IS NULL)) AND (([note] = @original_note) OR ([note] IS NULL AND @original_note IS NULL)) AND (([exercise] = @original_exercise) OR ([exercise] IS NULL AND @original_exercise IS NULL)) AND (([assessment] = @original_assessment) OR ([assessment] IS NULL AND @original_assessment IS NULL)) AND (([progressID] = @original_progressID) OR ([progressID] IS NULL AND @original_progressID IS NULL))" InsertCommand="INSERT INTO [stageTable] ([codeName], [URL], [note], [exercise], [assessment], [progressID]) VALUES (@codeName, @URL, @note, @exercise, @assessment, @progressID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [stageTable]" UpdateCommand="UPDATE [stageTable] SET [codeName] = @codeName, [URL] = @URL, [note] = @note, [exercise] = @exercise, [assessment] = @assessment, [progressID] = @progressID WHERE [stageId] = @original_stageId AND (([codeName] = @original_codeName) OR ([codeName] IS NULL AND @original_codeName IS NULL)) AND (([URL] = @original_URL) OR ([URL] IS NULL AND @original_URL IS NULL)) AND (([note] = @original_note) OR ([note] IS NULL AND @original_note IS NULL)) AND (([exercise] = @original_exercise) OR ([exercise] IS NULL AND @original_exercise IS NULL)) AND (([assessment] = @original_assessment) OR ([assessment] IS NULL AND @original_assessment IS NULL)) AND (([progressID] = @original_progressID) OR ([progressID] IS NULL AND @original_progressID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_stageId" Type="Int32" />
                    <asp:Parameter Name="original_codeName" Type="String" />
                    <asp:Parameter Name="original_URL" Type="String" />
                    <asp:Parameter Name="original_note" Type="String" />
                    <asp:Parameter Name="original_exercise" Type="String" />
                    <asp:Parameter Name="original_assessment" Type="String" />
                    <asp:Parameter Name="original_progressID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="codeName" Type="String" />
                    <asp:Parameter Name="URL" Type="String" />
                    <asp:Parameter Name="note" Type="String" />
                    <asp:Parameter Name="exercise" Type="String" />
                    <asp:Parameter Name="assessment" Type="String" />
                    <asp:Parameter Name="progressID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="codeName" Type="String" />
                    <asp:Parameter Name="URL" Type="String" />
                    <asp:Parameter Name="note" Type="String" />
                    <asp:Parameter Name="exercise" Type="String" />
                    <asp:Parameter Name="assessment" Type="String" />
                    <asp:Parameter Name="progressID" Type="Int32" />
                    <asp:Parameter Name="original_stageId" Type="Int32" />
                    <asp:Parameter Name="original_codeName" Type="String" />
                    <asp:Parameter Name="original_URL" Type="String" />
                    <asp:Parameter Name="original_note" Type="String" />
                    <asp:Parameter Name="original_exercise" Type="String" />
                    <asp:Parameter Name="original_assessment" Type="String" />
                    <asp:Parameter Name="original_progressID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div id="obstacle-container"></div>
            <div id="alphabet-container"></div>
            <asp:HiddenField ID="hiddenCodeName" runat="server" />

            <div id="collected-alphabets" class="alphabet" style="top: 150px; left: 40%;">
                <h3>Collected Alphabet:</h3>
                <div id="showalphabets" class="alphabet" style="top: 150px;">
                </div>
            </div>
            <button type="button" id="restart-button">Restart</button>
        </div>
    </form>

    <script>
        const trex = document.getElementById('trex');
        const gameContainer = document.getElementById('game-container');
        let isJumping = false;
        let isGameOver = false;
        let gameStarted = false;
        let score = 0;

        const restartButton = document.getElementById('restart-button');
        const tutorialButton = document.getElementById('tutorials-button');
        const videoButton = document.getElementById('video-button');
        const exitButton = document.getElementById('exit-button');
        const words = document.getElementById('words');
        const buttonsContainer = document.getElementById('buttons-container');

        function jump() {
            if (!isJumping && !isGameOver && gameStarted) {
                isJumping = true;
                let jumpHeight = 0;
                const jumpInterval = setInterval(() => {
                    if (jumpHeight >= 100) {
                        clearInterval(jumpInterval);
                        const fallInterval = setInterval(() => {
                            if (jumpHeight <= 0) {
                                clearInterval(fallInterval);
                                isJumping = false;
                            } else {
                                jumpHeight -= 5;
                                trex.style.bottom = jumpHeight + 'px';
                            }
                        }, 20);
                    } else {
                        jumpHeight += 5;
                        trex.style.bottom = jumpHeight + 'px';
                    }
                }, 20);
            }
        }

        // Define an array to keep track of all obstacle intervals
        const obstacleIntervals = [];
        let obstacleCreationInterval; // Added variable to control obstacle creation interval

        const obstacleContainer = document.getElementById('obstacle-container');
        const alphabetContainer = document.getElementById('alphabet-container');

        function createObstacle() {
            if (!isGameOver && gameStarted) {
                const obstacle = document.createElement('img');
                obstacle.classList.add('obstacle');


                // Generate a random number between 1 and 3
                const randomImageNumber = Math.floor(Math.random() * 2) + 1;

                if (randomImageNumber === 1) {
                    obstacle.src = 'obstacle-1.gif';
                } else {
                    obstacle.src = 'obstacle-2.gif';
                }


                gameContainer.appendChild(obstacle);

                const obstaclePosition = gameContainer.clientWidth;
                obstacle.style.left = obstaclePosition + 'px';
                obstacle.style.bottom = '0px';

                const obstacleInterval = setInterval(() => {
                    const currentPosition = parseFloat(obstacle.style.left);

                    if (!isGameOver && gameStarted) {
                        if (currentPosition < -20) {
                            clearInterval(obstacleInterval);
                            gameContainer.removeChild(obstacle);
                        } else {
                            obstacle.style.left = (currentPosition - 5) + 'px';
                            if ( // collision detection condition
                                currentPosition < 150 && // Adjust this value to determine when to jump
                                currentPosition + 20 > 100 && // Adjust this value for obstacle width
                                parseFloat(trex.style.bottom) < 20
                            ) {
                                gameOver();
                            }
                        }
                    } else {
                        clearInterval(obstacleInterval); // Stop the obstacle's movement
                    }
                }, 20);

                // Add the obstacle interval to the array
                obstacleIntervals.push(obstacleInterval);
            }
        }

        const alphabetIntervals = [];
        let alphabetCreationInterval; // Added variable to control alphabet creation interval

        const targetCodeNameElement = document.getElementById('<%= hiddenCodeName.ClientID %>');
        const targetCodeName = targetCodeNameElement ? targetCodeNameElement.value : '';

        let alphabetList = [];

        function collectAlphabet(alphabetElement) {

            if (gameStarted && isJumping) {
                const alphabet = alphabetElement.textContent;
                console.log(alphabetElement.textContent);

                alphabetList.push(alphabet);
                const convertTarget = targetCodeName;

                const targetAlphabets = Array.from(new Set(convertTarget.split(''))); // Convert to lowercase, split, and get unique characters
                console.log(targetAlphabets);
                if (targetAlphabets.includes(alphabet)) {
                    console.log('Alphabet is in targetCodeName');
                    const collectedAlphabetsElement = document.getElementById('showalphabets');
                    collectedAlphabetsElement.textContent += alphabetElement.textContent;
                }
            }
        }


        // Add the collectAlphabet function to create alphabet elements
        function createRandomAlphabet() {
            if (!isGameOver && gameStarted) {
                const randomAlphabet = getRandomAlphabet();
                const alphabet = document.createElement('div');
                alphabet.classList.add('alphabet');
                alphabet.textContent = randomAlphabet;

                alphabet.style.bottom = '100px'; // Adjust as needed
                alphabet.style.left = gameContainer.clientWidth + 'px'; // Set initial position to the right edge

                alphabetContainer.appendChild(alphabet);

                const alphabetInterval = setInterval(() => {
                    const currentPosition = parseFloat(alphabet.style.left);

                    if (!isGameOver && gameStarted) {
                        if (currentPosition < -20) {
                            clearInterval(alphabetInterval);
                            alphabetContainer.removeChild(alphabet);
                        } else {
                            alphabet.style.left = (currentPosition - 5) + 'px';
                            if (
                                currentPosition < 150 &&
                                currentPosition + 20 > 100 &&
                                parseFloat(trex.style.bottom) < 100
                            ) {
                                collectAlphabet(alphabet);
                            }
                        }
                    } else {
                        clearInterval(alphabetInterval);
                    }
                }, 20);
                alphabetIntervals.push(alphabetInterval);
            }
        }




        function passGame() {
            alert('Congratulations! You have passed the game!');
        }


        function gameOver() {
            isGameOver = true;
            restartButton.style.display = 'block';
            isJumping = false;
            score = 0;
            console.log('gameover');
            for (const obstacleInterval of obstacleIntervals) {
                clearInterval(obstacleInterval);
            }

            for (const alphabetInterval of alphabetIntervals) {
                clearInterval(alphabetInterval);
            }
        }

        restartButton.addEventListener('click', () => {
            // Reset game state without refreshing the page
            isGameOver = false;
            isJumping = false;
            score = 0;
            trex.style.bottom = '0';
            restartButton.style.display = 'none';

            // Remove all obstacles
            const obstacles = document.querySelectorAll('.obstacle');
            obstacles.forEach(obstacle => {
                if (obstacle.parentNode) {
                    obstacle.parentNode.removeChild(obstacle);
                }
            });

            const alphabets = document.querySelectorAll('.alphabet');
            alphabets.forEach(alphabet => {
                if (alphabet.parentNode) {
                    alphabet.parentNode.removeChild(alphabet);
                }
            });

            for (const alphabetInterval of alphabetIntervals) {
                clearInterval(alphabetInterval);
            }

            // Clear and reset the obstacle creation interval
            for (const obstacleInterval of obstacleIntervals) {
                clearInterval(obstacleInterval);
            }
            obstacleIntervals.length = 0; // Clear the obstacle intervals array
            alphabetIntervals.length = 0; // Clear the obstacle intervals array

            // Reset the obstacle creation interval
            clearInterval(obstacleCreationInterval);

            clearInterval(alphabetCreationInterval);
            obstacleCreationInterval = setInterval(createObstacle, 2000); // Adjust timing as needed
            alphabetCreationInterval = setInterval(createRandomAlphabet, 2000);

            // Reset gameStarted flag
            gameStarted = false;
            words.style.display = 'block';
            buttonsContainer.style.display = 'block';
        });




        document.addEventListener('keydown', (event) => {
            if (event.keyCode === 32) {
                if (!isGameOver && !gameStarted) {
                    gameStarted = true;
                    words.style.display = 'none';
                    buttonsContainer.style.display = 'none';
                    createObstacle();
                    createRandomAlphabet(); // Add this line
                } else if (!isGameOver && gameStarted) {
                    jump();
                }
            }
        });


        // Function to parse the query parameters from the URL
        function getQueryParams() {
            const queryParams = {};
            const queryString = window.location.search.substring(1);
            const queryStrings = queryString.split('&');
            for (const queryString of queryStrings) {
                const keyValue = queryString.split('=');
                if (keyValue.length === 2) {
                    const key = decodeURIComponent(keyValue[0]);
                    const value = decodeURIComponent(keyValue[1]);
                    queryParams[key] = value;
                }
            }
            return queryParams;
        }

        const levelInfo = document.getElementById('level-display');

        // Get the level number from the URL query parameter
        const queryParams = getQueryParams();
        const levelNumber = queryParams['stage'];

        if (levelNumber) {
            // Display the level number
            levelInfo.textContent = `Level ${levelNumber}`;
        } else {
            // Redirect to level selection if no level is specified
            window.location.href = 'Stage.aspx';
        }


        function getRandomAlphabet() {
            const alphabet = String.fromCharCode(65 + Math.floor(Math.random() * 26)); // Generates a random alphabet from A to Z
            return alphabet;
        }

        alphabetCreationInterval = setInterval(createRandomAlphabet, 2500);
        obstacleCreationInterval = setInterval(createObstacle, 3000);
    </script>
</body>
</html>
