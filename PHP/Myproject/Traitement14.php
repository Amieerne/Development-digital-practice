<?php 
if ($_SERVER["REQUEST_METHOD"] == "GET"){

  // Récupération des données
  $id = $_GET['fid'];
  $NomComplet = $_GET['fnom'];
  $date = $_GET['fdate'];
  $Niv = $_GET['fniveau'];
  $ville =  $_GET['fville'];
  $motivation = $_GET['fmotivation'];

  // Checkboxes
  $html = isset($_GET['fhtml']) ? $_GET['fhtml'] : "";
  $js = isset($_GET['fjs']) ? $_GET['fjs'] : "";
  $php = isset($_GET['fphp']) ? $_GET['fphp'] : "";

  // Separation avec '&'
  $tech = "";
  $tech .= !empty($html) ? $html : "";
  $tech .= strlen($js) != 0 ? (strlen($tech) == 0 ? $js : "&" . $js) : "";
  $tech .= strlen($php) != 0 ? (strlen($tech) == 0 ? $php : "&" . $php ) : "";

  // Création de la ligne
  $ligne = "ID: $id, Nom: $NomComplet, Date: $date, Niveau: $Niv, Technologies: $tech, Ville: $ville, Motivation: $motivation";

  // Enregistrement des données dans le fichier
  file_put_contents("participants.txt", $ligne . "\n", FILE_APPEND);

  echo "Données stockées avec succès !";
}
?>