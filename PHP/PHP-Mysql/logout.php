<?php

include("connexion.php");
session_destroy();
header("Location:login.php");

?>