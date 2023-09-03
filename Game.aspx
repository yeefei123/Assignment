<!DOCTYPE html>
<html>
<head>
    <title>T-Rex Game</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            font-family: sans-serif;
        }

        #game-container {
            width: 100%;
            height: 600px;
            background-color: #f7f7f7;
            position: absolute;
            overflow: hidden;
            background: lightblue url("background.jpg") no-repeat fixed center;
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
            background-color: #333;
            top: 50%;
            color: #fff;
            cursor: pointer;
            width: 300px;
            margin-bottom: 10px;
        }

        #buttons-container div:hover {
            background-color: #555;
            width: 300px;
        }

        #restart-button {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }

        #words {
            color: #000000;
            font-size: 2rem;
            position: absolute;
            top: 150px;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        #buttons-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            position: absolute;
            top: 50%; /* Center vertically */
            left: 50%;
            transform: translate(-50%, -50%); /* Center horizontally and vertically */
        }
    </style>
</head>
<body>
    <div id="game-container">
        <div id="trex">
            <img src="running.gif" />
        </div>
        <div id="restart-button">Restart</div>
        <div id="words">Press space bar to start the game</div>
        <div id="buttons-container">
            <div id="tutorials-button">Tutorials</div>
            <div id="video-button">Learning Videos</div>
            <div id="exit-button">Exit</div>
        </div>
    </div>

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

                            if (
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

        function gameOver() {
            isGameOver = true;
            restartButton.style.display = 'block'; // Show the restart button
            isJumping = false;
            score = 0;

            // Clear all obstacle intervals
            for (const obstacleInterval of obstacleIntervals) {
                clearInterval(obstacleInterval);
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
            obstacles.forEach(obstacle => obstacle.remove());

            // Clear and reset the obstacle creation interval
            for (const obstacleInterval of obstacleIntervals) {
                clearInterval(obstacleInterval);
            }
            obstacleIntervals.length = 0; // Clear the obstacle intervals array

            // Reset the obstacle creation interval
            clearInterval(obstacleCreationInterval);
            obstacleCreationInterval = setInterval(createObstacle, 2000); // Adjust timing as needed

            // Reset gameStarted flag
            gameStarted = false;
            words.style.display = 'block';
            buttonsContainer.style.display = 'block';
        });

        document.addEventListener('keydown', (event) => {
            if (event.keyCode === 32) { // Spacebar key
                if (!isGameOver && !gameStarted) {
                    gameStarted = true;
                    words.style.display = 'none'; // Hide the "Press space bar to start the game" message
                    createObstacle(); // Start the game by creating the first obstacle
                    buttonsContainer.style.display = 'none';
                } else if (!isGameOver && gameStarted) {
                    jump();
                }
            }
        });

        // Start the initial obstacle creation interval
        obstacleCreationInterval = setInterval(createObstacle, 2000); // Adjust timing as needed
    </script>
</body>
</html>
