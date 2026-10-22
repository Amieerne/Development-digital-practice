<?php

include("connexion.php");

if(isset($_POST['changer'])){

$_SESSION['theme']=$_POST['theme'];

header("Location:modifier_theme.php");
}

include("header.php");
include("menu.php");

?>

<div class="container">

<h2>Personnaliser Thème</h2>

<form method="POST">

<label>Choisir un thème</label>

<select name="theme">

<option value="dark"

<?php

if($_SESSION['theme']=="dark"){
echo "selected";
}

?>

>

Dark Mode

</option>

<option value="light"

<?php

if($_SESSION['theme']=="light"){
echo "selected";
}
?>
>
Light Mode
</option>

</select>

<button
type="submit" name="changer"> Modifier Thème </button>
</form>

</div>

<?php include("footer.php"); ?>