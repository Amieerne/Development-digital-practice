<?php

include("connexion.php");

$id=$_GET['id'];

$sql="SELECT * FROM clients WHERE id=?";

$statement=$pdo->prepare($sql);

$statement->execute([$id]);

$client=$statement->fetch();

if(isset($_POST['modifier'])){

$nom=$_POST['nom'];

$tel=$_POST['tel'];

$ville=$_POST['ville'];

$sql="UPDATE clients
SET nom=?,
tel=?,
ville=?
WHERE id=?";

$statement=$pdo->prepare($sql);

$statement->execute([
$nom,
$tel,
$ville,
$id
]);

header("Location:index_cli.php");
}

include("header.php");
include("menu.php");

?>

<div class="container">

<h2>Modifier Client</h2>

<form method="POST">

ID

<input type="text" value="<?= $client['id'] ?>" readonly>

Nom

<input type="text" name="nom" value="<?= $client['nom'] ?>">

Tel

<input type="text" name="tel" value="<?= $client['tel'] ?>">

Ville

<input type="text" name="ville" value="<?= $client['ville'] ?>">

<button type="submit" name="modifier">

Modifier

</button>

</form>

</div>

<?php include("footer.php"); ?>