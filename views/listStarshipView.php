<!-- listStarshipView.php -->
<!DOCTYPE html>
<html>
<head>
    <title>Starship list</title>
</head>
<body>
    <h1>Liste des vaisseaux</h1>
    <ul>
        <?php foreach ($starship as $ship): ?>
            <li>
                <a href="index.php?controller=starship&action=showStarship&id=<?php echo $ship['id']; ?>">
                    <?php echo $ship['name']; ?>
                </a>
            </li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
