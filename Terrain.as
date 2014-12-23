package  {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event
	import flash.events.KeyboardEvent
	 import flash.ui.Keyboard;

	public class Terrain extends MovieClip{
		
		private var top:MovieClip
		
		//private var joueur:Joueur
		
		public function Terrain() {
			addEventListener(Event.ENTER_FRAME, onEnterFrame)
			Global.currentTerrain = this
			top = new Top(this)
			addChild(top)
			
			Global.currentTop = top
			
			
			
			//var joueur = new Joueur()
			//addChild(joueur)
			
			
			
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
            this.stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			
			
		}
		
		private function keyDownHandler(event:KeyboardEvent):void {
            if(event.keyCode == Keyboard.UP)  Global.UpKey = true
            if(event.keyCode == Keyboard.DOWN)  Global.DownKey = true
			if(event.keyCode == Keyboard.LEFT)  Global.LeftKey = true
			if(event.keyCode == Keyboard.RIGHT)  Global.RightKey = true
			if(event.keyCode == 66)  Global.SelectionKey = true
			
        }

        private function keyUpHandler(event:KeyboardEvent):void {
            if(event.keyCode == Keyboard.UP)  Global.UpKey = false
			if(event.keyCode == Keyboard.DOWN)  Global.DownKey = false
			if(event.keyCode == Keyboard.LEFT)  Global.LeftKey = false
			if(event.keyCode == Keyboard.RIGHT)  Global.RightKey = false
			if(event.keyCode == 66)  Global.SelectionKey = false
        }
        
		
		private function onEnterFrame(pE:Event){
			But.tps++
			//_root.aaa=_root.situation
			//x et y sont les coordonne de la balle sur l ecran 550*400
			if(Global.situation == Global.BUT_ORDI){
			   //_root.joie("o0")
				
			   //camera_follow(5,1,"top")
				//auto_zoom("top",400)
				
			}else if(Global.situation == Global.BUT_JOUEUR){
				//_root.joie("j0")
				
				//camera_follow(5,1,"top")
				//auto_zoom("top",400)
			}else if(Global.situation == Global.EN_COURS /*|| Global.situation.charAt(0)=="e"*/){
				
				camera_follow(5, 1, Global.currentTop)
				auto_zoom(1)
				
			}
		}
		
		private function move_camera(_x:Number,_y:Number){
			this.x += _x
			this.y -= _y
		}
		
		private function camera_follow(vivesse:Number, distance:Number, cible:DisplayObject){
	
			var ciblex = repx_piste_to_ecran(cible.x + Math.cos(Global.rad(cible.rotation)) * top.vitesse * distance)
			var cibley = repy_piste_to_ecran(cible.y + Math.sin(Global.rad(cible.rotation)) * top.vitesse * distance)
			
			move_camera( ((Global.screenX/2)-ciblex)/vivesse , ((Global.screenY/2) - cibley)/ -vivesse)
		}
		
		private function auto_zoom(_scale_ideal:Number){
			
			//if(_scale_ideal < 20) _scale_ideal = 20
			if(this.scaleY < _scale_ideal - 0.01) zoom((_scale_ideal - this.scaleY)/10)
			if(this.scaleY > _scale_ideal + 0.01) zoom((_scale_ideal - this.scaleY)/10)
		}
		
		private function repx_piste_to_ecran(_x:Number){
			if(this.rotation == 180){
				return this.x - (_x * this.scaleX)
			}else{
				return this.x + (_x * this.scaleX)
			}
		}
		
		private function repy_piste_to_ecran(_y:Number){
			if(this.rotation==180){
				return this.y - (_y * this.scaleY)
			}else{
				return this.y + (_y * this.scaleY)
				
			}
		}
		private function repx_ecran_to_piste(_x:Number){
			if(this.rotation == 180){
				return (_x - this.x) / this.scaleX * -1
			}else{
				return (_x - this.x) / this.scaleX
			}
		}
		private function repy_ecran_to_piste(_y:Number){
			if(this.rotation==180){
				return (_y - this.y) / this.scaleY * -1
			}else{
				return (_y - this.y) / this.scaleY
			}
		}
		
		private function zoom(co:Number){
			var oldx = repx_ecran_to_piste(Global.screenX / 2)
			var oldy = repy_ecran_to_piste(Global.screenY / 2)
			this.scaleX = this.scaleY += co * this.scaleY
			
			this.x += (Global.screenX / 2) - repx_piste_to_ecran(oldx)
			this.y += (Global.screenY / 2) - repy_piste_to_ecran(oldy)
		}
		
		
		
	}

}



