package  {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event


	public class Poteau extends MovieClip{
		
		private var top:MovieClip
		//private var tps:int
		public var hauteur:Number
		
		public function Poteau() {
				hauteur = 50
				//tps = 0
				addEventListener(Event.ENTER_FRAME, onEnterFrame)
		}
		
		private function onEnterFrame(pE:Event){
			if(top == null && Global.currentTop != null) top = Global.currentTop
			
			if(top != null) CollisionsPoteaux()
			
		
		}
		
		private function CollisionsPoteaux(){
				
				//tps ++
				
				var protation = Math.atan2 ( (this.y - top.y), (this.x - top.x) )
				protation /= (Math.PI/180)
				var psit = 90 - Math.abs(top.rotation - protation)
			
				if(Global.distance(this, top) < ((this.height / 2) + (top.height / 2) + (top.top_vit * psit/130)) && But.tps > 5 && top.top_z < hauteur - (top.height / 2)){
						
						var a = top.rotation
						var tr = protation
						var dtra = (a - tr) * -2
						top.rotation = top.rotation + dtra + 180
						
						top.top_vit *= 0.8
						
						//top_mz devient top_vit
						//top_vit devient top_mz
						
						//Effet de la vitesse sur la rotation
						var ideal_top_rmx = top.top_mz * - 30
						
						//Effet de la rotation sur la vitesse
						var ideal_top_mz = top.top_rmx / 50
						
						top.top_mz = (top.top_mz + ideal_top_mz) / 1.3
						top.top_rmx = (top.top_rmx + ideal_top_rmx) / 4
		
						
						//_root.poto.start() //SON
						//_root.ter.flash._alpha=100 ; _root.ter.flash._x=_root.ter.top._x ;_root.ter.flash._y=_root.ter.top._y
						But.tps = 0
						trace("COLLISION POTEAU " + + top.GetVitesseAbsolue())
						trace("top_rmx = " + top.top_rmx)
				} 
				
		}
		
		
	}
		
}
			