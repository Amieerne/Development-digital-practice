<?php

$commandes = [
  ["client"=>"Ali", "montant"=>1200, "statut"=>"valide"],
  ["client"=>"Sara", "montant"=>800, "statut"=>"en_attente"],
  ["client"=>"Yassine", "montant"=>1500, "statut"=>"valide"],
  ["client"=>"Lina", "montant"=>400, "statut"=>"annule"]
];

# 1 - Ajouter Omar
array_push($commandes, ["client"=>"Omar", "montant"=>950, "statut"=>"valide"]);

# 2 - Commandes validées
$valides = array_filter($commandes, function($c){
    return $c["statut"] == "valide";
});

# 3 - Noms des clients (validées)
$noms_valides = array_map(function($c){
    return $c["client"];
}, $valides);

# 4 - Fusion des listes
$nouvelles = [
  ["client"=>"Imane", "montant"=>2000, "statut"=>"valide"]
];

$commandes = array_merge($commandes, $nouvelles);

# 5 - Vérifier si Sara existe
$tous_clients = array_map(function($c){
    return $c["client"];
}, $commandes);

$existe_sara = in_array("Sara", $tous_clients);

# 6 - Réindexer les commandes validées
$valides = array_values($valides);

# 7 - Tableau des montants validés
$montants = array_map(function($c){
    return $c["montant"];
}, $valides);

?>