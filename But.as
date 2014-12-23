package  {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event


	public class But extends MovieClip{
		
		private var top:MovieClip
		private var hauteur:Number
		static public var tps:int = 0
		
		public function But() {
				
				hauteur = 50
				//Poteau 1
				var poteau = new Poteau()
				this.parent.addChild(poteau)
				poteau.scaleY = poteau.scaleX = 0.073
				poteau.y = this.y
				poteau.x = this.x - (this.barre.width / 2) + (poteau.width / 2)
				poteau.hauteur = hauteur
				poteau.alpha = 0.4
				
				//Poteau 2
				poteau = new Poteau()
				this.parent.addChild(poteau)
				poteau.scaleY = poteau.scaleX = 0.073
				poteau.y = this.y
				poteau.x = this.x + (this.barre.width / 2) - (poteau.width / 2)
				poteau.hauteur = hauteur
				poteau.alpha = 0.4
				
				addEventListener(Event.ENTER_FRAME, onEnterFrame)
		}
		
		private function onEnterFrame(pE:Event){
			if(top == null && Global.currentTop != null) top = Global.currentTop
			
			if(top != null) CollisionBarre()
		}
		
		//rebon de la balle em Z si elle est DANS ou DEHOR le but adverse  MANK PR L AUTRE BUT?????
	/*if(this._x>-100&&this._x<100&&this._y<-500&&this._y>-540&&top_z>16&&_root.situation=="but") {top_mz*=-1;top_z=16}
	if(this._x>-100&&this._x<100&&this._y<-500&&this._y>-540&&top_z<17&&_root.situation=="sortie") {top_mz*=-1;top_z=18}
	*/
		private function CollisionBarre(){
				
				var collisionLargeur:Boolean = top.x > this.x - this.width / 2 || top.x < this.x + this.width / 2
				
				var fdx = top.y - this.y
				var fdy = top.top_z - hauteur
				var distance = Math.sqrt((fdx*fdx)+(fdy*fdy))
				
			
				//trace("distance = " +distance)
				var testingTopHeight = top.height
				if( distance < (this.barre.height / 2) + (testingTopHeight / 2) && collisionLargeur && But.tps > 10 ){
						trace("COLLISION BARRE " + top.top_z)
						trace("(this.barre.height / 2) = " + (this.barre.height / 2))
						trace("(top.height / 2) = " + (testingTopHeight / 2))
						trace("distance = " + distance)
						
						var angle = Math.atan( (top.top_z - hauteur) / Math.abs(top.y - this.y) )
						angle = angle * 180 / Math.PI
						
						if( Math.abs(angle) < 45){
								trace("COLLISION FACE")
								top.rotation = top.rotation * -1
								var difZ = top.top_z - hauteur
								trace("difZ = " + difZ)
								trace("top.top_z = " + top.top_z)
								top.top_vit *= 0.8
								top.top_mz += difZ*2
								top.top_rmx -= difZ * top.top_vit * 2
								
						}else if( angle > 0){
						
								trace("COLLISION DESSUS")
								top.top_mz *= -0.8
								
								//Effet de la vitesse sur la rotation
								var ideal_top_rmx = top.top_vit * 8
								
								//Effet de la rotation sur la vitesse
								var ideal_top_vit = top.top_rmx / 8
								
								top.top_vit = (top.top_vit + ideal_top_vit) / 1.3
								top.top_rmx = (top.top_rmx + ideal_top_rmx) / 4
								
								var difY = this.y - top.y
								trace("difY = " + difY)
								
								top.top_vit += difY/5
								top.top_rmx += difY
								
						}else if( angle < 0){
								trace("COLLISION DESSOUS")
								top.top_mz *= -0.8
						}
						trace("angle = " + angle)
						//trace("top rotation1 = " + top.rotation)
						//top.rotation = top.rotation * -1
						//top.top_vit *= 0.8
						//trace("top rotation2 = " + top.rotation)
						But.tps = 0
						
						
						//top.top_mz *= -0.8
						
						
				}
			
		
		}
		
		
		
		
	}
		
}