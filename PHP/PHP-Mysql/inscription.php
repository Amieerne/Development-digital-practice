<?php

include('connexion.php');
$css=($_SESSION['theme']=="dark") ? "dark.css" : "light.css";
$message="";

if(isset($_POST['inscrire'])){

$username=$_POST['username'];

$email=$_POST['email'];

$password=$_POST['password'];

$confirm_password=$_POST['confirm_password'];


if($password!=$confirm_password){

$message="Les mots de passe sont différents";

}else{

$hash=password_hash( $password, PASSWORD_DEFAULT );

$sql="INSERT INTO utilisateurs
(username,email,password)
VALUES(?,?,?)";

$statement=$pdo->prepare($sql);

$statement->execute([ $username, $email, $hash ]);

header("Location:login.php");
exit();

}

}

?>

<!DOCTYPE html>
<html>

<head>

<title>Inscription</title>

<link rel="stylesheet" href="<?= $css ?>">

</head>

<body>

<div class="auth-box">

<h2>Inscription</h2>

<p class="message"><?= $message ?></p>

<form method="POST">

<label>Nom d'utilisateur</label>

<input type="text" name="username" placeholder="votre pseudo" required>

<label>Email</label>

<input type="email" name="email" placeholder="votre@email.com" required>

<label>Mot de passe</label>

<input type="password" name="password" placeholder="••••••••" required>

<label>Confirmation mot de passe</label>

<input type="password" name="confirm_password" placeholder="••••••••" required>

<button type="submit" name="inscrire">

S'inscrire

</button>

</form>

<br>

<a href="login.php">
Déjà un compte ? Se connecter
</a>

</div>

</body>
</html>