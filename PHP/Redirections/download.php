<?php

if(isset($_POST['telechargerDevoirs'])){

    $dir = "devoirs";

    $files = scandir($dir);

    $filesOnly = array_diff($files, ['.','..']);

    echo "<h3>Liste des devoirs :</h3>";

    foreach($filesOnly as $file){

        echo '<a href="traitementDownload.php?path='.$dir.'/'.$file.'">'.$file.'</a><br>';
    }
}

?>

<form method="POST">

    <button type="submit" name="telechargerDevoirs">
        Télécharger Devoirs
    </button>

</form>