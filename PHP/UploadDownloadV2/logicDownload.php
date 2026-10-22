
<?php
if(isset($_GET['path']))
{
$file = $_GET['path'];
if (file_exists($file)) {
    header('Content-Type: application/octet-stream'); 
    header('Content-Disposition: attachment; filename="'.basename($file).'"');
    readfile($file); 
}
else{
    echo 'File not found';
}
}
?>
