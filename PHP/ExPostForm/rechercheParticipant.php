<!DOCTYPE html>
<html>
<head>
    <title>Recherche Participant</title>
</head>
<body>
<a href="menu.php" style="color:#fff; text-decoration:none; background:#2c3e50; padding:6px 12px; border-radius:4px;">Retour au menu</a><br>
<h2>Recherche d'un participant</h2>

<form method="POST">
    <label>Identifiant :</label>
    <input type="text" name="fid">
    <input type="submit" value="Rechercher">
</form>

<hr>

<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $idRecherche = $_POST['fid'];

    $fichier = "participants_bootcamp.txt";

    $lignes = file($fichier);

    $trouve = false;
    foreach ($lignes as $ligne) {

        if (strpos($ligne, "ID: $idRecherche") !== false) {

            echo "<h3>Participant trouvé :</h3>";
            echo $ligne;
            $trouve = true;
        }
    }

    if ($trouve == false) {
        echo "Participant introuvable";
    }
}
?>
</body>
</html>