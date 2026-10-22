<?php
$cne = $_GET['cne'];

$file = "Corrections/correction_cne-" . $cne . ".txt";

if(file_exists($file)){
    $content = file_get_contents($file);
    echo $content;
} else {
    echo "Aucune note trouvée";
}
?>