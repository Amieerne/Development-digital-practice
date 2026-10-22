<?php 

interface IAllumable {
    public function allumer();
    public function eteindre();
}

interface IConnectable{
    public function connecterWifi();
    public function deconnecterWifi();
}

class Lampe implements IAllumable{
    public $marque ;

    public function __construct($marque)
    {
        $this->marque = $marque ;
    }

    public function allumer(){
        echo "Lampe allumée\n";
    }

    public function eteindre(){
        echo "Lampe éteinte\n";
    }

    public function afficherMarque(){
        echo "Marque : " . $this->marque . "\n";
    }
}

class SmartLampe extends Lampe implements IConnectable {

    public function connecterWifi(){
        echo "SmartLampe connectée au WiFi\n";
    }

    public function deconnecterWifi(){
        echo "SmartLampe déconnectée du WiFi\n";
    }

    public function changerCouleur(){
        echo "Couleur changée\n";
    }
}

$l1 = new Lampe("Philips");
$l1->afficherMarque();
$l1->allumer();
$l1->eteindre();

$s1 = new SmartLampe("Xiaomi");
$s1->afficherMarque();
$s1->allumer();
$s1->connecterWifi();
$s1->changerCouleur();
$s1->deconnecterWifi();
$s1->eteindre();

?>