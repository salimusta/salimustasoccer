package  {
	import flash.display.MovieClip;
	
	public class Global {

		public static var BUT_ORDI = "but_ordi"
		public static var BUT_JOUEUR = "but_joueur"
		public static var EN_COURS = "0"
		
		public static var screenY = 400
		public static var screenX = 550
		
		public static var situation:String = "0"
		public static var pos: String
		public static var bloquer:Boolean = false 
		public static var bloquer2:Boolean = false
		public static var conduite_balle:Boolean = false
		
		public static var UpKey:Boolean = false
		public static var DownKey:Boolean = false
		public static var LeftKey:Boolean = false
		public static var RightKey:Boolean = false
		public static var TirKey:Boolean = false
		public static var CentreKey:Boolean = false
		public static var SelectionKey:Boolean = false
		
		public static var joueurTab = new Array()
		
		
		public static var balle_t:String
		
		public static var currentTop:MovieClip
		public static var currentTerrain:MovieClip
		
		public function Global() {
			// constructor code
		}
		
		public static function rad(angle){
			return (angle*Math.PI)/180	
		}
		public static function deg(angle){
			return (angle/Math.PI)*180	
		}
		public static function distance(obj1 ,obj2){
			var fdx = obj1.x - obj2.x
			var fdy = obj1.y - obj2.y
			return Math.sqrt((fdx*fdx)+(fdy*fdy))
		}

	}
	
}
