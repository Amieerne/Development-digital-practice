<?php
$cne = $_GET['cne'];

if(isset($_POST['upload'])){
    $tmp = $_FILES['fichier']['tmp_name'];

    $newName = "devoir_cne-" . $cne . ".txt";

    move_uploaded_file($tmp, "Devoirs/" . $newName);

    echo "Upload réussi";
}
?>

<form method="POST" enctype="multipart/form-data">
    <input type="file" name="fichier" required>
    <button name="upload">Envoyer</button>
</form>