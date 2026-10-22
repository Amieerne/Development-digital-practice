<?php
class Personne{
    // les proprietes 
    private $cne;
    private $nom;
    private $prenom;
    private $date_naissance;

    // Constantes
    Public const ISTA = "ISTA Errachidia";

    // Accesseurs & Mutateurs cne
    public function  set_cne($val){
        $this->cne = $val;
    }

    public function get_cne(){
        return $this->cne;
    }

    // Accesseurs & Mutateurs de nom
    public function  set_nom($val){
        $this->nom = $val;
    }

    public function get_nom(){
        return $this->nom;
    }

    // Accesseurs & Mutateurs de prenom
    public function  set_prenom($val){
        $this->prenom = $val;
    }

    public function get_prenom (){
        return $this->prenom;
    }

    // Accesseurs & Mutateurs de date_naissance
    public function  set_date_naissance($val){
        $this->date_naissance = $val;
    }

    public function get_date_naissance(){
        return $this->date_naissance;
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

// Tableau de 10 stagiaire 

$tab = [];

// Stagiaire 1
$s1 = new Personne();
$s1->set_cne("CNE1");
$s1->set_nom("ahmed");
$s1->set_prenom("nabili");
$s1->set_date_naissance("2001-08-25");
$tab[] = $s1;

// Stagiaire 2
$s2 = new Personne();
$s2->set_cne("CNE2");
$s2->set_nom("amine");
$s2->set_prenom("karimi");
$s2->set_date_naissance("2010-03-22");
$tab[] = $s2;

// Stagiaire 3
$s3 = new Personne();
$s3->set_cne("CNE3");
$s3->set_nom("sara");
$s3->set_prenom("hafidi");
$s3->set_date_naissance("2005-01-10");
$tab[] = $s3;

// Stagiaire 4
$s4 = new Personne();
$s4->set_cne("CNE4");
$s4->set_nom("hamid");
$s4->set_prenom("maliki");
$s4->set_date_naissance("2011-08-13");
$tab[] = $s4;

// Stagiaire 5
$s5 = new Personne();
$s5->set_cne("CNE5");
$s5->set_nom("manal");
$s5->set_prenom("tahiri");
$s5->set_date_naissance("2000-06-14");
$tab[] = $s5;

// Stagiaire 6
$s6 = new Personne();
$s6->set_cne("CNE6");
$s6->set_nom("mohamed");
$s6->set_prenom("smaili");
$s6->set_date_naissance("2009-04-02");
$tab[] = $s6;

// Stagiaire 7
$s7 = new Personne();
$s7->set_cne("CNE7");
$s7->set_nom("karim");
$s7->set_prenom("alaoui");
$s7->set_date_naissance("2001-08-09");
$tab[] = $s7;

// Stagiaire 8
$s8 = new Personne();
$s8->set_cne("CNE8");
$s8->set_nom("ali");
$s8->set_prenom("madani");
$s8->set_date_naissance("2002-02-22");
$tab[] = $s8;

// Stagiaire 9
$s9 = new Personne();
$s9->set_cne("CNE9");
$s9->set_nom("houssam");
$s9->set_prenom("safi");
$s9->set_date_naissance("2001-05-27");
$tab[] = $s9;

// Stagiaire 10
$s10 = new Personne();
$s10->set_cne("CNE10");
$s10->set_nom("akram");
$s10->set_prenom("faridi");
$s10->set_date_naissance("2003-07-18");
$tab[] = $s10;


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