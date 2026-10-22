<?php
$etu = ["16643"=>["nom"=>"Achraf","prenom"=>"karimi"],
        "21324"=>["nom"=>"Ada","prenom"=>"nabili"],
        "39973"=>["nom"=>"Te","prenom"=>"hafidi"]
];

// 1 - Les étudiants dont le nom dépasse 3 lettres

echo "les étudiants dont le nom dépasse 3 lettres : \n";
foreach ($etu as $cne => $a)
    if (strlen($a["nom"]) > 3){
        echo $a["nom"] . "\n";
    }
// 2 - Les étudiants sous format CNE-X-Y
echo "format CNE" . "\n";
foreach ($etu as $cne => $a ){
    $X = substr($a["nom"], 0, 3);
    $Y = substr($a["prenom"], 0, 3);
    echo $cne . "-" . $X . "-" . $Y . "\n";
}

// 3 - 

echo "\n3- format noms/prenoms:\n";
foreach ($etu as $cne => $e) {
    $nom = strtoupper($e["nom"]);
    $prenom = ucfirst(strtolower($e["prenom"]));
    echo $nom . " " . $prenom . "\n";
}

// --- Complement ---
# 1 - Les étudiants nés durant le premier semèstre de l'année.

echo "1- nés au premier semestre:\n";
foreach ($etu as $cne => $e) {
    $mois = date("m", strtotime($e["date_naissance"]));
    if ($mois >= 1 && $mois <= 6) {
        echo $e["nom"] . " " . $e["prenom"] . "\n";
    }
}

# 2 - Afficher les cne, noms, prénoms et ages des étudiants.

echo "\n2- cne, nom, prenom, age:\n";
foreach ($etu as $cne => $e) {
    $age = date("Y") - date("Y", strtotime($e["date_naissance"]));
    echo $cne . " - " . $e["nom"] . " " . $e["prenom"] . " - " . $age . " ans\n";
}










?>