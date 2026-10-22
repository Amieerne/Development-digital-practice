<?php 

// Creation de la classe 

class Stagiaire{

    public $cne ;
    public $nom;
    public $prenom ;
    public $date_naissance;

    // Afficher nom , prenom 
     public function nom_complet(){
        return $this->nom . " " . $this->prenom;
    }

     public function renvoyer_age(){
        $date_naissance = new DateTime($this->date_naissance);
        $date_actuelle = new DateTime();

        $age = date_diff($date_naissance, $date_actuelle);

        return $age->format("%y");
    }
}

// Autre Methode h

$s1 = new Stagiaire();
$s2 = new Stagiaire();
$s3 = new Stagiaire();
$s4 = new Stagiaire();
$s5 = new Stagiaire();
$s6 = new Stagiaire();
$s7 = new Stagiaire();
$s8 = new Stagiaire();
$s9 = new Stagiaire();
$s10 = new Stagiaire();

$tab = [$s1,$s2,$s3,$s4,$s5,$s6,$s7,$s8,$s9,$s10];

// Stagiaire 1
$s1->cne = "CNE1";
$s1->nom = "ahmed";
$s1->prenom = "nabili";
$s1->date_naissance = "2001-08-25";

// Stagiaire 2
$s2->cne = "CNE2";
$s2->nom = "amine";
$s2->prenom = "karimi";
$s2->date_naissance = "2003-03-22";

// Stagiaire 3
$s3->cne = "CNE3";
$s3->nom = "sara";
$s3->prenom = "hafidi";
$s3->date_naissance = "2005-01-10";

// Stagiaire 4
$s4->cne = "CNE4";
$s4->nom = "hamid";
$s4->prenom = "maliki";
$s4->date_naissance = "2004-08-13";

// Stagiaire 5
$s5->cne = "CNE5";
$s5->nom = "manal";
$s5->prenom = "tahiri";
$s5->date_naissance = "2000-06-14";

// Stagiaire 6
$s6->cne = "CNE6";
$s6->nom = "mohamed";
$s6->prenom = "smaili";
$s6->date_naissance = "2008-04-02";

// Stagiaire 7
$s7->cne = "CNE7";
$s7->nom = "karim";
$s7->prenom = "alaoui";
$s7->date_naissance = "2001-08-09";

// Stagiaire 8
$s8->cne = "CNE8";
$s8->nom = "ali";
$s8->prenom = "madani";
$s8->date_naissance = "2002-02-22";

// Stagiaire 9
$s9->cne = "CNE9";
$s9->nom = "houssam";
$s9->prenom = "safi";
$s9->date_naissance = "2001-05-27";

// Stagiaire 10
$s10->cne = "CNE10";
$s10->nom = "akram";
$s10->prenom = "faridi";
$s10->date_naissance = "2003-07-18";



// 3 - afficher noms complets
echo "Noms complets :\n";
foreach($tab as $s){
    echo $s->nom_complet() . "\n";
}

// 4 - stagiaires les plus agés
$max_age = 0;

// trouver age max
foreach($tab as $s){
    if($s->renvoyer_age() > $max_age){
        $max_age = $s->renvoyer_age();
    }
}

// afficher les plus agés
echo "\nStagiaires les plus agés :\n";
foreach($tab as $s){
    if($s->renvoyer_age() == $max_age){
        echo $s->nom_complet() . " - " . $s->renvoyer_age() . " ans\n";
    }
}

?>