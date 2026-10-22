<?php
if(isset($_POST['telecharger'])){
    header("Location: download.php");
}
if(isset($_POST['upload'])){
    header("Location: uploadCorrection.php");
}
?>

<!DOCTYPE html>
<html>
<body>

<form method="POST">
    <input type="submit" value="Télécharger les devoirs" name="telecharger"><br><br>
    <input type="submit" value="Charger les corrections" name="upload">
</form>

</body>
</html>