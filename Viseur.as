package  {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event
	
	public class Viseur extends MovieClip
	{

		
		public function Viseur() {
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame)
			
			
		}
		private function onEnterFrame(pE:Event){
			
			SelectionJoueur()
			JoueurProcheBallon()
			
			if(Joueur.joueur_controle != -1){
				this.x = Global.joueurTab[Joueur.joueur_controle].x
				this.y = Global.joueurTab[Joueur.joueur_controle].y
				this.rotation += 5
				this.visible = true
			}else this.visible = false
			
			if(Global.situation == "engagement_joueur") Joueur.joueur_controle = 1
			
		}
		
		private function SelectionJoueur(){
			//selection du joueur le plu proche cen appuyan sur b
			if( Global.SelectionKey ){
				var i
				for(i = 0; i < Global.joueurTab.length; i++){
					var distance  = Global.distance(Global.joueurTab[i], Global.currentTop)
					
					if( Joueur.joueur_controle == -1 || distance < Global.distance(Global.joueurTab[Joueur.joueur_controle],  Global.currentTop)){
						if(Global.joueurTab[i].tacle == false){
							Joueur.joueur_controle = i
							//_root.ro=_root.ter[_root.joueur_controle]._rotation  //INITIALISATION DU ro PR LE CONTRLE
						}
					}
					
				}
			}
		}
		
		private function SelectionOrdi(){
			/*
			//determination de l'ordi le + proche de la baboule
			var target = (this.parent.ind_balle.visible == false)?Global.currentTop:this.parent.ind_balle
			
			var i:int
			for(i = 0; i <= 3; i++){
				var distance = Global.distance(Global.ordiTab[i], target)
				if(Ordi.ordi_controle == -1 || distance < Global.distance(Global.ordiTab[Ordi.joueur_controle], target)){
					if(Global.ordiTab[i].tacle == false){
						Ordi.ordi_controle = i
						//_root.ro=_root.ter[_root.joueur_controle]._rotation  //INITIALISATION DU ro PR LE CONTRLE
					}
				}
			}
			*/
		}
		
		private function JoueurProcheBallon(){
			var i:int
			for(i = 0; i < Global.joueurTab.length; i++){
				var distance  = Global.distance(Global.joueurTab[i], Global.currentTop)
				
				if( Joueur.joueur_proche == -1 || distance < Global.distance(Global.joueurTab[Joueur.joueur_proche],  Global.currentTop)){
					Joueur.joueur_proche = i
				}
			}
		}
		
		
		
	}
	
}
