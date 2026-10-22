<?php 
if ($_SERVER["REQUEST_METHOD"] == "POST"){

  // Récupération des données
  $id = $_POST['fid'];
  $NomComplet = $_POST['fnom'];
  $date = $_POST['fdate'];
  $Niv = $_POST['fniveau'];
  $ville =  $_POST['fville'];
  $motivation = $_POST['fmotivation'];

  // Condition pour les champs obligatoires 
  if (empty($id) || empty($NomComplet) || empty($date) || empty($Niv) || empty($ville)) {
    echo "Tous les champs obligatoires doivent être remplis.";
    }
  else {
  // Checkboxes
  $html = isset($_POST['fhtml']) ? $_POST['fhtml'] : "";
  $js = isset($_POST['fjs']) ? $_POST['fjs'] : "";
  $php = isset($_POST['fphp']) ? $_POST['fphp'] : "";

  // Separation avec '&'
  $tech = "";
  $tech .= !empty($html) ? $html : "";
  $tech .= strlen($js) != 0 ? (strlen($tech) == 0 ? $js : "&" . $js) : "";
  $tech .= strlen($php) != 0 ? (strlen($tech) == 0 ? $php : "&" . $php ) : "";

  // Date 
  $date = date("Y-m-d H:i:s");

  // Création de la ligne
  $ligne = "ID: $id, Nom: $NomComplet, Date: $date, Niveau: $Niv, Technologies: $tech, Ville: $ville, Motivation: $motivation";

  // Enregistrement des données dans le fichier
  file_put_contents("participants_bootcamp.txt", $ligne . "\n =================================================== \n" , FILE_APPEND);

  echo "Données stockées avec succès !";
  }
}
?>