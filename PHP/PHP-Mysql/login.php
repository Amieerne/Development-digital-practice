<?php

include("connexion.php");

$message="";

if(isset($_POST['login'])){

$email=$_POST['email'];

$password=$_POST['password'];

$sql="SELECT * FROM utilisateurs
WHERE email=?";

$statement=$pdo->prepare($sql);

$statement->execute([$email]);

$user=$statement->fetch();

if($user){

if(password_verify( $password, $user['password'] )){

$_SESSION['user']=$user['username'];

header("Location:accueil.php");

}else{

$message="Mot de passe incorrect";
}

}else{

$message="Utilisateur introuvable";
}
}

$css=($_SESSION['theme']=="dark") ? "dark.css" : "light.css";

?>

<!DOCTYPE html>
<html>

<head>

<title>Login</title>

<link rel="stylesheet" href="<?= $css ?>">

</head>

<body>
    
<div class="auth-box">

<h2>Login</h2>

<p class="message"><?= $message ?></p>

<form method="POST">

<label>Email</label>

<input type="email" name="email" placeholder="votre@email.com" required>

<label>Mot de passe</label>

<input type="password" name="password" placeholder="••••••••" required>

<button type="submit" name="login">

Se connecter

</button>

</form>

<br>

<a href="inscription.php">
Pas encore de compte ? Inscription
</a>

</div>

</body>
</html>