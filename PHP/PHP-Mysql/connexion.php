<?php

session_start();

$pdo = new PDO(
    "mysql:host=localhost;dbname=gestion_app",
    "root",
    ""
);

if(!isset($_SESSION['theme'])){
    $_SESSION['theme'] = "dark";
}
?>