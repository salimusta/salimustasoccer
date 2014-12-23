package  {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event

	public class Top extends MovieClip{
		
		public var vitesse = 0
		/* top_mz from 0 to 2*/
		public var top_mx, top_my,top_mz, top_m :Number
		
		private var anx, any: Number
		public var top_vit: Number
		private var topShadow:MovieClip
		
		
		public var top_z: Number
		private var contact_filet:Boolean
		private var tps:int
		private var terrain, ind_balle:MovieClip
		private var filetm, filet: int
		private var balle_t:String
		private var sortiex, sortiey :Number
		
		public static var FROTTEMENT = 0.02
		private var topSize:Number
		
		public var top_rx, top_rmx:Number
		
		public function GetVit():Number{
			return top_vit
		}
		
		public function Top(_terrain:MovieClip) {
			topShadow = new TopShadow()
			
			Global.currentTerrain.addChild(topShadow)
			this.gotoAndStop(1)
			top_mx = top_my = top_mz = 0
			anx = this.x
			any = this.y
			top_vit = 0
			top_mz = 0
			top_z = 0
			
			top_rx = 0
			top_rmx = 0
			
			x = _terrain.ind_balle.x
			y = _terrain.ind_balle.y
			
			
			contact_filet = false
			tps = 0
			this.scaleX = this.scaleY = 0.2
			this.rotation = 0
			
			topSize = 0.1
			terrain = _terrain
			
			ind_balle = MovieClip(_terrain.getChildByName("ind_balle"))
			filetm = filet = 0
			addEventListener(Event.ENTER_FRAME, onEnterFrame)
			
			
		}
		private function onEnterFrame(pE:Event){
			MouvementBalle()
			
		}
		
		public function GetVitesseAbsolue():Number{
				return Math.sqrt((top_mz*top_mz)+(top_vit*top_vit))
		}
		
		private function MouvementBalle(){
			
			/*if(top_vit < 0){
				top_vit *=-1
				this.rotation += 180
				top_rmx*=-1
			}*/
			//Determination les mouvement de la balle	
			/*var noux = this.x
			var nouy = this.y
			top_mx = noux - anx
			top_my = nouy - any
			any = this.y
			anx = this.x
			top_m = Math.sqrt ( (top_mx * top_mx) + (top_my * top_my))
			*/
			//Transmission des mou de la balle
			this.x += Math.cos( Global.rad(this.rotation)) * top_vit	
			this.y += Math.sin( Global.rad(this.rotation)) * top_vit
			
			//effet de profondeur du ballon
			this.scaleX = topSize + (top_z)/1200
			this.scaleY = topSize + (top_z)/1200
			top_z += top_mz
			top_mz -= Top.FROTTEMENT*4//Attraction terrestre
			
			//Effet de ralentissement de la vitesse
			if(top_z == 0){
				if(top_vit > 0) top_vit -= Top.FROTTEMENT
				if(top_vit < 0) top_vit += Top.FROTTEMENT
				if(Math.abs(top_vit) < Top.FROTTEMENT * 3) top_vit = 0
			}
			
			top_rx += top_rmx
			//top_rmx -= Top.FROTTEMENT * 10
			
			if( top_rx > 360) top_rx -= 360
			if( top_rx < 0) top_rx += 360
			
			//gestion du ballon pour qu'il roule...
			var image = Math.round(1+(((this.type.totalFrames-1)/360) * top_rx))
			this.type.gotoAndStop(image)
			
			//Gestion de l'ombre du ballon
			topShadow.x = this.x + (top_z)
			topShadow.y = this.y + (top_z)/2
			topShadow.scaleX = 1 + (top_z)/50
			topShadow.scaleY = topShadow.scaleX
			//rebond
			if(top_z < 0){
				top_mz *= -0.5;
				if(Math.abs( top_mz )< Top.FROTTEMENT*7 ) top_mz = 0
				top_z = 0;
				//ind_balle.visible = false; //on cache lindice de rebon
				//if(Math.abs( top_mz )< 0.2 ) top_vit *=0.9
				
				if(top_mz != 0){
					//Effet de la vitesse sur la rotation
					var ideal_top_rmx = top_vit * 8
					
					//Effet de la rotation sur la vitesse
					var ideal_top_vit = top_rmx / 8
					
					top_vit = (top_vit + ideal_top_vit) / 1.3
					top_rmx = (top_rmx + ideal_top_rmx) / 4
					
				}else{
					top_rmx = top_vit * 4.5
					
				}
				
			}
			
		}
		
		private function onLoop(){
			if(Global.situation != "0") Global.pos = "0"
			
			if(Global.situation != "0" || Global.bloquer || Global.bloquer2) top_z = 0
			
			//CONDUITE de balle gestion du son?
			var conduite1, conduite:Number
			if((Global.conduite_balle && Global.pos.charAt(0) == "j") || Global.pos.charAt(0)=="o"){
				
				conduite1 += 0.12*1//_root.fx
				conduite = Math.abs( Math.cos(conduite1)*10)
				conduite += 15
				//if(_root.conduite <= 16) _root.rebond.start() //SON
				
			}else{
				conduite1 = Math.PI/2
				//if(_root.conduite_balle != "temp") _root.conduite=15
			}
			/*
			//DEtermination de la couleur de la balle
			if(Global.pos.charAt(0)=="o") Global.balle_t="ordi"
			if(Global.pos.charAt(0)=="j") Global.balle_t="joueur"
			*/
			
			//variable pour bouger la camera
			//_root.vite=top_m
			//if(Global.pos != "0") top_vit = top_m
			
			
			
			
			
			//_root.nivo._y=300-top_z Yok!
			
			//17: HAUTEUR DES BUTTTTTT
			//rebon de la balle em Z si elle est DANS ou DEHOR le but adverse  MANK PR L AUTRE BUT?????
			/*
			if(this.x > -100 && this.x < 100 && this.y < -500 && this.y > -540 && top_z > 16 && Global.situation == "but") {
				top_mz*=-1;
				top_z=16
			}
			if(this.x > -100 && this.x < 100 && this.y < -500 && this.y > -540 && top_z < 17 && Global.situation == "sortie") {
				top_mz*=-1;
				top_z=18
			}
			*/
			//HAUTEUR BALLE AFFICHE LAUTRE BALLON POUR LA PROFONDEUR
			/*
			if(top_z < 17) {
				terrain.topup.visible = false
				this.visible = true
			}else{
				terrain.topup.visible = true
				this.visible=false
			}
			terrain.topup.gotoAndStop(this.currentFrame)
			terrain.topup.type.gotoAndStop(this.type.currentFrame)
			terrain.topup.rotation = this.rotation
			terrain.topup.x = this.x
			terrain.topup.y = this.y
			terrain.topup.scaleX = this.scaleX
			terrain.topup.scaleY = this.scaleY
			*/
			//FILET on les remet en place
			/*
			if(Global.situation == "0")  {
				contact_filet = false
				terrain.but.rond1.scaleY = 1
				terrain.but.rond2.scaleY = 1
				terrain.but2.rond1.scaleY = 1
				terrain.but2.rond2.scaleY = 1
			}
			*/
			//FILLEETT
			/*
			if(contact_filet){  //&&_root.situation.charAt(0)=="b"
				if(top_z > 10) top_z = 10
				filetm -= 5
				if(this.x < -54) this.x = -54
				if(this.x > 54) this.x = 54
				if(this.y < 0){
					if(terrain.but.rond1.scaleY > 0){
						filet += filetm
						terrain.but.rond1.visible = true
					}else{
						terrain.but.rond1.visible = false
					}
		
					terrain.but.rond1.scaleY = terrain.but.rond2.scaleY = filet
					terrain.but.rond2.visible = terrain.but.rond1.visible
					
					this.y = -540-(terrain.but.rond1.scaleY / 7)
					
					terrain.but.rond2.scaleX = (54 - this.x) * 1.85
					terrain.but.rond1.scaleX = (54 + this.x) * 1.85
					
					if(filetm < 0 && terrain.but.rond1.visible == false) {
						contact_filet = false
						top_vit = filetm / -10
						this.rotation = 90
					}
				}else{	
				
					if(terrain.but2.rond1.scaleY > 0){
						filet += filetm
						terrain.but2.rond1.visible = true
					}else{
						terrain.but2.rond1.visible = false
					}
					
					terrain.but2.rond2.visible = terrain.but2.rond1.visible
					terrain.but2.rond1.scaleY = terrain.but2.rond2.scaleY = filet
					
					this.y = 540 + (terrain.but2.rond1.scaleY / 7)
					
					terrain.but2.rond2.scaleX = (54 + this.x) * 1.85
					terrain.but2.rond1.scaleX = (54 - this.x) * 1.85
					
					if(filetm < 0 && terrain.but2.rond1.visible == false) {
						contact_filet = false
						top_vit = filetm / -15
						this.rotation = -90
					}
				}
			}
			*/
			//LIMITATION DE LA LONGUEUR DES FILETS
			/*
			if(filetm < -200) {
				contact_filet = false
				filetm=0
				filet = 0
			}
			
			//BUT1
			if(this.y <= -505 && this.x >- 58 && this.x < 58 && top_z < 17 && Global.situation == "0")  {
				if(balle_t == "joueur") Global.situation = "but_joueur"
				else if(balle_t == "ordi") Global.situation = "but_joueur_c"
				top_mz *= -1
			}
			//FILET DES BUT 1
			if(this.y < -540 && this.x > -58 && this.x < 58 && contact_filet == false && top_z < 17 && Global.situation != "sortie"){
				contact_filet = true
				filet = 0
				filetm = top_m * 4
				//top_mz=0;top_z=0		
			}
			
			//BUT2
			if(this.y > 505 && this.x > -58 && this.x < 58 && top_z < 17 && Global.situation == "0")  {
				if(balle_t == "ordi") Global.situation = "but_ordi"
				else if(balle_t == "joueur") Global.situation = "but_ordi_c"
				top_mz *= -1
			}
			//FILET DES BUT 2
			if(this.y > 540 && this.x > -58 && this.x < 58 && contact_filet == false && top_z < 17){
				contact_filet = true
				filet = 0
				filetm = top_m * 4 //plus c for plu le filet se pli
				top_mz = 0
				top_z = 0	
			}
			*/
			//sortie
			/*
			if( (this.x < -325 || this.x > 325 || this.y < -505 || this.y > 505) && Global.situation == "0") Global.situation = "sortie"
			*/
			
			//GESTION DES LIMITES
			/*
			if(Global.situation == "sortie"){
				 Global.pos = "0"
				//TOUCHE
				if(this.x < -325 || this.x > 325){
					 sortiey = this.y
					 sortiex = this.x
					if(balle_t == "joueur") Global.situation = "touche_ordi"      
					else Global.situation = "touche_joueur"
				}else if(this.y < -500){
					if(balle_t == "joueur") Global.situation="sixmetres_ordi"
					else Global.situation="corner_joueur"
				}else if(this.y > 500){
					if(balle_t == "joueur") Global.situation = "corner_ordi"
					else Global.situation = "sixmetres_joueur"
				}
			}
			*/
			//Limite du ballon pr kil tape les mur, sauf si il est dsn les filet!!
			/*
			if(this.y > 550 && contact_filet == false){
				this.rotation = this.rotation * -1
				top_vit /= 2
				this.y = 550
			}else if(this.y < -550 && contact_filet == false) {
				top_vit /= 2
				this.y =- 550
				this.rotation = this.rotation*-1
			}else if(this.x > 360){
				top_vit /= 2 
				this.rotation = 180 - this.rotation
				this.x = 360
			}else if(this.x < -360) {
				this.rotation = 180 - this.rotation
				top_vit /= 2
				this.x = -360
			}
			*/
			
					
		}
	}
}
