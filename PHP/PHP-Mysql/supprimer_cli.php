<?php

include("connexion.php");

$id = $_GET['id'];

$sql = "DELETE FROM clients WHERE id=?";

$statement = $pdo->prepare($sql);

$statement->execute([$id]);

header("Location:index_cli.php");

?>