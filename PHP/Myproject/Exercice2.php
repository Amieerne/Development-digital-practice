<?php

// 1 - Creation du tableau 

$t = ["Karimi" => [18,16,19] , "Nabili" => [17,18,20] , "Hafidi" => [19,20,18]];

// 2 - La note maximale du dernier élève

$m = $t["Hafidi"][0];
for ($i = 0 ; $i < count($t["Hafidi"]); $i++){
    if ($m < $t["Hafidi"][$i]) {
        $m = $t["Hafidi"][$i];
    }
}
echo $m ;

// 3 - Les moyennes générales de tous les élèves

foreach ($t as $nom => $notes) {
    $s = 0;
    for ($i = 0; $i < count($notes); $i++) {
        $s = $s + $notes[$i];
    }
    $moyenne = $s / count($notes);
    echo $nom . " : " . $moyenne . "\n";
}

// 4 - tableau qui associe à chaque étudiant défini par son CNE ...

$etu = [
    "98262" => ["nom"=>"Karimi" , "prenom"=>"Achraf" , "date_naissance"=>"2006-05-22" , "moyenne_bac"=>16.5],
    "25000" => ["nom"=>"Nabili" , "prenom"=>"Sara" , "date_naissance"=>"2005-03-15" , "moyenne_bac"=>15.8],
    "12987" => ["nom"=>"Hafidi" , "prenom"=>"Youssef" , "date_naissance"=>"2006-09-12" , "moyenne_bac"=>17.1]
];
echo "Debut";

// 5 - La moyenne de l'étudiant ayant le CNE 25000

echo $etu["25000"]["moyenne_bac \n"];

// 6 - Tri des étudiants par ordre de mérite 

$etu = [
    "98262" => ["nom" => "Karimi", "moyenne_bac" => 16.5],
    "25000" => ["nom" => "Nabili", "moyenne_bac" => 15.8],
    "12987" => ["nom" => "Hafidi", "moyenne_bac" => 17.1],
    "55432" => ["nom" => "Zahidi", "moyenne_bac" => 14.2],
    "88120" => ["nom" => "Bennani", "moyenne_bac" => 18.45], 
    "44001" => ["nom" => "Tazi", "moyenne_bac" => 12.0],
    "33988" => ["nom" => "Mansouri", "moyenne_bac" => 15.75], 
    "11223" => ["nom" => "Idrissi", "moyenne_bac" => 16.5],  
    "77654" => ["nom" => "Amrani", "moyenne_bac" => 10.5],  
    "66543" => ["nom" => "Alaoui", "moyenne_bac" => 19.1]    
];

$etu2 = [];

while (count($etu) > 0) {
    $max_key = null;
    
    foreach ($etu as $key => $details) {
        // Si c'est le premier de la liste ou s'il est plus grand que le max actuel
        if ($max_key === null || $details["moyenne_bac"] > $etu[$max_key]["moyenne_bac"]) {
            $max_key = $key;
        }
    }
    
    // On a trouvé le VRAI plus grand de ce tour
    $etu2[$max_key] = $etu[$max_key];
    
    // On le retire pour ne plus le comparer au prochain tour
    unset($etu[$max_key]);
}

$etu = $etu2;

print_r($etu);

?>