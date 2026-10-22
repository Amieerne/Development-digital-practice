<?php
if($_SESSION['theme']=="dark"){

    echo '
    <link rel="stylesheet" href="dark.css">';

}else{

    echo ' <link rel="stylesheet" href="light.css">';
}
?>