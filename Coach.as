package  {
	import flash.display.MovieClip;
	
	public class Coach {

		private var team:String
		public function Coach() {
			// constructor code
		}
		
		public function Trouver_Lanceur(_top:MovieClip, ):String{
			var lanceur:String
			
			// Determine qui va etre le lanceur
			if(_top.y > 0 && _top.x > 0) lanceur="0"
			else if(_top.y > 0 && _top.x < 0) lanceur="1"
			else if(_top.y < 0 && _top.x > 0) lanceur="3"
			else if(_top.y < 0 && _top.x < 0) lanceur="2"
			
			return lanceur
		}
		
		public function Formations(){
			//def des tableaux de formation
			/*formationx2=[80,-80,-70,70];    formationy2=[200,200,-200,-200]
			formationx3=[60,-60,-100,100];  formationy3=[ter.top._y,ter.top._y,-100,-100]
			marquage=["j2","j3","j0","j1"]
			formationx4=[100,-100,-100,100];   formationy4=[-100,-100,-350,-350]
			formationx7=[40,-100,-100,100];   formationy7=[0,0,-350,-350]
			formationpx1=[100,-100,-100,100];   formationpy1=[-200,-200,-350,-350]
			
			if(ter.top._y>0){
			
			formationty2=[ter.top._y,ter.top._y,-100,-100];   formationtx2=[(ter.top._x/2)+50,(ter.top._x/2)-50,-100,100];
			}else{
				formationty2=[0,0,ter.top._y,ter.top._y];   formationtx2=[-100,100,(ter.top._x/2)+50,(ter.top._x/2)-50];
				
			}
			
			if(ter.top._y>0) {formationcy=[440,440,100,100];   formationcx=[50,-50,-100,100 ]}
			else  {formationcy=[-100,-100,-450,-450];   formationcx=[ 70,-70,-50,50]}
			*/
		}

	}
	
}
