

//Definition des fonctions des 2 types de deplacement
	function calcul_dir(normaldir,nom,param){
		
		dir_op=180+normaldir
		rot=ter[nom]._rotation
		if(dir_op>=360) dir_op=dir_op-360
		if(rot<0)  rot+=360
		
		if(Math.abs(rot-dir_op)<50){
			if(_root.pos==nom){
				if(_root.conduite<-3) ter[nom]._rotation=normaldir
				if(_root.conduite<-15){
					_root.conduite_balle=true
					_root.conduite=15
				}else{
					_root.conduite_balle="temp"
					_root.conduite-=3
				}
			}else{
				
				ter[nom]._rotation=normaldir
			}
		}else{
			if(nom.charAt(0)=="j") ro=normaldir
			if(nom.charAt(0)=="o") ro2=normaldir
		}
	}
	
//INITIALISATION DE LA VAR KI SER PR LA CONDUITE
ro=0

	function controle_rot(nom){
		if (Key.isDown(Key.UP)) {
			if(_root["vit"+nom]<4) _root["vit"+nom]+=0.5
			_root["avance"+nom]=true
			_root.conduite_balle=true
		}else if (Key.isDown(Key.DOWN)) {
			if(_root["vit"+nom]>-2) _root["vit"+nom]-=0.5
			_root["avance"+nom]=true
			if(pos==nom) pos=0
		}else if(_root["tacle"+nom]==false){
			if(_root["vit"+nom]>0) _root["vit"+nom]-=0.8
			if(_root["vit"+nom]<0) _root["vit"+nom]+=0.8
			if(_root["vit"+nom]<0.8) _root["vit"+nom]=0
		}
		if (Key.isDown(Key.RIGHT)) ter[nom]._rotation+=7  
		if (Key.isDown(Key.LEFT)) ter[nom]._rotation-=7
	}
//deuxieme type
	function controle_dir(nom){
		
		if(Key.isDown(Key.UP)|Key.isDown(Key.DOWN)|Key.isDown(Key.RIGHT)|Key.isDown(Key.LEFT)){
			if(_root["vit"+nom]<4) _root["vit"+nom]+=0.6
			_root["avance"+nom]=true
			_root.conduite_balle=true
		}else{
			if(_root["vit"+nom]>0) _root["vit"+nom]-=1
			if(_root["vit"+nom]<0) _root["vit"+nom]+=1
			if(Math.abs(_root["vit"+nom])<1) _root["vit"+nom]=0
		}
		if(_root.ter._rotation==0){
			if (Key.isDown(Key.DOWN)&&Key.isDown(Key.LEFT))calcul_dir(225,nom)
			else if (Key.isDown(Key.UP)&&Key.isDown(Key.LEFT))calcul_dir(315,nom)
			else if (Key.isDown(Key.UP)&&Key.isDown(Key.RIGHT))calcul_dir(45,nom)
			else if (Key.isDown(Key.DOWN)&&Key.isDown(Key.RIGHT))calcul_dir(135,nom)
			else if (Key.isDown(Key.UP))calcul_dir(0,nom)
			else if (Key.isDown(Key.LEFT))calcul_dir(270,nom)
			else if (Key.isDown(Key.RIGHT))calcul_dir(90,nom)
			else if (Key.isDown(Key.DOWN))calcul_dir(180,nom)
		}else{
			if (Key.isDown(Key.UP)&&Key.isDown(Key.RIGHT))calcul_dir(225,nom)
			else if (Key.isDown(Key.DOWN)&&Key.isDown(Key.RIGHT))calcul_dir(315,nom)
			else if (Key.isDown(Key.DOWN)&&Key.isDown(Key.LEFT))calcul_dir(45,nom)
			else if (Key.isDown(Key.UP)&&Key.isDown(Key.LEFT))calcul_dir(135,nom)
			else if (Key.isDown(Key.DOWN))calcul_dir(0,nom)
			else if (Key.isDown(Key.RIGHT))calcul_dir(270,nom)
			else if (Key.isDown(Key.LEFT))calcul_dir(90,nom)
			else if (Key.isDown(Key.UP))calcul_dir(180,nom)
		}
			
		if(Math.abs(ro-ter[nom]._rotation)>180) ro-=360
		
			
			if( Math.abs(ter[nom]._rotation-ro)<20 ) ter[nom]._rotation=ro
																  
			if(ter[nom]._rotation>ro) ter[nom]._rotation-=10
			else if(ter[nom]._rotation<ro) ter[nom]._rotation+=10
		
		
	}

