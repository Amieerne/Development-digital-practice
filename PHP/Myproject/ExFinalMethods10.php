<?php 

class livraison {
    
    public function seDeplacer(){
        echo "Le colis est en route ... \n";
    } 

    final function scellerColis(){
        echo "Application du sceau de securite DEV-2026 \n";
    }

}

class LivraisonCamion extends livraison {

    public function seDeplacer(){
        echo "Le camion roule sur l'autoroute \n";
    }

    /*final function scellerColis(){
        echo "On ferme juste la porte";
    }*/

}

class livraisonDrone extends livraison {
    
    public function seDeplacer(){
        echo "Le drone survole la ville.\n";
    }
}

$Lc = new LivraisonCamion ();
$Ld = new LivraisonDrone();

echo "Camion : \n";
$Lc->scellerColis();
$Lc->seDeplacer();

echo "Drone : \n";
$Ld->scellerColis();
$Ld->seDeplacer();

?>