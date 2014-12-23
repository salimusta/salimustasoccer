//GESTION DE L'ADVERSAIRE

function commun(){
//ADVERSAIRE
	/*// Determine qui va etre le lanceur pour l'ordi
	if(ter.top._y>0&&ter.top._x>0) lanceur="o0"
	else if(ter.top._y>0&&ter.top._x<0) lanceur="o1"
	else if(ter.top._y<0&&ter.top._x>0) lanceur="o3"
	else if(ter.top._y<0&&ter.top._x<0) lanceur="o2"*/
	//Attribution des valeur et fonction de défaut de l'adversaire
	balle_touche++
	/*//def des tableaux de formation
		formationx2=[80,-80,-70,70];    formationy2=[200,200,-200,-200]
		formationx3=[60,-60,-100,100];  formationy3=[ter.top._y,ter.top._y,-100,-100]
		marquage=["j2","j3","j0","j1"]
		formationx4=[100,-100,-100,100];   formationy4=[-100,-100,-350,-350]
		formationx7=[40,-100,-100,100];   formationy7=[0,0,-350,-350]
		formationpx1=[100,-100,-100,100];   formationpy1=[-200,-200,-350,-350]*/
		//Formation de la touche
		/*if(ter.top._y>0){
			
			formationty2=[ter.top._y,ter.top._y,-100,-100];   formationtx2=[(ter.top._x/2)+50,(ter.top._x/2)-50,-100,100];
		}else{
			formationty2=[0,0,ter.top._y,ter.top._y];   formationtx2=[-100,100,(ter.top._x/2)+50,(ter.top._x/2)-50];
			
		}
		
		if(ter.top._y>0) {formationcy=[440,440,100,100];   formationcx=[50,-50,-100,100 ]}
		else  {formationcy=[-100,-100,-450,-450];   formationcx=[ 70,-70,-50,50]}*/
		
//JOUEUR
if(ter.top._y>0){
		formationty=[0,0,ter.top._y,ter.top._y];   formationtx=[-100,100,(ter.top._x/2)+50,(ter.top._x/2)-50];
	}else{
		formationty=[ter.top._y,ter.top._y,50,50];   formationtx=[(ter.top._x/2)+50,(ter.top._x/2)-50,100,-100];
	}
	//definition de la formation en fonction de la pos de la balle
		if(ter.top._y<=0){
			//ATTAQUE
			if(zone==1) {
				formationy=[-455,-455,100,100];   formationx=[-70,70,100,-100]
			}else if(zone==2){
				formationy=[-400,-400,-200,-200];   formationx=[-80,80,-100,-100]
			}else if(zone==3){
				formationy=[-200,-200,-300,-300];	formationx=[-100,100,-60,-60]
			}else if(zone==4){
				formationy=[-455,-455,0,0];  	formationx=[-25,25,80,-80]
			}
		}else{
			//DEFENSE
			if(zone==1) {
				formationy=[0,0,470,470];	formationx=[-100,100,30,-30]
			}else if(zone==2){
				formationy=[-100,-100,-450,450];	formationx=[-100,100,80,-80]
			}else if(zone==3){
				formationy=[-300,-300,300,300];	formationx=[-100,100,80,-80]
			}else if(zone==4){
				formationy=[0,0,470,470];	formationx=[-100,100,50,-50]
			}
		}

}
function adversaire(nom){
	_root.ddd=false
		//KAN IL MARK IL TRIP
		_root.oldpos=oldpos
		/*
	if(_root["dis"+nom]<10){
			_root["vit"+nom]=0
			_root["avance"+nom]=false	
			repos(nom)
		}else if(_root["chute"+nom]==false&&_root["tacle"+nom]==false){
			_root["vit"+nom]=4
			_root["avance"+nom]=true
			marcher(nom)
		}
	*/
	
	if(situation==0|situation.charAt(0)=="f"){
		if(_root["dis"+nom]>10&&_root["pre_chute"+nom]==false&&_root["chute"+nom]==false&&_root["tacle"+nom]==false){
			//VITESSE DU JOUEUR
			if(strategie=="attaque_milieu" |strategie=="progresser" |strategie=="esquive" |strategie=="attaque_aile"){
				_root["vit"+nom]=5.5
			}else _root["vit"+nom]=4
			
			if(_root["tir"+nom]==false&&_root["pre_tir"+nom]==false&&_root["passe"+nom]==false&&_root["pre_passe"+nom]==false&&_root["centre"+nom]==false&&_root["pre_centre"+nom]==false) {
				marcher(nom)
			}
		}else{
			if(_root["chute"+nom]==false&&_root["tacle"+nom]==false) _root["vit"+nom]=0
			repos(nom)
			_root["passe"+nom]=false;  
			_root["pre_passe"+nom]=false;
			_root["tir"+nom]=false;  
			_root["pre_tir"+nom]=false
		}
		_root["tps"+nom]++
		
			if(distance(nom,"top")<50){
		//COLLISION AVEC LA BALLE en temps normal
		if((ter[nom].c.hitTest(ter.top))and(top_z<10)&&ter[nom]._currentframe==1&&_root["tps"+nom]>6&&bloquer==false&&bloquer2==false&&situation==0){
			if(top_vit<8) {
				pos=nom
				oldpos=pos
			}
			else{
				 _root["tps"+nom]=0;   top_vit/=3
				ter.top._rotation+=180-random(360)
				poitrine.start()
			}	
			balle_t="ordi"
		}
		
		//COLLISION LORS DUN TACLE
		//avec la balle
		if(ter[nom].c.hitTest(ter.top)&&top_z<4&&ter[nom]._currentframe==2){
			pos=0;  balle_t="ordi"
			ter.top._rotation=ter[nom]._rotation-90
			top_vit=_root["vit"+nom]*2
			balle_touche=0
			tir.start()
		}
		//avec un joueur
		for(x=0;x<=3;x++){
			if((ter[nom].c.hitTest(ter["j"+x].j1)|ter[nom].c.hitTest(ter["j"+x].j2))&&ter[nom]._currentframe==2&&_root["vit"+nom]>2&&situation==0){
				_root["pre_chutej"+x]=true
			if(balle_touche>30){
				if(ter["j"+x]._x>-175&&ter["j"+x]._x<175&&ter["j"+x]._y<-361) situation="faute_ordi_p"
				else situation="faute_ordi"
			}
			 _root.sortiey=ter["j"+x]._y;  _root.sortiex=ter["j"+x]._x
			}
			if((ter[nom].c.hitTest(ter["o"+x].j1)|ter[nom].c.hitTest(ter["o"+x].j2))&&ter[nom]._currentframe==2&&_root["vit"+nom]>2&&situation==0){
				_root["pre_chuteo"+x]=true
			}
		}
	}
		//TACLE
		if(_root["tacle"+nom]){
			tacle(nom)
		//CHUTE
		}else if(_root["chute"+nom]){
			chute2(nom)
		//PRE CHUTE
		}else if(_root["pre_chute"+nom]){
			chute(nom);  pos=0
		_root["vit"+nom]=4;    _root["tps"+nom]=0
		//CENTRE
		}else if(_root["centre"+nom]){
			if(ter[nom].j1._yscale>=100){
				_root["centre"+nom]=false
				if(pos==nom){
					top_vit=5;   top_mz=1;	 pos=0
					ter.top._rotation=_root["protation"+nom]+225
					indice_balle()
					tir.start()
				}
			}
			jambe_tir(nom)
		
		//PRE cENTRE
		}else if(_root["pre_centre"+nom]){
			_root["pui"+nom]--
			lever_jambe(nom)
			if(_root["pui"+nom]<=0){
				_root["pre_centre"+nom]=false
				_root["centre"+nom]=true
			}
		//PASSE
		}else if(_root["passe"+nom]){
			if(ter[nom].j1._yscale<50){
				jambe_passe(nom)
			}else{
				_root["passe"+nom]=false
				_root["pre_passe"+nom]=false
				if(pos==nom) {
					top_vit=7;   pos=0; passe.start()
					ter.top._rotation=ter[nom]._rotation-90;   ter[nom].pg._rotation=0
				}
			}
	
		//PRE PASSE
		}else if(_root["pre_passe"+nom]){
			lever_jambe(nom)
			if(ter[nom].j1._yscale<-10) { _root["pre_passe"+nom]=false;   _root["passe"+nom]=true }

		//TIR
		}else if(_root["tir"+nom]){
			if(ter[nom].j1._yscale>=70 && _root["rotdis"+nom]<20) {
				_root["tir"+nom]=false
				if(pos==nom) {
					top_vit=11;   pos=0;  tir.start()
					if(_root["pui"+nom]<5) top_mz=0
					else  top_mz=_root["pui"+nom]/7
					ter.top._rotation=_root["protation"+nom]-90       
				}
				_root["pui"+nom]=0			
			}
			if(ter[nom].j1._yscale>=70 && _root["rotdis"+nom]>20) _root["vit"+nom]=0
			if(ter[nom].j1._yscale<70)jambe_tir(nom)

		//PRE TIR
		}else if(_root["pre_tir"+nom]){
			_root["pui"+nom]--
			lever_jambe(nom)
			if(_root["pui"+nom]<=0){
				_root["pre_tir"+nom]=false
				_root["tir"+nom]=true
			}
	
		//L'ADVERSAIRE A LA BALLE
		}else if(pos==nom){
			
			
			ai_passe(nom)
			ter.top._rotation=ter[nom]._rotation-90
			//DIFFERENT COMORTEMENT DE L'ADVERSAIRE
			//passer la balle si il y a un joueur ki est proche 
			
			if((distance(nom,joueur_proche)<40&&ter[nom]._y<ter[joueur_proche]._y )){
				_root["pre_passe"+nom]=true				
				_root["dest_x"+nom]=ter[receveur[0]]._x
				_root["dest_y"+nom]=ter[receveur[0]]._y+30
				strategie="Passer"
			//tirer au but si l'ocasion est bonne	
			}else if(zone==2|zone==1){
				_root["pre_tir"+nom]=true
				_root["dest_x"+nom]=80-random(160)
				_root["dest_y"+nom]=500
				strategie="Tirer"
			//faire un centre si l'a. est sur l'aile
			}else if(ter.top._y>420&&zone==4){
				_root["pre_centre"+nom]=true
				_root["dest_x"+nom]=ter[nom]._x+50
				_root["dest_y"+nom]=ter[nom]._y+50
				_root["pui"+nom]=5
				strategie="centrer"
			//progression le lon de la touche
			}else if(ter[nom]._x<-300|ter[nom]._x>300){
				_root["dest_x"+nom]=ter[nom]._x
				_root["dest_y"+nom]=ter[nom]._y+800
				strategie="attaque_aile"
			//eviter un joueur qui s'aproche
			}else if(distance(nom,joueur_proche)<150&&ter[nom]._y<ter[joueur_proche]._y ){
				_root["dest_x"+nom]=ter[nom]._x+(20/((ter[nom]._x-ter[joueur_proche]._x)/50))
				_root["dest_y"+nom]=ter[nom]._y+40
				strategie="esquive"
			//progresser au milieu
			}else if(ter[nom]._x>-150&&ter[nom]._x<150 ){
				_root["dest_x"+nom]=0
				_root["dest_y"+nom]=ter[nom]._y+800
				strategie="attaque milieu";  
			//progresser sur une aile
			}else if(ter[nom]._x<-150&&ter[nom]._x>150 ){
				_root["dest_x"+nom]=ter[nom]._x
				_root["dest_y"+nom]=ter[nom]._y+40
				strategie="attaque_vers_aile"
			//progresser
			}else{
				strategie="progresser"
				_root["dest_x"+nom]=ter[nom]._x
				_root["dest_y"+nom]=ter[nom]._y+40
			}
				
			
		//si l'a. est sur le point de receptionner une passe
		}else if(receveur[0]==nom&&pos==0&&ter.ind_balle._visible==false){
			balle_ant(nom)
			
		//QUAND LA BALLE EST EN SOLO----------------------------------
		}else if(pos==0){
			
			//si l'a. est le + proche la balle, aller vers la balle
			if(ordi_controle==nom){
				
				if(_root.ter.ind_balle._visible==false){
					balle_ant(nom)	
					
				}else{
					
					_root["dest_x"+nom]=ter.ind_balle._x
					_root["dest_y"+nom]=ter.ind_balle._y
				}
			}else{
				
				_root["dest_x"+nom]=formationx2[nom.charAt(1)]
				_root["dest_y"+nom]=formationy2[nom.charAt(1)]
				
			}

		//si les ordi ont la balle--------------------------------------
		}else if(pos.charAt(0)=="o"){
			_root["dest_x"+nom]=formationx3[nom.charAt(1)]
			_root["dest_y"+nom]=formationy3[nom.charAt(1)]

		//si les joueurs ont la balle
		}else if(pos.charAt(0)=="j"){
			if(ordi_controle==nom){
				balle_ant(nom)
				//TACLER SI POSSIBLE
				if(ter.top._y<ter[pos]._y&&distance(nom,"top")<30&&ter[nom]._y<ter[pos]._y)   _root["tacle"+nom]=true
				
			}else if(pos!=marquage[nom.charAt(1)]){
				if(marquage[nom.charAt(1)]!=0){
					//L ordi marque le joueur qui na pa la balle
					_root["dest_x"+nom]=ter[marquage[nom.charAt(1)]]._x
					_root["dest_y"+nom]=ter[marquage[nom.charAt(1)]]._y-30
				}else{
					_root["dest_x"+nom]=formationx2[nom.charAt(1)]
					_root["dest_y"+nom]=formationy2[nom.charAt(1)]
				}
			}else{
				//l ordi marque le joueur qui a la balle
				balle_ant(nom)
			}
		}else if(pos=="goal2"){
			_root["dest_x"+nom]=ter[marquage[nom.charAt(1)]]._x
					_root["dest_y"+nom]=ter[marquage[nom.charAt(1)]]._y-30
		}else if(pos=="goal"){
			_root["dest_x"+nom]=formationx2[nom.charAt(1)]
			_root["dest_y"+nom]=formationy2[nom.charAt(1)]
		}
	
	}else if(situation=="touche_con"){
		if( _root["dis"+nom]>20 ){
		marcher(nom)
		_root["vit"+nom]=4
	}else{
		repos(nom)
		_root["vit"+nom]=0
	}
		if(marquage[nom.charAt(1)]!=0){
			//L ordi marque le joueur qui na pa la balle
			_root["dest_x"+nom]=ter[marquage[nom.charAt(1)]]._x
			_root["dest_y"+nom]=ter[marquage[nom.charAt(1)]]._y-30
		}else{
			_root["dest_x"+nom]=formationx2[nom.charAt(1)]
			_root["dest_y"+nom]=formationy2[nom.charAt(1)]
		}

	}else if(situation=="touche"){
		if(lanceur==nom){
			ai_passe(nom)
			_root["vit"+nom]=0;   top_z=12;  top_mz=0
			ter[nom]._x=sortiex;  ter[nom]._y=sortiey
			balle_t="ordi"
			ter.top._x=ter[nom]._x;   ter.top._y=ter[nom]._y;   ter.top._rotation=ter[nom]._rotation-90
			_root["tacle"+nom]=false;   _root["chute"+nom]=false
			ter[nom].gotoAndStop(1)
			_root["pre_chute"+nom]=false;   _root["pre_tacle"+nom]=false
			_root["tps"+nom]++;  
			_root["dest_x"+nom]=ter[receveur[0]]._x
			_root["dest_y"+nom]=ter[receveur[0]]._y
			if (_root["tps"+nom]>50){
				situation=0;
				if(ter.top._x<0) ter.top._x=-325
				if(ter.top._x>0) ter.top._x=325
				top_vit=7
				_root["tps"+nom]=0
			}
		}else{
			_root["dest_x"+nom]=formationtx2[nom.charAt(1)]
			_root["dest_y"+nom]=formationty2[nom.charAt(1)]
			if(_root["dis"+nom]>5){
				_root["vit"+nom]=3;  marcher(nom);  _root["tps"+nom]=0
			}else {
				_root["vit"+nom]=0;  repos(nom)
			}
		}
	}else if(situation=="pre_ordi_corner"){
		if(lanceur==nom){
			if(ter.top._x<0){
				_root["dest_x"+nom]=-355
				_root["dest_y"+nom]=505
			}else{
				_root["dest_x"+nom]=355
				_root["dest_y"+nom]=505
			}
			if(_root["dis"+nom]>5){
				_root["vit"+nom]=3;  marcher(nom);  _root["tps"+nom]=0
			}else {
				_root["vit"+nom]=0;  repos(nom)
				_root["tps"+nom]++
				if(_root["tps"+nom]>10) situation="ordi_corner"
			}
			top_vit=0
		}else{
			_root["dest_x"+nom]=formationcx[nom.charAt(1)]
			_root["dest_y"+nom]=formationcy[nom.charAt(1)]
			if(_root["dis"+nom]>5){
				_root["vit"+nom]=3;  marcher(nom);  _root["tps"+nom]=0
			}else {
				_root["vit"+nom]=0;  repos(nom)
			}
		}
	}else if(situation=="joueur_sixmetres"){
		_root["dest_x"+nom]=formationx2[nom.charAt(1)]
		_root["dest_y"+nom]=formationy2[nom.charAt(1)]
		if(_root["dis"+nom]>5){
			_root["vit"+nom]=3;  marcher(nom);  _root["tps"+nom]=0
		}else {
			_root["vit"+nom]=0;  repos(nom)
		}
	}else if(situation=="joueur_corner"|situation=="pre_joueur_corner"){
		_root["dest_x"+nom]=formationcx[nom.charAt(1)]
		_root["dest_y"+nom]=formationcy[nom.charAt(1)]
		if(_root["dis"+nom]>5){
			_root["vit"+nom]=4;  marcher(nom);  _root["tps"+nom]=0
		}else {
			_root["vit"+nom]=0;  repos(nom)
		}
	}else if(situation=="ordi_corner"){
		_root["dest_x"+nom]=ter.top._x
		_root["dest_y"+nom]=ter.top._y
		_root["vit"+nom]=3;  marcher(nom)
		if(distance(nom,"top")<5){
			tir.start()
			top_vit=4+random(3);   top_mz=1;  
			situation=0;   _root["tps"+nom]=0
			if(ter.top._x<0) ter.top._rotation=-5-random(10)
			else ter.top._rotation=-175+random(5)
			indice_balle();  balle_t="ordi"
		}
	}else if(situation=="sixmetres_ordi"){
		_root["dest_x"+nom]=formationx2[nom.charAt(1)]
		_root["dest_y"+nom]=formationy2[nom.charAt(1)]
		if(_root["dis"+nom]>5){
			_root["vit"+nom]=4;  marcher(nom);  _root["tps"+nom]=0
		}else {
			_root["vit"+nom]=0;  repos(nom)
		}
	}else if(situation=="coupfranc_ordi"){
		ai_passe(nom)
		_root["chute"+nom]=false;  _root["pre_chute"+nom]=false;
		if(lanceur==nom){
			if(int(ter.top._x-sortiex)>5)  _root["tps"+nom]=0;
			ter.top._x=sortiex;  ter.top._y=sortiey;  top_vit=0
			_root["tps"+nom]++
			
			if(_root["tps"+nom]<50){
				ter[nom].gotoAndStop(1)
				ter[nom]._y=ter.top._y
				if(ter.top._x<0) ter[nom]._x=ter.top._x-40
				else ter[nom]._x=ter.top._x+40
			}else{
				_root["dest_x"+nom]=ter.top._x
				_root["dest_y"+nom]=ter.top._y
				marcher(nom);  _root["vit"+nom]=3
				ter[nom]._rotation=_root["protation"+nom]-90
				if(distance(nom,"top")<5){
					top_vit=6+random(3);tir.start()
					situation=0;   _root["tps"+nom]=0
					balle_t="ordi"
					
					ter.top._rotation=(Math.atan2((ter.top._y-ter[receveur[0]]._y),(ter.top._x-ter[receveur[0]]._x))/(Math.PI/180))+180
				}
			}
		}else{
			ter[nom].gotoAndStop(1)
			_root["dest_x"+nom]=formationx3[nom.charAt(1)]
			_root["dest_y"+nom]=formationy3[nom.charAt(1)]
			if(_root["dis"+nom]>5){
				_root["vit"+nom]=4;  marcher(nom);  _root["tps"+nom]=0
			}else {
				_root["vit"+nom]=0;  repos(nom)
			}
		}
		
	}else if(situation=="coupfranc_joueur"){
		
			ter[nom].gotoAndStop(1)
			if(joueur_controle!=marquage[nom.charAt(1)]){
			//L ordi marque le joueur qui na pa la balle
			_root["dest_x"+nom]=ter[marquage[nom.charAt(1)]]._x
			_root["dest_y"+nom]=ter[marquage[nom.charAt(1)]]._y-150
			}else{
				_root["dest_x"+nom]=ter.top._x/2
				_root["dest_y"+nom]=ter.top._y-Math.abs(ter.top._y+500)/10
			}
			if(_root["dis"+nom]>5){
				_root["vit"+nom]=4;  marcher(nom);  _root["tps"+nom]=0
			}else {
				_root["vit"+nom]=0;  repos(nom)
			}
		
	//PENALTY----------------
	}else if(situation=="penalty_joueur"){
		_root["dest_x"+nom]=formationpx1[nom.charAt(1)]
		_root["dest_y"+nom]=formationpy1[nom.charAt(1)]
		if(_root["dis"+nom]>5){
			_root["vit"+nom]=4;  marcher(nom);  _root["tps"+nom]=0
		}else {
			_root["vit"+nom]=0;  repos(nom)
		}
	}else if(situation=="penalty_ordi"){
		if(nom==ordi_controle){
			if(ter[nom]._x!=0) _root["tps"+nom]=0
			_root["dest_x"+nom]=0
			_root["dest_y"+nom]=500
			
			_root["tps"+nom]++
		
			if(_root["tps"+nom]>20){
				_root["vit"+nom]=3; marcher(nom)
				if(distance(nom,"top")<5){
					top_vit=10;balle_t="ordi";  tir.start()
					ter.top._rotation=50+random(80)
					situation=0;  _root["tps"+nom]=0
				}
			}else{
				_root["vit"+nom]=0; pos=0
				ter.top._x=0;   ter.top._y=410
				top_vit=0;  _root["chute"+nom]=false;  _root["pre_chute"+nom]=false
				ter[nom].gotoAndStop(1)
				ter[nom]._y=340;   ter[nom]._x=0;   ter[nom]._rotation=180
			}
		}else{
			_root["dest_x"+nom]=formationx2[nom.charAt(1)]
			_root["dest_y"+nom]=formationy2[nom.charAt(1)]
			if(_root["dis"+nom]>5){
				_root["vit"+nom]=4;  marcher(nom);  _root["tps"+nom]=0
			}else {
				_root["vit"+nom]=0;  repos(nom)
			}

		}
	}else if(situation=="engagement_joueur"){
		_root["dest_x"+nom]=formationx4[nom.charAt(1)]
			_root["dest_y"+nom]=formationy4[nom.charAt(1)]
			if(_root["dis"+nom]>5){
				_root["vit"+nom]=4;  marcher(nom);  _root["tps"+nom]=0
			}else {
				_root["vit"+nom]=0;  repos(nom)
			}
			
	}else if(situation=="engagement_ordi"){
		if(nom=="o1"){
			_root["tps"+nom]++
			if(_root["tps"+nom]>100){
				marcher(nom);  _root["vit"+nom]=3
				if(distance(nom,"top")<5){
					passe.start()
					top_vit=6;  balle_t="ordi"
					situation=0;  _root["tps"+nom]=0
				}
			}else{
				ter[nom]._x=-20;  ter[nom]._y=0; ter[nom]._rotation=90
				_root["dest_x"+nom]=0;  _root["dest_y"+nom]=0
				_root["vit"+nom]=0;top_vit=0;  ter.top._rotation=ter[nom]._rotation-90
			}
		}else{
			_root["dest_x"+nom]=formationx7[nom.charAt(1)]
			_root["dest_y"+nom]=formationy7[nom.charAt(1)]
			if(_root["dis"+nom]>5){
				_root["vit"+nom]=4;  marcher(nom);  _root["tps"+nom]=0
			}else {
				_root["vit"+nom]=0;  repos(nom)
			}
			
		}
//KAN IL ON MARKE
	}else if((_root.situation=="ordi_but" |_root.situation=="but_ordi"  )&&_root.top_m<1){
		marcher(nom)
		
		if(nom!=oldpos){
			_root["dest_x"+nom]=_root.ter[oldpos]._x-(nom.charAt(1)-1)*20
			_root["dest_y"+nom]=_root.ter[oldpos]._y
			_root["vit"+nom]=4
		}else{
			a+=0.1
			_root["vit"+oldpos]=4.3
			_root["dest_x"+oldpos]=Math.cos(a)*100
			_root["dest_y"+oldpos]=-500
			
		}
		
		
	}else{
		repos(nom);
		_root["vit"+nom]=0
		_root["tacle"+nom]=false
		_root["chute"+nom]=false
		ter[nom].gotoAndStop(1)
		_root["pre_chute"+nom]=false	
		_root["pre_tacle"+nom]=false
		ter[nom]._yscale=14
	}
//CALCUL DE LA ROTATION A ADAPTER ET LIMITATION

	_root["protation"+nom]=Math.atan2( (ter[nom]._y-_root["dest_y"+nom]),(ter[nom]._x-_root["dest_x"+nom]))
	_root["protation"+nom]/=((Math.PI/180))
	if(_root["protation"+nom]-90<0) _root["protation"+nom]+=360-90
	
	
	//disatcne ver la destination
	_root["dis"+nom]=Math.sqrt(((ter[nom]._y-_root["dest_y"+nom])*(ter[nom]._y-_root["dest_y"+nom]))+((ter[nom]._x-_root["dest_x"+nom])*(ter[nom]._x-_root["dest_x"+nom])) )

	if(_root["chute"+nom]==false&&_root["tacle"+nom]==false) {
		
		calcul_dir(_root["protation"+nom],nom,2)
			
			
		if(Math.abs(ro2-ter[nom]._rotation)>180) ro2-=360
			
		if( Math.abs(ter[nom]._rotation-ro2)<20 ) ter[nom]._rotation=ro2
																	  
		if(ter[nom]._rotation>ro2) ter[nom]._rotation-=10
		else if(ter[nom]._rotation<ro2) ter[nom]._rotation+=10
		
		//ter[nom]._rotation=_root["protation"+nom]
		
	}
	//CALCUL DE LA DIFFERENCE ROTATION/ ROTATION VISEE
	if(pos==nom) {
		ro2=ter[nom]._rotation
		if(ro2<0) ro2+=360
		
		_root["rotdis"+nom]=Math.abs(_root["protation"+nom]-ro2)
	}
	
	//CONDUITE DE BALLE
	if(pos==nom){
		ter.top._y=ter[nom]._y-(Math.cos(_root["rd"+nom])*conduite)
		ter.top._x=ter[nom]._x+(Math.sin(_root["rd"+nom])*conduite)
	}
	_root.bbb=strategie
	
}

