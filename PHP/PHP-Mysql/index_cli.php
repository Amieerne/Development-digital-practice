<?php

include("connexion.php");

if(!isset($_SESSION['user'])){
header("Location:login.php");
}

$sql="SELECT * FROM clients";

$statement=$pdo->query($sql);

$clients=$statement->fetchAll();

include("header.php");
include("menu.php");

?>

<div class="container">

<a href="ajouter_cli.php">Ajouter</a>

<br><br>

<table>

<tr>
<th>ID</th>
<th>Nom</th>
<th>Tel</th>
<th>Ville</th>
<th>Actions</th>
</tr>

<?php foreach($clients as $client){ ?>

<tr>

<td><?= $client['id'] ?></td>
<td><?= $client['nom'] ?></td>
<td><?= $client['tel'] ?></td>
<td><?= $client['ville'] ?></td>

<td>

<a href="modifier_cli.php?id=<?= $client['id'] ?>">
Editer
</a>

|

<a onclick="return confirm('Supprimer ce client ?')"
href="supprimer_cli.php?id=<?= $client['id'] ?>">

Supprimer

</a>

</td>

</tr>

<?php } ?>

</table>

</div>

<?php include("footer.php"); ?>