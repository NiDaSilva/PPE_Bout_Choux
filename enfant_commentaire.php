<?php
session_start();
include_once('class/autoload.php');


$site = new page_base_securisee_personnel('Ajout famille');
$site->js='jquery.validate.min';
$site->js='messages_fr';
$site->js='jquery.tooltipster.min';
$site->style='tooltipster';
$site->style='perso';


	if(isset($_SESSION['id']) && isset($_SESSION['type'])){
		if ($_SESSION['type']=='famille'){
					echo 'accés refuser';
		}
		if ($_SESSION['type']=='personnel'){
			$site = new page_base_securisee_personnel('Accueil');
			


		}
		if ($_SESSION['type']=='admin'){
			$site = new page_base_securisee_admin('Accueil');
			echo 'accés refuser';
		}
	}

			$controleur=new controleur();
			$site-> left_sidebar=$controleur->retourne_formulaire_liste_commentaire();
			$site-> right_sidebar=$site-> rempli_right_sidebar();
			

$site->affiche();
?>