/*---------------------CONTROLE----------------------
-----------------------------------------------------*/
crochetg=1000;crochetd=1000
function controle(nom){
	
	
	_root.conduite_balle=false
	//GESTE TECH
	if (Key.isDown(Key.LEFT)) {
		if(pre_crochetg>0) {ter[nom]._rotation-=50;pre_crochetg=0;crochetg=1001}
		if(crochetg>1000) crochetg=0
		crochetg++
	}else {
		if(crochetg<3) pre_crochetg=10
		crochetg=1001
	}
	if (Key.isDown(Key.RIGHT)) {
		if(pre_crochetd>0) {ter[nom]._rotation+=50;pre_crochetd=0}
		if(crochetd>1000) crochetd=0
		crochetd++
	}else {
		if(crochetd<3) pre_crochetd=10
		crochetd=1001
	}

pre_crochetg--;  pre_crochetd--
	
	

	//CONTROLE DU JOUEUR
	if((situation!="engagement_joueur"&&situation!="penalty_joueur"&&situation!="touche_con"&&situation!="pre_joueur_corner"&&situation!="joueur_corner"&&situation!="coupfranc_joueur")|situation.charAt(0)=="f"){
		//Def des variable
		_root["avance"+nom]=false;  _root.vit=0
		//Deplacement
		if(_root["tacle"+nom]==false&&_root["chute"+nom]==false){
			if(controle_type=="rotation") controle_rot(nom)
			else controle_dir(nom)
		
			if(pos==nom){
				if (Key.isDown(Key.SPACE)) {
					if(_root["tir"+nom]==false) _root["pre_tir"+nom]=true
					space_press=true
				}else space_press=false
				if (key_b) {
					if(_root["passe"+nom]==false) _root["pre_passe"+nom]=true
				}
				if (_root.key_v) {
					if(_root["centre"+nom]==false) _root["pre_centre"+nom]=true
					_root["end_press"+nom]=true
				}else _root["end_press"+nom]=false
			}else{
				if(Key.isDown(Key.SPACE)&&(situation=="0")) _root["tacle"+nom]=true
			}
			if (_root.key_n){
				if(_root["vit"+nom]<6) _root["vit"+nom]+=0.2
			}else{
				if(_root["vit"+nom]>4) _root["vit"+nom] -=0.2
			}
		}
		_root["tps"+nom]++
	
		//CONDUITE DE BALLE
		if(pos==nom){
			ter.top._y=ter[nom]._y-(Math.cos(_root["rd"+nom])*conduite)
			ter.top._x=ter[nom]._x+(Math.sin(_root["rd"+nom])*conduite)
			ter.top._rotation=ter[nom]._rotation-90
		}
		
		if(distance(nom,"top")<50){
		//COLLISION TACLE
		if(ter[nom].c.hitTest(ter.top)&&top_z<4&&ter[nom]._currentframe==2&&bloquer==false&&bloquer2==false&&situation==0){
			pos=0;  tir.start()
			ter.top._rotation=ter[nom]._rotation-90
			top_vit=_root["vit"+nom]*2
			balle_t="joueur";    balle_touche=0
		}
	
		//COLLISION TACLE SUR UN ORDI
		
		for(x=0;x<=3;x++){
			if((ter[nom].c.hitTest(ter["o"+x].j1)|ter[nom].c.hitTest(ter["o"+x].j2))&&ter[nom]._currentframe==2&&_root["vit"+nom]>2&&situation==0){
				
				_root["pre_chuteo"+x]=true;   poitrine.start()
				if(balle_touche>30){
					if(ter["o"+x]._x>-175&&ter["o"+x]._x<175&&ter["o"+x]._y>361) situation="faute_joueur_p"
					else situation="faute_joueur"
				}
				 _root.sortiey=ter["o"+x]._y;  _root.sortiex=ter["o"+x]._x
			}
		}

		//CONTACT AVEC LA BALLE
		if((ter[nom].c.hitTest(ter.top))&&(top_z<10)&&ter[nom]._currentframe==1&&_root["tps"+nom]>6&&bloquer==false&&bloquer2==false&&situation==0){
			if(top_vit<8) pos=nom
			else{
				 _root["tps"+nom]=0;   top_vit/=3
				ter.top._rotation+=180-random(360)
				poitrine.start()
			}	
			balle_t="joueur"
		}
	
		ter.fleche._visible=false
	}
	//DIFFERENTES SITUATIONS POSSIBLES
	}else if(situation=="touche_con"){
		_root["vit"+nom]=0;  repos(nom)
		top_z=12;  top_mz=0
		ter[nom]._x=sortiex;  ter[nom]._y=sortiey
		balle_t="joueur"
		ter.top._x=ter[nom]._x;    ter.top._y=ter[nom]._y;    ter.top._rotation=ter[nom]._rotation-90
		_root["tacle"+nom]=false;    _root["chute"+nom]=false;   _root["pre_chute"+nom]=false;    _root["pre_tacle"+nom]=false
		ter[nom].gotoAndStop(1)
		if (Key.isDown(Key.RIGHT)) ter[nom]._rotation+=5;
		if (Key.isDown(Key.LEFT))  ter[nom]._rotation-=5;
		if (Key_b){
			situation=0
			if(ter.top._x<0) ter.top._x=-325
			if(ter.top._x>0) ter.top._x=325
			top_vit=7;balle_t="joueur"
			_root["tps"+nom]=0
		}
	}else if(situation=="joueur_corner"){
		top_vit=0;   flecher(nom)
		if(_root.key_v){
			_root["pui"+nom]++
			if(_root["pui"+nom]>=10) _root["pui"+nom]=10
			ter.fleche._visible=false
			top_mz=1
		}else if (Key.isDown(Key.SPACE)){
			_root["pui"+nom]++
			if(_root["pui"+nom]>=10) _root["pui"+nom]=10
			ter.fleche._visible=false
		}else if(_root["pui"+nom]>0){
			_root["vit"+nom]=3
			marcher(nom)
			if(distance(nom,"top")<5){
				situation=0
				top_vit=_root["pui"+nom]
				_root["pui"+nom]=0
				ter.top._rotation=ter[nom]._rotation-90
				indice_balle();balle_t="joueur"
				_root["tps"+nom]=0;  tir.start()
			}
		}else if(_root["pui"+nom]==0){
			_root["chute"+nom]=false;  _root["pre_chute"+nom]=false; pos=0
			top_vit=0;  
			if(ter.top._x>0){
				if (Key.isDown(Key.RIGHT)&&ter.top._rotation<-90) ter.top._rotation++;
				if (Key.isDown(Key.LEFT)&&ter.top._rotation>-180) ter.top._rotation--;
			}else{
				if (Key.isDown(Key.RIGHT)&&ter.top._rotation<180) ter.top._rotation++;
				if (Key.isDown(Key.LEFT)&&ter.top._rotation>90) ter.top._rotation--;
			}
			ter[nom]._x=ter.top._x-(Math.sin(conv_rad(ter[nom]._rotation))*20)
			ter[nom]._y=ter.top._y+(Math.cos(conv_rad(ter[nom]._rotation))*20)
			ter[nom]._rotation= ter.top._rotation
			_root["vit"+nom]=0;  repos(nom);
		}
	
	}else if(situation=="coupfranc_joueur"){
		top_vit=0;flecher(nom)
		_root["tacle"+nom]=false;    _root["chute"+nom]=false;  
		_root["pre_chute"+nom]=false;    _root["pre_tacle"+nom]=false 
		ter[nom].gotoAndStop(1)
		if(_root.key_v){
			_root["pui"+nom]++
			if(_root["pui"+nom]>=10) _root["pui"+nom]=10
			ter.fleche._visible=false
			top_mz=1
		}else if (Key.isDown(Key.SPACE)){
			_root["pui"+nom]++;  ter.fleche._visible=false
			if(_root["pui"+nom]>=10) _root["pui"+nom]=10
		}else if(_root["pui"+nom]>0){
			_root["vit"+nom]=3
			if(distance(nom,"top")<15) jambe_tir(nom)
			else if(distance(nom,"top")<30) lever_jambe(nom)
			else marcher(nom)

			if(distance(nom,"top")<5){
				situation=0;tir.start()
				top_vit=_root["pui"+nom]+3
				_root["pui"+nom]=0
				ter.top._rotation=ter[nom]._rotation-90
				if(_root["pui"+nom]>5) top_mz=0.7
				indice_balle();balle_t="joueur"
				_root["tps"+nom]=0
			}
		}else if(_root["pui"+nom]==0){
			_root["chute"+nom]=false;  _root["pre_chute"+nom]=false; pos=0
			top_vit=0;  ter.top._x=sortiex; ter.top._y=sortiey  
			if (Key.isDown(Key.RIGHT)) ter.top._rotation+=2;
			if (Key.isDown(Key.LEFT)) ter.top._rotation-=2;
			ter[nom]._x=ter.top._x-(Math.sin(conv_rad(ter[nom]._rotation))*30)
			ter[nom]._y=ter.top._y+(Math.cos(conv_rad(ter[nom]._rotation))*30)
			ter[nom]._rotation= ter.top._rotation
			_root["vit"+nom]=0;  repos(nom);
		}
	}else if(situation=="penalty_joueur"){
		top_vit=0;  _root["chute"+nom]=false;  _root["pre_chute"+nom]=false
		ter[nom].gotoAndStop(1)
		if (Key.isDown(Key.SPACE)){
			_root["pui"+nom]++;  ter.fleche._visible=false
			if(_root["pui"+nom]>=10) _root["pui"+nom]=10
		}else if(_root["pui"+nom]>0){
			_root["vit"+nom]=3
			if(distance(nom,"top")<20) jambe_tir(nom)
			else if(distance(nom,"top")<40) lever_jambe(nom)
			else marcher(nom)

			if(distance(nom,"top")<5){
				tir.start();   
				top_vit=_root["pui"+nom]+2
				_root["pui"+nom]=0
				situation=0; balle_t="joueur"
				_root["tps"+nom]=0;balle_t="joueur"
				ter.top._rotation=ter.fleche._rotation-90-(5-random(10))
			}
		}else if(_root["pui"+nom]==0){
			_root["vit"+nom]=0
			if (Key.isDown(Key.RIGHT)&&ter.fleche._rotation<65) ter.fleche._rotation++;
			if (Key.isDown(Key.LEFT)&&ter.fleche._rotation>-65)  ter.fleche._rotation--;
			ter[nom]._x=0;  ter[nom]._y=-340;  ter[nom]._rotation=0;  repos(nom)
			ter.fleche._visible=true
			ter.fleche._x=ter.top._x
			ter.fleche._y=ter.top._y
			ter.top._x=0;    ter.top._y=-410;  pos=0;  top_vit=0
		}
	}else if(situation=="engagement_joueur"){
		ter[nom]._x=10;  ter[nom]._y=0;  top_vit=0;  ter[nom]._rotation=-90; repos(nom)
		ter.top._x=0;   ter.top._y=0
		if(key_b&&_root["vitj1"]==0){
			pos=nom
			_root["pre_passe"+nom]=true
			ter.top._rotation= ter[nom]._rotation-90
			balle_t="joueur"
			
		}

	}else if(situation=="engagement_ordi"){
		if(this._y<0) this._y=0
	}else{
		_root["vit"+nom]=0;  repos(nom);
	}
	jauge.jauge2._xscale=_root["pui"+nom]*10

}

