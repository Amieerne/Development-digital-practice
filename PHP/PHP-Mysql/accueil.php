<?php

include("connexion.php");

if(!isset($_SESSION['user'])){
header("Location:login.php");
}

include("header.php");
include("menu.php");

?>

<div class="container">

<h2>Bienvenue <?= $_SESSION['user'] ?></h2>

<div class="info-box">

<p> Utilisez le menu en haut pour accéder aux différentes fonctionnalités : </p>

<br>

<ul>
<li>Gérer les clients</li>
<li>Modifier le thème</li>
<li>Se déconnecter</li>
</ul>

</div>

</div>

<?php include("footer.php"); ?>