package  {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event
	
	public class Joueur extends Footballeur
	{
		public static var joueur_controle:int = -1
		public static var joueur_proche:int = -1
		private var joueurIndex:int
		
		
		public function Joueur() {
			this.scaleX = this.scaleY = 0.2
			joueurIndex = Global.joueurTab.length
			this.name = "j" + joueurIndex
			Global.joueurTab.push(this)
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame)
			
			
			
		}
		private function onEnterFrame(pE:Event){
			if( Joueur.joueur_controle == joueurIndex) controle_rot()
			//else joueurLibre()
			Comportement()
			Conduite_Balle()
			Collision_Balle()
		}
		
		private function Collision_Balle(){
			//CONTACT AVEC LA BALLE
			if((this.c.hitTestObject(Global.currentTop)) && (Global.currentTop.top_z < 10) && this.currentFrame == 1 && 
			  Global.bloquer == false && Global.bloquer2 == false && Global.situation == "0"){
				if(Global.currentTop.top_vit < 8) Global.pos = this.name
				else{
					Global.currentTop.top_vit /= 3
					Global.currentTop.rotation += 180 - Math.random()*360
					//poitrine.start() //SON
				}	
				Global.balle_t = "joueur"
			}
		
		}
		
		private function Conduite_Balle(){
			//CONDUITE DE BALLE
			if(Global.pos == this.name){
				var conduite = 20
				Global.currentTop.y = this.y - (Math.cos( Global.rad(this.rotation) ) * conduite)
				Global.currentTop.x = this.x+(Math.sin(Global.rad(this.rotation)) * conduite)
				Global.currentTop.rotation = this.rotation-90
			}
		}
		
		private function controle_rot(){
			
			if (Global.UpKey) {
				if(vit < 4) vit += 0.5
				avance = true
				Global.conduite_balle = true
				
			}else if ( Global.DownKey) {
				if(vit > -2) vit -= 0.5
				avance = true
				if(Global.pos == this.name) Global.pos = "0"
				
			}else if(tacle == false){
				if(vit > 0) vit -= 0.8
				if(vit < 0) vit += 0.8
				if(vit < 0.8) vit = 0
			}
			if (Global.RightKey) this.rotation += 7  
			if (Global.LeftKey) this.rotation -= 7
			
		}
		
		function Comportement(){
			//Etats possibles du joueur
			if( tacle ){
				//tacle(nom)
			}else if( chute ){
				//chute2(nom)
			}else if( pre_chute ){
				chute()
				vit = 4
				Global.pos = "0"
				tps = 0
			}else if( centre ){
				if(j1.scaleY >= 0.9) {
					centre = false
					if( Global.pos == this.name) {
						Global.currentTop.top_vit = (pui / 2) + 2
						Global.currentTop.top_mz = ((pui / 10) + 0.4)
						Global.pos = "0"
						//tir.start() SON
						//indice_balle()
						tps = 0
					}
					pui = 0
				}
				//jambe_tir()
			}else if( pre_centre ){
				if( Global.CentreKey )  pui++
				//lever_jambe()
				if(pui >= 10 || Global.CentreKey == false){
					pre_centre = false
					centre = true
				}
			}else if( passe ){
				if(j1.scaleY < 0.5){
					//jambe_passe()
				}else{
					Global.situation = "0"
					passe = false
					pre_passe = false
					if(Global.pos == this.name) {
						Global.currentTop.top_vit = 7
						tps = 0
						Global.pos = "0"
						//passe.start() SON
						pg.rotation = 0
						Global.currentTop.x += Math.cos( Global.rad(this.rotation)) * 2
						Global.currentTop.y += Math.sin( Global.rad(this.rotation)) * 2
					}
				}
			}else if( pre_passe ){
				//lever_jambe()
				if(j1.scaleY < -0.8) {
					passe = true
					pre_passe = false
				}
				
			}else if( tir ){
				if(j1.scaleY >= 0.5) {
					tir = false
					if(Global.pos == this.name) {
						if(pui < 3) {
							pui = 7
						}else{
							if(pui < 5) Global.currentTop.top_mz = 0
							else  Global.currentTop.top_mz = pui / 10
						}
						Global.currentTop.top_vit = pui + 4
						Global.pos = "0"
						//tir.start() SON
						tps = 0
					}
					pui = 0
				}
				//jambe_tir()
				
			}else if( pre_tir ){
				if(Global.TirKey)  pui++
				//lever_jambe()
				if( pui >= 10 || Global.TirKey == false ){
					pre_tir = false
					tir = true
				}	
			}else if( avance ){	
				Marcher()
				if(vit < 1) avance = false
			}else{
				//_root["a"+nom]=-1
				Repos()
			}
		}
	}
	
}
/*onClipEvent (enterFrame) {
	_root.membres(this._name)
	 if(_root.joueur_controle==this._name) _root.controle(this._name)
	 else _root.libre(this._name)		

	_root.commun()

}
onClipEvent (load) {
	_root.init(this._name)

}*/