/*---------------------------------------------------------
----------------------------------------------------*/
marquage2=["o2","o3","o0","o1"]
formationx5=[-40,100,100,-100];     formationy5=[0,100,350,350]
formationpx2=[-100,100,100,-100];   formationpy2=[200,200,350,350]

function libre(nom){

	if(situation!=0){
		ter[nom]._yscale=14;  ter[nom].gotoAndStop(1)
		if(ter.top._y>0) {formationy=[200,200,450,450];   formationx=[-70,70,60,-60]}
		else {formationy=[-450,-450,0,0];   formationx=[-50,50,80,-80]}
	}
	
		
	if(situation==0|situation.charAt(0)=="f"){
		_root["tps"+nom]++
	
		//TACLE
		if(_root["tacle"+nom]){
			tacle(nom)
		//CHUTE
		}else if(_root["chute"+nom]){
			chute2(nom)
		}else if(_root["pre_chute"+nom]){
			chute(nom);  pos=0
			_root["vit"+nom]=4
		//ACTION OFFENSIVE
		}else if(pos.charAt(0)=="j"){
			_root["dest_y"+nom]=formationy[nom.charAt(1)]+ter.top._y/20
			_root["dest_x"+nom]=formationx[nom.charAt(1)]	
		}else if(pos==0){
			if(balle_t=="ordi"){
				if(joueur_proche==nom){
					balle_ant(nom)
				}else{
					if(marquage2[nom.charAt(1)]!=0){
						//L ordi marque le joueur qui na pa la balle
						_root["dest_x"+nom]=ter[marquage2[nom.charAt(1)]]._x
						_root["dest_y"+nom]=ter[marquage2[nom.charAt(1)]]._y+30	
					}
				}
			}else if(joueur_proche==nom){
				if(ter.ind_balle._visible==false){
					_root["dest_x"+nom]=ter.top._x+(Math.sin(conv_rad(ter.top._rotation+90))*top_m*4)
					_root["dest_y"+nom]=ter.top._y-(Math.cos(conv_rad(ter.top._rotation+90))*top_m*4)
				}else{
					_root["dest_x"+nom]=ter.ind_balle._x
					_root["dest_y"+nom]=ter.ind_balle._y
				}
			}else{
				_root["dest_y"+nom]=formationy[nom.charAt(1)]
				_root["dest_x"+nom]=formationx[nom.charAt(1)]
			}
		}else if(pos.charAt(0)=="o"){
			if(joueur_proche==nom){
				balle_ant(nom)
			}else{
				if(marquage2[nom.charAt(1)]!=0){
					//L ordi marque le joueur qui na pa la balle
					_root["dest_x"+nom]=ter[marquage2[nom.charAt(1)]]._x
					_root["dest_y"+nom]=ter[marquage2[nom.charAt(1)]]._y+30		
				}else{
					_root["dest_x"+nom]=formationx[nom.charAt(1)]
					_root["dest_y"+nom]=formationy[nom.charAt(1)]
				}
			}
		}else if(pos=="goal"){
			_root["dest_x"+nom]=ter[marquage2[nom.charAt(1)]]._x
			_root["dest_y"+nom]=ter[marquage2[nom.charAt(1)]]._y+30	
		}else if(pos=="goal2"){
			_root["dest_x"+nom]=formationx[nom.charAt(1)]
			_root["dest_y"+nom]=formationy[nom.charAt(1)]
		}
	
		//ACTION DEFENSIVES
		if(distance(nom,"top")<50){
		if(ter[nom].c.hitTest(ter.top)&&top_z<10&&_root["tps"+nom]>10&&bloquer==false&&bloquer2==false&&situation==0){
			pos=nom
			joueur_controle=nom	
		}
		}
	}else if(situation=="touche_con"){
		_root["dest_x"+nom]=formationtx[nom.charAt(1)]
		_root["dest_y"+nom]=formationty[nom.charAt(1)]
		
	}else if(situation=="touche"){
		if(marquage2[nom.charAt(1)]!=lanceur){
			_root["dest_x"+nom]=ter[marquage2[nom.charAt(1)]]._x
			_root["dest_y"+nom]=ter[marquage2[nom.charAt(1)]]._y+30		
		}else{
			_root["dest_x"+nom]=formationx[nom.charAt(1)]
			_root["dest_y"+nom]=formationy[nom.charAt(1)]
		}
	}else if(situation=="pre_ordi_corner"|situation=="ordi_corner"){
		_root["dest_x"+nom]=formationx[nom.charAt(1)]
		_root["dest_y"+nom]=formationy[nom.charAt(1)]

	}else if(situation=="pre_joueur_corner"|situation=="joueur_corner"){
		_root["dest_x"+nom]=formationx[nom.charAt(1)]
		_root["dest_y"+nom]=formationy[nom.charAt(1)]
	}else if(situation=="sixmetres_ordi"){
		formationx=[100,-100,50,-50];  formationy=[-100,-100,300,300]
		_root["dest_x"+nom]=formationx[nom.charAt(1)]
		_root["dest_y"+nom]=formationy[nom.charAt(1)]
	}else if(situation=="engagement_joueur"|situation=="engagement_ordi"){
		_root["dest_x"+nom]=formationx5[nom.charAt(1)]
		_root["dest_y"+nom]=formationy5[nom.charAt(1)]
	}else if(situation=="penalty_ordi"){
		_root["dest_x"+nom]=formationpx2[nom.charAt(1)]
		_root["dest_y"+nom]=formationpy2[nom.charAt(1)]
	}else if(situation=="penalty_joueur"){
		_root["dest_x"+nom]=formationpx1[3-nom.charAt(1)]
		_root["dest_y"+nom]=formationpy1[3-nom.charAt(1)]+30
	}else{
		repos(nom)
		_root["vit"+nom]=0
		_root["tacle"+nom]=false
		_root["chute"+nom]=false
		ter[nom].gotoAndStop(1)
		_root["pre_chute"+nom]=false	
		_root["pre_tacle"+nom]=false
	
	}
	//Action kan le but est OK et NON OK
		if(_root["dis"+nom]<10){
			_root["vit"+nom]=0
			_root["avance"+nom]=false	
			repos(nom)
		}else if(_root["chute"+nom]==false&&_root["tacle"+nom]==false){
			_root["vit"+nom]=4
			_root["avance"+nom]=true
			marcher(nom)
		}

	_root["protation"+nom]=Math.atan2( (ter[nom]._y-_root["dest_y"+nom]),(ter[nom]._x-_root["dest_x"+nom]))
		_root["protation"+nom]/=((Math.PI/180))
		_root["dis"+nom]=Math.sqrt(((ter[nom]._y-_root["dest_y"+nom])*(ter[nom]._y-_root["dest_y"+nom]))+((ter[nom]._x-_root["dest_x"+nom])*(ter[nom]._x-_root["dest_x"+nom])) )
	ter[nom]._rotation=_root["protation"+nom]-90
	
	//SI YA BUT ON TRIPPPP
	if(_root.situation=="joueur_but"){
		_root["dest_x"+nom]=_root.ter[_root.joueur_controle]._x-(nom.charAt(1)-1)*20
		_root["dest_y"+nom]=_root.ter[_root.joueur_controle]._y
		
	}
}



