<?php
if(isset($_POST['Envoyer'])){
    $filename = $_FILES['myfile']['name'];
    $destination = 'devoirs/' . $filename ;
    $extension = pathinfo($filename, PATHINFO_EXTENSION);

    $file = $_FILES['myfile']['tmp_name'];
    $size = $_FILES['myfile']['size'];

    if (!in_array($extension, ['pdf', 'docx', 'txt'])) {
        echo "You file extension must be pdf, .docx or .txt";
    } 
    elseif ($size > 5 * 1024 * 1024) {
        echo "File too large!";
    } 
    else {
        if (move_uploaded_file($file, $destination)) {
            echo "File uploaded successfully";
        } 
        else {
            echo "Failed to upload file.";
        }
    }
}

if(isset($_POST['Consulter'])){
    $cne = $_POST['cne'];
    $fichier = "corrections/devoir_cne-" . $cne . "_note.txt";

    if(file_exists($fichier)){

        $contenu = file_get_contents($fichier);

        echo "<h3>Résultat :</h3>";
        echo $contenu;

    } else {
        echo "Correction non pas encore faite";
    }
}

?>