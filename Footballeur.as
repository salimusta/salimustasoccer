package  {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event
	
	public class Footballeur extends MovieClip
	{

		public var vit:Number
		public var avance, tacle, chute, centre, passe, tir:Boolean
		public var pre_centre, pre_passe, pre_tir, pre_chute:Boolean
		public var pui:Number
		public var tps:Number
		private var a : Number
		private var initBrasY:Number
		
		public function Footballeur() {
			avance = tacle = chute = centre = passe = tir = false
			pre_centre = pre_passe = pre_tir = pre_chute = false
			vit = 0
			tps = 0
			pui = 0
			a = 0
			initBrasY = bg.y
			addEventListener(Event.ENTER_FRAME, onEnterFrame)
			
		}
		
		private function onEnterFrame(pE:Event){
			Membres()
		}
		public function Repos(){
			var coef = 5
			if(bg.scaleY > 0) bg.scaleY -= 0.03 * coef
			if(bg.scaleY < 0) bg.scaleY += 0.03 * coef
			if(bd.scaleY > 0) bd.scaleY -= 0.03 * coef
			if(bd.scaleY < 0) bd.scaleY += 0.03 * coef
			if(j1.scaleY > 0.2) j1.scaleY -= 0.016 * coef
			if(j1.scaleY < 0.2) j1.scaleY += 0.016 * coef
			if(j2.scaleY > 0.2) j2.scaleY -= 0.015 * coef
			if(j2.scaleY < 0.2) j2.scaleY += 0.015 * coef
			if(corps.rotation > 0) corps.rotation -= 2 * coef
			if(corps.rotation < 0) corps.rotation += 2 * coef
			pg.rotation = 0
			bg.rotation = 45
			bd.rotation = 180
			
			a = Math.PI/2
		}
		private function Membres(){
			//Attribution des coordonnees
			this.x += vit * Math.sin(Global.rad(this.rotation))
			this.y -= vit * Math.cos(Global.rad(this.rotation))
		
			//LES PIEDS
			pg.y = 10 + (j1.scaleY * -64)
			if(j1.scaleY > 0){
				pg.gotoAndStop(1)
				pg.scaleY = 1
			}
			if(j1.scaleY < 0){
				pg.gotoAndStop(2)
				pg.scaleY = -1
			}
			pd.y= 10 + (j2.scaleY * -64)
			if(j2.scaleY > 0){
				pd.gotoAndStop(1)
				pd.scaleY = 1
			}
			if(j2.scaleY < 0){
				pd.gotoAndStop(2)
				pd.scaleY = -1
			}
			//LES BRAS
			bd.y = initBrasY + corps.rotation * 2
			bg.y = initBrasY - corps.rotation * 2
			
			corps.tete.y = corps.rotation * -0.5
		}
		
		public function Marcher(){
			bg.scaleY = 0.1 + Math.cos(a)
			bd.scaleY = 0.1 + Math.sin(a-2)
			j1.scaleY = 0.1 + Math.sin(a-2)
			j2.scaleY = 0.1 + Math.cos(a) * 1.2
			corps.rotation = Math.cos(a) * 10
			bg.rotation = 0; bd.rotation = 180
			a += vit / 13
		}
		/*public function chute(nom){
			if(bd.scaleY<140) bd.scaleY+=40
			if(bg.scaleY<140) bg.scaleY+=40
			else {_root["chute"+nom]=true;scaleY=12}
			bg.rotation=0
			bd.rotation=0
			if(j1.scaleY>-150) j1.scaleY-=60
			if(j2.scaleY>-150) j2.scaleY-=60
			
		}
		public function lever_jambe(nom){
				if(corps.rotation<10) corps.rotation+=8
				if(bd.rotation>-20) bd.rotation+=20
				if(bd.scaleY<100) bd.scaleY+=40
				if(bg.scaleY<110) bg.scaleY+=40
				if(bg.rotation<50) bg.rotation+=20
				if(j1.scaleY>-100) j1.scaleY-=80
		}
	
		public function jambe_tir(nom){
			if(corps.rotation>-10) corps.rotation-=2
				if(j1.scaleY<150) j1.scaleY+=40
				if(bg.rotation>-50) bg.rotation-=15
				if(bd.rotation<20) bd.rotation-=5
				if(j2.scaleY>-100) j2.scaleY-=10
		}
		public function jambe_passe(nom){
			if(corps.rotation>-10) corps.rotation-=2
			if(j1.scaleY<140) j1.scaleY+=50
			if(bg.rotation>-50) bg.rotation-=15
			if(bd.rotation<20) bd.rotation-=5
			if(j2.scaleY>-100) j2.scaleY-=20
			pg.rotation=-45
		
		}
		public function tacle(nom){
			if(_currentFrame==1) { _root["vit"+nom]=5;  scaleY=7;  gotoAndStop(2) }	
			if(scaleY<14) scaleY++
			if(_root["vit"+nom]>1) _root["vit"+nom]-=0.2
			else { _root["tacle"+nom]=false;  gotoAndStop(1) }
		}
		public function chute2(nom){
			if(_root["vit"+nom]>0) _root["vit"+nom]-=0.5
			if(scaleY<14) scaleY++
			gotoAndStop(3)
			if( _root["tps"+nom]>=20) {_root["chute"+nom]=false;gotoAndStop(1);_root["pre_chute"+nom]=false}
		}*/
	

	}
	
}
