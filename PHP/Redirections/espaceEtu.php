<?php
$cne = $_GET['cne'];

if(isset($_POST['DeposerDevoir'])){
    header("Location: deposer.php?cne=$cne");
}
if(isset($_POST['ConsulterNote'])){
    header("Location: note.php?cne=$cne");
}
if(isset($_POST['TelechargerCorrection'])){
    header("Location: correction.php?cne=$cne");
}
?>

<!DOCTYPE html>
<html>
<body>

<h3>Bienvenue Etudiant ayant CNE : <?php echo $cne; ?></h3>

<form method="POST">
    <input type="submit" value="Déposer mon devoir" name="DeposerDevoir">
    <input type="submit" value="Consulter ma note" name="ConsulterNote">
    <input type="submit" value="Télécharger ma correction" name="TelechargerCorrection">
</form>

</body>
</html>