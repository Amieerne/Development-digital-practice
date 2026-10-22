<a href="menu.php" style="color:#fff; text-decoration:none; background:#2c3e50; padding:6px 12px; border-radius:4px;">Retour au menu</a><br><br>
<?php
$fichier = "participants_bootcamp.txt";

echo "Liste des participants : <br><br>";

    $lignes = file($fichier);

    $nombre = 0;
    foreach ($lignes as $ligne) {

        echo $ligne . "<br>";

        if (substr($ligne, 0, 3) == "ID:") {
            $nombre++ ;
        }
    }

    if ($nombre == 0) {
        echo "<br> Aucun participant dans le fichier.";
    } else {
        echo "<br>Nombre total : $nombre";
    }
?>
