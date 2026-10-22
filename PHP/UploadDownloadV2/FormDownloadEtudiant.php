<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="style.css">
  <title>Download files</title>
</head>
<body>
  <a href="menu.html" style="color:#fff; text-decoration:none; background:#2c3e50; padding:6px 12px; border-radius:4px;">Retour au menu</a><br><br>
  <?php
    $dir = 'C:\xampp\htdocs\UploadDownloadV2\Corrections';
    $files = scandir($dir);
    $filesOnly = array_diff($files, ['.','..']);
    echo '<h3> Liste de fichiers à télécharger : </h3>';
    echo '<ul>';
    foreach($filesOnly as $file){
      echo '<li><a href="logicDownload.php?path='. $dir. '/' .$file . '">'. $file . '</a></li>';
    }
    echo '</ul>';
  ?>
</body>
</html>