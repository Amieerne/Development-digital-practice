<?php

$folder = "Devoirs/";
$files = scandir($folder);

foreach($files as $file){

    if($file != "." && $file != ".."){

        echo "<a href='download.php?file=$folder$file'>$file</a><br>";
    }
}

?>