<!DOCTYPE html>
<html>
<head>
    <title>Admin - Level Management</title>
</head>
<body>
    <h1>Admin - Level Management</h1>
    <button onclick="addLevel()">Add Level</button>
    <ul id="level-list"></ul>
</body>
<script>
    function addLevel() {
        const levelNumber = prompt('Enter level number:');
        if (levelNumber) {
            const levelList = document.getElementById('level-list');
            const listItem = document.createElement('li');
            listItem.innerHTML = `<a href="game.aspx?level=${levelNumber}">Level ${levelNumber}</a>`;
            levelList.appendChild(listItem);
        }
    }
</script>
</html>
