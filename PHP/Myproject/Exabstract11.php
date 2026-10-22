<?php 
// class mere 
abstract class AppareilGps {
    public $identifiant;
    
    Public function __construct($identifiant)
    {
        $this->identifiant = $identifiant;
    }

    abstract protected function activerSignal() : string ;
    abstract public function consommerEnergie($heures) : float ;
    
}
 
// class fille TrackerTeltonika
class TrackerTeltonika extends AppareilGps {
    private $capaciteBatterie;

    public function __construct($identifiant, $capaciteBatterie){
        parent::__construct($identifiant);
        $this->capaciteBatterie = $capaciteBatterie;
    }

    public function activerSignal() : string{
        return "Signal Teltonika active via protocole UDP";
    }

    public function consommerEnergie($heures, $modeEco = false):float {
        $resultat = $heures * 0.5;

        if($modeEco == True){
            $resultat = $resultat / 2;
        }

        return $resultat;
    }
}

// Classe fille TrackerSolaire
class TrackerSolaire extends AppareilGps {

    public function activerSignal() : string{
        return "Signal Solaire active via protocole LoRa";
    }

    public function consommerEnergie($heures) : float{
        return 0;
    }
   
}
// Création des objets
$telt = new TrackerTeltonika("TELT-001", 500);
$solar = new TrackerSolaire("SOLAR-99");

// Affichage signal
echo $telt->activerSignal() . "\n";
echo $solar->activerSignal() . "\n";

// Consommation normale
echo "Teltonika (10h) : " . $telt->consommerEnergie(10) . "\n";
echo "Solaire (10h) : " . $solar->consommerEnergie(10) . "\n";

// Mode Eco
echo "Teltonika ECO (10h) : " . $telt->consommerEnergie(10, true) . "\n";

?>