<?php
class page_base_securisee_personnel extends page_base {

	public function __construct($p) {
		parent::__construct($p);
	}
	public function affiche() {
		
		parent::affiche();
		
	}
	public function affiche_menu() {

		parent::affiche_menu();
		?>

			<li><a href="">Gestion des enfants </a>
				<ul>
							<li><a href="ajout_progres.php">Ajouter progrès</a></li>
							<li><a href="enfant_commentaire.php">Consulter les commentaire d'un enfant</a></li>
				</ul>
			</li>
	
		<?php 

	}
}
