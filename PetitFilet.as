package  {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event


	public class PetitFilet extends MovieClip{
		
		private var top:MovieClip
		//private var tps:int
		
		public function PetitFilet() {
				//tps = 0
				addEventListener(Event.ENTER_FRAME, onEnterFrame)
		}
		
		private function onEnterFrame(pE:Event){
			if(top == null && Global.currentTop != null) top = Global.currentTop
			
			if(top != null) CollisionsPetitFilet()
			
		
		}
		
		private function CollisionsPetitFilet(){
				//tps++
				if(this.hitTestObject(top) && But.tps > 5 && top.top_z < 17){
						
						top.rotation = 180 - top.rotation
						But.tps = 0
						top.top_vit *= 0.2
						trace("COLLISION PETIT FILET " + + top.GetVitesseAbsolue())
				}
				
		}
		
		
	}
		
}
			