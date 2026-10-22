<?php

include("connexion.php");

if(isset($_POST['ajouter'])){

$nom=$_POST['nom'];
$tel=$_POST['tel'];
$ville=$_POST['ville'];

$sql="INSERT INTO clients(nom,tel,ville) VALUES(?,?,?)";

$statement=$pdo->prepare($sql);

$statement->execute([
$nom,
$tel,
$ville
]);

header("Location:index_cli.php");
}

include("header.php");
include("menu.php");

?>

<div class="container">

<h2>Ajouter Client</h2>

<form method="POST">

Nom :
<input type="text" name="nom">

<br><br>

Tel :
<input type="text" name="tel">

<br><br>

Ville :
<input type="text" name="ville">

<br><br>

<button type="submit" name="ajouter">Ajouter</button>

<a href="index_cli.php">Retour</a>

</form>

</div>

<?php include("footer.php"); ?>