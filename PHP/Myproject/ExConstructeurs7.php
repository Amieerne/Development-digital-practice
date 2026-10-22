<?php
class Personne{
    // les proprietes 
    private $cne;
    private $nom;
    private $prenom;
    private $date_naissance;

    // Constantes
    Public const ISTA = "ISTA Errachidia";

    // Constructeur (Question 1)
    public function __construct($cne, $nom, $prenom, $date_naissance){
        $this->cne = $cne;
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->date_naissance = $date_naissance;
    }

    public function set_date_naissance($val){
        $this->date_naissance = $val;
    }
    public function get_date_naissance(){
        return $this->date_naissance;
    }

    // Accesseurs (Question 3)
    public function get_cne(){
        return $this->cne;
    }

    public function get_nom(){
        return $this->nom;
    }

    public function get_prenom (){
        return $this->prenom;
    }


    // La methode afficher qui affiche toutes les informations du stagiare
    public function afficher(){
    return "CNE : " . $this->get_cne() . "<br>" .
           "Nom : " . $this->get_nom() . "<br>" .
           "Prenom : " . $this->get_prenom() . "<br>" .
           "Date de naissance : " . $this->get_date_naissance() . "<br>" .
           "Etablissement : " . $this::ISTA . "<br>";
    } 

    // Fonction pour calcule d'age 
    public function renvoyer_age(){
    $date_naissance = new DateTime($this->date_naissance);
    $date_actuelle = new DateTime();

    $age = date_diff($date_actuelle,$date_naissance);

    return $age->format("%y");
    }
}

// Tableau de 10 stagiaire (Question 2)
$tab = [
    new Personne("CNE1","ahmed","nabili","2001-08-25"),
    new Personne("CNE2","amine","karimi","2010-03-22"),
    new Personne("CNE3","sara","hafidi","2005-01-10"),
    new Personne("CNE4","hamid","maliki","2011-08-13"),
    new Personne("CNE5","manal","tahiri","2000-06-14"),
    new Personne("CNE6","mohamed","smaili","2009-04-02"),
    new Personne("CNE7","karim","alaoui","2001-08-09"),
    new Personne("CNE8","ali","madani","2002-02-22"),
    new Personne("CNE9","houssam","safi","2001-05-27"),
    new Personne("CNE10","akram","faridi","2003-07-18")
];

// Les informations des stagiaires ages de plus de 19 ans  (array_filter)
$sgt = array_filter($tab, function($s){
    return $s->renvoyer_age() > 19;
});

// Afficher les ages de tous les stagiaires (array_map)

$ages = array_map(function($s){
    return $s->renvoyer_age();
}, $tab);


# Affichage
echo "Stagiaires > 19 ans :" . "" . "\n";
foreach($sgt as $s){
    echo $s->afficher() . "\n";
}

echo "Ages de tous les stagiaires :" . "\n";
print_r($ages);
?>