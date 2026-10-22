<?php
if(isset($_POST['upload'])){

    $file = $_FILES['correction']['name'];
    $tmp = $_FILES['correction']['tmp_name'];

    move_uploaded_file($tmp, "Corrections/".$file);

    echo "Correction upload avec succès";
}
?>

<form method="POST" enctype="multipart/form-data">
    <input type="file" name="correction">
    <button type="submit" name="upload">Uploader</button>
</form>