<?php

trait TraitAlimentation
{
    public $etat;

    public function allumer()
    {
        echo "Appareil allumé\n";
    }

    public function eteindre()
    {
        echo "Appareil éteint\n";
    }
}

trait TraitConnexion
{
    public $wifi ;

    public function connecter()
    {
        echo "Connexion WiFi établie\n";
    }

    abstract public function afficherTypeConnexion():void;
}

class Appareil
{
    use TraitAlimentation, TraitConnexion;

    public function afficherTypeConnexion():void
    {
        echo "Type de connexion : WiFi\n";
    }
}

class SmartTV extends Appareil
{
    public function afficherTypeConnexion():void
    {
        echo "Type de connexion : WiFi + Ethernet\n";
    }

    public function changerChaine()
    {
        echo "Chaîne changée\n";
    }
}
// Appareil
$app = new Appareil();

$app->allumer();
$app->connecter();
$app->afficherTypeConnexion();

echo "\n";

// SmartTv
$tv = new SmartTV();

$tv->allumer();
$tv->connecter();
$tv->afficherTypeConnexion();
$tv->changerChaine();
$tv->eteindre();

?>