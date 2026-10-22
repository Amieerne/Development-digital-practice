<?php

class Salarie {

    private $nom;
    private $salaire;

    // Constructeur
    public function __construct($nom, $salaire){
        $this->nom = $nom;
        $this->salaire = $salaire;
    }

    // Setter pour le salaire
    public function set_salaire($salaire){
        $this->salaire = $salaire;
    }

    // Getter pour le nom
    public function get_nom(){
        return $this->nom;
    }

    // Getter pour le salaire
    public function get_salaire(){
        return $this->salaire;
    }

    // Méthode pour afficher les infos
    public function afficher(){
        return "Employé : " . $this->get_nom() . " | Salaire : " . $this->get_salaire() . " DH \n";
    }

}
// Classe fille
class ChefChantier extends Salarie {

    private $prime = 1000;

    public function get_salaire(){
        $total = parent::get_salaire() + $this->prime;
        return $total;
    }

    public function afficher (){
        return "CHEF : " . $this->get_nom() . " | Total avec prime : " . $this->get_salaire() . " DH \n";
    }

}

// Test 
$s1 = new Salarie("Samir",4000);
$c1 = new ChefChantier("Yassine",7000);

// Affichage
echo  $s1->afficher() . "\n";
echo  $c1->afficher() . "\n";

// Modification du salaire via setter
$c1->set_salaire(8000);

// Affichage du nouveau salaire 
echo "Le nouveau salaire est :" . $c1->afficher();

?>