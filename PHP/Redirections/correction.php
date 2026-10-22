<?php
$cne = $_GET['cne'];

$file = "Corrections/correction_cne-" . $cne . ".txt";

if(file_exists($file)){
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="'.basename($file).'"');
    readfile($file);
} else {
    echo "Fichier introuvable";
}
?>