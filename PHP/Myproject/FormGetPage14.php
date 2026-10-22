<!DOCTYPE html>
<html>
<head>
    <title>Form</title>
</head>
<body>

<h2>Inscription Bootcamp</h2>

<form method="GET" action="Traitement14.php">

    <label>Identifiant :</label>
    <input type="text" name="fid"><br><br>

    <label>Nom complet :</label>
    <input type="text" name="fnom"><br><br>

    <label>Date d'inscription :</label>
    <input type="date" name="fdate"><br><br>

    <fieldset>
        <legend>Niveau :</legend>

        <input type="radio" name="fniveau" value="Débutant"> Débutant<br>
        <input type="radio" name="fniveau" value="Intermédiaire"> Intermédiaire<br>
        <input type="radio" name="fniveau" value="Avancé"> Avancé<br>
    </fieldset><br>

    <fieldset>
        <legend>Technologies :</legend>

        <input type="checkbox" name="fhtml" value="HTML/CSS"> HTML/CSS<br>
        <input type="checkbox" name="fjs" value="JavaScript"> JavaScript<br>
        <input type="checkbox" name="fphp" value="PHP"> PHP<br>
    </fieldset><br>

    <label>Ville :</label>
    <select name="fville">
        <option value="Casablanca">Casablanca</option>
        <option value="Rabat">Rabat</option>
        <option value="Meknès">Meknès</option>
        <option value="Fès">Fès</option>
    </select><br><br>

    <label>Motivation :</label><br>
    <textarea name="fmotivation"></textarea><br><br>

    <input type="submit" value="Envoyer">

</form>

</body>
</html>