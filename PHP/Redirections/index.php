<?php
if(isset($_POST['PreEspaceEtu'])){
    header("Location: loginEtu.php");
}
if(isset($_POST['PreEspaceProf'])){
    header("Location: espaceProf.php");
}
if(isset($_POST['espaceLiensUtiles'])){
    header("Location: liens.php");
}
?>

<!DOCTYPE html>
<html>
<head>
</head>

<body>

<form method="POST">
    <input type="submit" value="Espace étudiant" name="PreEspaceEtu"><br><br>
    <input type="submit" value="Espace professeur" name="PreEspaceProf"><br><br>
    <input type="submit" value="Liens utiles" name="espaceLiensUtiles">
</form>

</body>
</html>