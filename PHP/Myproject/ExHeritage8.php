<?php

class Vehicule {

    public $modele;          
    protected $matricule;      
    private $codeMoteur;  

    public function __construct($modele, $matricule, $codeMoteur) {
        $this->modele = $modele;
        $this->matricule = $matricule;
        $this->codeMoteur = $codeMoteur;
    }

    protected function get_codeMoteur() {
        return $this->codeMoteur;
    }

    public function afficherInfos() {
        echo "Modèle : $this->modele | Matricule : $this->matricule\n";
    }
}

class utilitaire extends Vehicule {

    public function externaliser_codeMoteur(){
        return $this->get_codeMoteur();
    }

    public function afficher_Utilitaire(){
        echo "Modèle : $this->modele | Matricule : $this->matricule\n "; 
        echo " | CodeMoteur : " . $this->get_codeMoteur();  
    }

    // Test 
    function tenterAccesMoteur(){
        echo $this->codeMoteur;
    }
    // Il déclenche une erreur car la propriété est déclarée private dans la classe mère.
}

class Camion extends Vehicule {
    
    public $chargeUtile;

    public function afficher_camion(){
        echo "Modèle : $this->modele | Matricule : $this->matricule";
        echo " | CodeMoteur : " . $this->get_codeMoteur();
        echo " | ChargeUtile : $this->chargeUtile\n";
    }

    public function __construct($modele, $matricule, $codeMoteur, $chargeUtile) {
        parent::__construct($modele, $matricule, $codeMoteur);
        $this->chargeUtile = $chargeUtile;
    }

}

// créer utilitaire
$u1 = new utilitaire("Renault" ,"5511 - B - 20" , "V6");

// afficher code moteur
echo "CodeMoteur : " . $u1->externaliser_codeMoteur() . "\n";

// afficher infos
$u1->afficher_Utilitaire();

// créer camion
$c1 = new Camion("Man" , "6712 - C - 13" , "V12" , "25t");

// afficher infos camion
$c1->afficher_camion();

// Test 2
$monCamion->modele = "Volvo FMX";     // Cas A

$monCamion->matricule = "1234-A-40";  // Cas B

$monCamion->codeMoteur = "V8-TURBO";  // Cas C

# Cas A ne declanche pas une erreur car la propriete est declaree comme public.

# Cas B va declancher une erreur car la propriete est declaree comme protected donc elle n'est pas accessible a l'exterieur.

# Cas C va declancher une erreur car la propriete est declaree comme private dans la classe mere donc elle n'est pas accessible a l'exterieur.

?>