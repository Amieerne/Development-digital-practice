<?php
if(isset($_POST['EnvoyerCne'])){
    $cne = $_POST['cne'];
    header("Location: espaceEtu.php?cne=$cne");
}
?>

<!DOCTYPE html>
<html>
<head>
</head>

<body>

<form method="POST">
    <label>CNE : </label>
    <input type="text" name="cne" required>
    <input type="submit" value="Valider" name="EnvoyerCne">
</form>

</body>
</html>