onClipEvent (enterFrame) {
	//initialistion des variables
	rd=_root.conv_rad(r)
	protation=Math.atan2( (this._y-orienty),(this._x-orientx))
	protation/=((Math.PI/180))
	arret++
	dis=_root.distance(this._name,"top")
	dest_dis=Math.sqrt(((this._x-destx)*(this._x-destx))+((this._y-desty)*(this._y-desty)))
	for(x=0;x<=3;x++){
		if((this.c.hitTest(_root.ter["j"+x].j1)|this.c.hitTest(_root.ter["j"+x].j2))&&this._currentFrame==6){
			_root["pre_chutej"+x]=true
			if(_root.balle_touche>30){
				if(_root.ter["j"+x]._x>-175&&_root.ter["j"+x]._x<175&&_root.ter["j"+x]._y<-361) _root.situation="faute_ordi_p"
				else _root.situation="faute_ordi"
			}
			 _root.sortiey=ter["j"+x]._y;  _root.sortiex=ter["j"+x]._x
		}
	}
	tps++
	this._x += vit*Math.sin(rd)
	this._y -= vit*Math.cos(rd)
	if(_root.situation==0){
	if(tps>10){
	//COLLISION
	if(this._currentFrame==1&&plonger==false&&arret>10&&_root.top_z<17){
		if(this.bd.hitTest(_root.ter.top)|this.bg.hitTest(_root.ter.top)){
			penalty=false
			_root.balle_t="ordi"
			if(_root.top_vit<8) _root.bloquer=true
			else{
				_root.ter.top._rotation-=180+(40-random(80))
				_root.top_vit*=0.4
				_root.top_mz=random(10)/15	
				_root.tir.start();   
			}
			arret=0;prevision=3
		}
	boxer()
	
	//LORS D'UN TACLE
	
	}else if(this._currentFrame==6&&_root.ter.top.hitTest(this.c)&&_root.top_z<5){
		
		_root.balle_t="ordi";  
		_root.balle_touche=0
		if(this._y<_root.ter.top._y){
			_root.pos=0; _root.ter.top._rotation=this._rotation-90
			_root.top_vit=vit*2
			_root.tir.start(); 
		}else{
			_root.pos=0; _root.ter.top._rotation=this._rotation-(50-random(100))
			_root.top_vit=vit*2
			_root.tir.start(); 
		}
	
	}if(this._currentFrame==6&&_root.ter.top.hitTest(this.corps)&&_root.top_z<10){
		_root.balle_t="ordi"
		_root.pos=0; _root.ter.top._rotation=this._rotation+(50-random(100))
			_root.top_vit=vit*1.5
			_root.tir.start(); 
	//LORS D'UN PLONGEON
	}else{
		
		if((_root.ter.top.hitTest(this.bras)|_root.ter.top.hitTest(this.bras3))&&_root.bloquer==false&&arret>5){
			_root.balle_t="ordi"
			if(_root.top_vit<3){
				_root.top_vit=0
				_root.bloquer=true
			}else{
				_root.ter.top._rotation-=(180+(_root.ter.top._x-this._x)*2)+(40-random(80))
				_root.top_vit*=1-(random(8)/10);_root.ter.top._y++
				_root.tir.start(); 
				
			}
			arret=0
		}
	}
		
	//BLOQUER
	if(_root.bloquer&&plonger==false){
		_root.pos=this._name
	}
	}
	}
_root.penalty=penalty
if((_root.situation==0&&penalty==false)|_root.situation=="faute_ordi_p"){
	
	
	
	//ATTRIBUTION DE LA VARIABLE   ZONE	 
	if(_root.ter.top._y<0){	
		if(_root.ter.top._y>-500&&_root.ter.top._y<-455&&_root.ter.top._x>-77&&_root.ter.top._x<77) zone=1
		else if(_root.ter.top._y>-500&&_root.ter.top._y<-362&&_root.ter.top._x>-175&&_root.ter.top._x<175) zone=2
		else if(_root.ter.top._y>-500&&_root.ter.top._y<-362&&( (_root.ter.top._x>-325&&_root.ter.top._x<-175)|(_root.ter.top._x<325&&_root.ter.top._x>175))) zone=4
		else zone=3
	}else{
		if(_root.ter.top._y<500&&_root.ter.top._y>455&&_root.ter.top._x>-77&&_root.ter.top._x<77) zone=1
		else if(_root.ter.top._y<500&&_root.ter.top._y>362&&_root.ter.top._x>-175&&_root.ter.top._x<175) zone=2
		else if(_root.ter.top._y<500&&_root.ter.top._y>362&&( (_root.ter.top._x>-325&&_root.ter.top._x<-175)|(_root.ter.top._x<325&&_root.ter.top._x>175))) zone=4
		else zone=3
	}

	//ATTRIBUTION DE LA VARIABLE presence_def= 1 / 0  & PECHO
	for(x=0;x<=3;x++){
		if(x==0) dis_def=_root.distance("o"+x,this._name)
		else if(_root.distance("o"+x,this._name)<dis_def) dis_def=_root.distance("o"+x,this._name)
		if(x==0) dis_att=_root.distance("j"+x,"top")
		else if(_root.distance("j"+x,"top")<dis_att) dis_att=_root.distance("j"+x,"top")
	}
	if(dis_def<dis) presence_def=1
	else presence_def=0

	if(dis_att<dis) pecho=0
	else pecho=1

	

	//DEF DES OBJECTIF 1 et 2

	objectif1=Math.sqrt(((this._x)*(this._x))+((this._y+400)*(this._y+400)))
	objectif2=Math.sqrt(((this._x)*(this._x))+((this._y+745)*(this._y+745)))

	//ACTION A FAIRE SI LE GOAL TACLE
	if(tacle){
		this.gotoAndStop(6)
		if(vit>2) vit-=0.1*_root.fx
		else {tacle=false; this.gotoAndStop(1)}
		if(this._yscale<15) this._yscale++

	//COMPORTEMENT LORQUE L ADVERSAIRE A LA BALLE
	}else if(_root.pos.charAt(0)=="j"&&plonger==false){
		calcul=false
		//LA BALLE EST LOIN DS L AUTRE CAMP > SE PLACER A L'AVANT DES BUTS
		if(_root.ter.top._y>0){
			if(objectif1>10){destx=0; desty=-400;orientx=0;orienty=-400; vit=1;marcher()}
			else {vit=0; repos();orientx=_root.ter.top._x;orienty=_root.ter.top._y; this._rotation=protation-90}
			sit="balle loin"
		//LE GOAL EST EN FACE A FACE> SE DIRIGER VERS LA BALLE, TACLER KAN C PRES
		}else if((zone==2|zone==1)&&presence_def==0){
			destx=_root.ter.top._x+(Math.sin(_root.conv_rad(_root.ter.top._rotation+90))*_root.top_m*5)
			desty=_root.ter.top._y-(Math.cos(_root.conv_rad(_root.ter.top._rotation+90))*_root.top_m*5)
			orientx=destx;  orienty=desty
			vit=4;   marcher();   sit="faca a face"
			//TACLER!!!!
			
			if(_root.distance(this._name,"top")<60){
				batar=random(50)
				if(batar==0) {tacle=true; vit=4; this._yscale=13}
			}
		//DEFENSE ORGANISEE AV DEFENSEUR
		}else if((zone==2|zone==1)&&presence_def==1){
			//SE PLACER CONVENABLEMENT
			if(this._y>-490){
				marcher();  destx=_root.ter.top._x/2;  desty =-495;  vit=4;orientx=_root.ter.top._x/2; orienty=-495
				sit=" JE me replace...."
			}else{
			//BOUGER SUR SA LIGNE
				normal(3);  sit="presence de defenseur, normal"
			}
		}else if(zone==3){
			if(this._y>-490){
				marcher();  destx=0;  desty =-495;  vit=4;orientx=0; orienty=-495;sit="Je me replace"
			}else{
				normal(2);  sit="normal, balle ds le camp, mais loin"
			}
		}else if(zone==4){
			//SE PLACER AU MILIEU DES BUTS 
			if(this._y>-490|this._x>5|this._x<-10){
				marcher();  destx=0;  desty =-495;  vit=2;orientx=0; orienty=-495
			}else{
			//EN ATTENTE d4UN CENTRE
				vit=0;  rootballon();  repos()
				this._rotation=protation-90
			}
		}
	//COMPORTEMENT LORSQUE L'EQUIPE DU GOAL A LA BALLE
	}else if(_root.pos.charAt(0)=="o"&&plonger==false){
		this.gotoAndStop(1);  this.tete.gotoAndStop(1);  calcul=false
		//LE GOAL DOIT ETRE SUR SES GARDES
		if(this._y>-490){
				marcher();  destx=this._x;  desty =-495;  vit=3;orientx=this._x; orienty=-495
			}else{
			//SI PLACE	
				normal(3)
			}
			sit="le defenseur a la balle"

	//SI LA BALLE EST EN SOLO
	}else if(_root.pos==0){
		//REGARDER SI LA BALLE VA RENTRER
		
		if((zone==2|zone==1)&calcul==false){
			xdepart=_root.ter.top._x;  ydepart=_root.ter.top._y; rdepart=_root.ter.top._rotation
			for(x=0;x<=_root.top_vit/0.05;x++){
				if(x==0) {zmdepart=_root.top_mz; zdepart=_root.top_z}
				xdepart+=Math.cos( _root.conv_rad(rdepart))*_root.top_vit
				ydepart+=Math.sin( _root.conv_rad(rdepart))*_root.top_vit
				zdepart+=zmdepart;  zmdepart-=0.02
				if(ydepart<=-500){
					if(xdepart>-55&&xdepart<55&&zdepart<20&&_root.top_vit>2) prevision=1
					else prevision=0
					break	
				}else prevision=3
			}
			calcul=true
		}
		// SI ELLE SORT, LE GOAL SE PLACE NORMAL
		if(pecho==1&&prevision==3&&presence_def==0&&zone==1){
			rootballon(); vit=4
			marcher()
			sit="Je V la cherrcher!"
		}else if(prevision==0){
				rootballon()
				normalp(2)
				sit="LAISSE!!!!"

		}else if(prevision==1|plonger==true){
			if((dis<70&&_root.top_vit<7)|(dis<100&&_root.top_vit>7)|plonger==true){
				if(((Math.abs(this._x-xdepart)>60&&_root.top_vit>3))|plonger==true){
					//plonger a terre
					if(zdepart<5){
			 			if(xdepart>this._x)  plonger_bas_gauche()
						else  plonger_bas_droite()
			 		}else{
					//plonger en l'air
             			if(xdepart>this._x) plonger_haut_gauche()
						else  plonger_haut_droite()
			 		}
				}else if(plonger==false){
		   			sit="je v la prendre"
					normalp(4)
					this.gotoAndStop(1)
				}
			}else if(plonger==false){
				normalb(4);vit_plonger=4;
				this.gotoAndStop(1);  sit="prepare"
			}
		}else{
			if(this._y>-490){
				marcher();  destx=0;  desty =-495;  vit=4;orientx=0; orienty=-495;sit="Replacage"
			}else{
			//SI PLACE	
				normal(4)
				sit="OK"
			}
		}
		
		
	}else if(_root.pos==this._name){
		prevision=3
		_root.top_z=0
		sit="J'ai la balle";  this.tete.gotoAndStop(1)
		orientx=0;orienty=-400
		r=this._rotation; rd=_root.conv_rad(r)
		_root.ter.top._y=this._y-(Math.cos(rd)*7)
		_root.ter.top._x=this._x+(Math.sin(rd)*7)
		_root.ter.top._rotation=this._rotation-90
		this.bg._rotation=220;this.bg.av._rotation=30
		this.bd._rotation=-40;this.bd.av._rotation=30
		tps++
		if(objectif1>10) {
			vit=3;marcher()
			tps=0
		}else {
			if(tps>20){
				_root.top_vit=6
				_root.tir.start(); 
				_root.pos=0
				tps=0
				_root.bloquer=false
				_root.top_mz=1.2
				_root.ter.top._rotation=90+(20-random(40))
				_root.indice_balle()
			}else{
				vit=0;repos(); this._rotation=180
			}
		}
	}
	if(prevision==3) this.tete.gotoAndStop(1)
		pre_metre=false
	//PENALTY
	}else if(_root.situation=="ordi_sixmetres"){
		_root.top_vit=0
		_root.balle_t="ordi"
		if(pre_metre==false) { orientx=_root.ter.top._x;     orienty=-480;  destx=_root.ter.top._x;  desty=-480}
		
		if(dest_dis>5&&pre_metre==false){
		 vit=4; marcher(); tps=0
		}else if(tps<50){
			 vit=0; repos()
			this._rotation=180
			tps++
		}else{
			pre_metre=true
			orientx=_root.ter.top._x;     orienty=_root.ter.top._y;  destx=_root.ter.top._x;  desty=_root.ter.top._y
			vit=4; marcher()
			if(_root.distance(this._name,"top")<5){
				orientx=this._x;  orienty=this._y+50 ; destx=orientx;  desty=orienty
				_root.top_vit=8  ;  _root.top_mz=1
				_root.tir.start(); 
				_root.situation=0;   tps=0
				_root.ter.top._rotation=90
				_root.indice_balle()
			}
		}
	}else if(_root.situation=="penalty_joueur"){
		if(_root.top_vit==0){
			this._x=0; this._y=-490;  this._rotation=180;  repos();penalty=true
			vit_plonger=3;  ran=random(11); tps=0; vit=0
		}
	}else if(_root.situation==0&&penalty){
		if(tps>30) penalty=false
		if(ran<5) plonger_bas_gauche()
		else if(ran>5) plonger_bas_droite()
		if(plonger){
			if(vit_plonger>0) vit_plonger-=0.1
			else {this.gotoAndStop(1);plonger=false;prevision=3;penalty=false}
		}
	}else{
		pbg1=true; pbd1=true;phg1=true; phd1=true
		this.gotoAndStop(1)
		
		this.tete._x=0
		if(dest_dis>5){
			orientx=0;     orienty=-480;  destx=0;  desty=-480
			marcher(); vit=3
		}else{
			vit=0;  repos(); orienty=_root.ter.top._y ;orientx=_root.ter.top._x
		}
		 _root.bloquer=false
	}
if(plonger){
			if(vit_plonger>2) vit_plonger-=0.1
			else {this.gotoAndStop(1);plonger=false;prevision=3}
		}
_root.af=sit
sit=" "

}
//--------------------LES FUNCTION------------------

onClipEvent (load) {
	pre_metre=false
	penalty=false
	vit_plonger=0;  _root.bloquer=false;  plonger=false;  tacle=false; prevision=3;pecho=0
	pbg1=true; pbd1=true;phg1=true; phd1=true
	oldpgx=this.pg._x;  oldpdx=this.pd._x
	oldpgy=this.pg._y;  oldpdy=this.pd._y
	oldrjd=this.jd._rotation;  oldrjg=this.jg._rotation

	function plonger_haut_gauche(){
		plonger=true
		this.tete._xscale=100
		this._x+=vit_plonger
		if(phg1){
			if(this.tete._x>-25) this.tete._x-=3
			else {phg1=false;this.bras._xscale=0}
			this.tete.nextFrame()
			if(this.bd.av._rotation<110) this.bd.av._rotation+=15
			if(this.bg.av._rotation<90) this.bg.av._rotation+=15
			if(this.bg.av._xscale>0) {this.bg.av._xscale-=15;this.bg.av._yscale-=15}
			this.jg._rotation=0;this.jd._rotation=180;
			if(this.jd._xscale<200) this.jd._xscale+=20
			this.pg._x=oldpgx-(this.jg._xscale-90)/2
			this.pd._x=oldpdx+(this.jd._xscale-90)/2
		}else{
			this.bras3._yscale=-100
 			this.gotoAndStop(5)
			if(this.bras3._xscale>-80) {this.bras3._xscale-=40;}
		}
	}

	function plonger_haut_droite(){
		this.tete._xscale=-100;plonger=true
		this._x-=vit_plonger
		if(phd1){
			if(this.tete._x<25) this.tete._x+=3
			else {phd1=false;this.bras._xscale=0}
			this.tete.nextFrame()
			if(this.bd.av._rotation<110) this.bd.av._rotation+=15
			if(this.bg.av._rotation<90) this.bg.av._rotation+=15
			if(this.bg.av._xscale>0) {this.bg.av._xscale-=15;this.bg.av._yscale-=15}
			this.jg._rotation=0;this.jd._rotation=180;
			if(this.jg._xscale<200) this.jg._xscale+=20
			this.pg._x=oldpgx-(this.jg._xscale-90)/2
			this.pd._x=oldpdx+(this.jd._xscale-90)/2
		}else{
			this.bras3._yscale=-100
 			this.gotoAndStop(4)
			if(this.bras3._xscale>-80) {this.bras3._xscale-=40;}
		}
	}

	function plonger_bas_droite(){
		this.tete._xscale=-100;plonger=true
		this._x-=vit_plonger
		sit="PLONGER a droite"
		if(pbd1){
			if(this.tete._x<25) this.tete._x+=3
			else {pbd1=false;this._xscale=14}
			this.tete.nextFrame()
			if(this.bd.av._rotation<110) this.bd.av._rotation+=15
			if(this.bg.av._rotation<90) this.bg.av._rotation+=15
			this.jg._rotation=0;this.jd._rotation=180;
			if(this.jg._xscale<400) this.jg._xscale+=50
			this.pg._x=oldpgx-(this.jg._xscale-90)/2
			this.pd._x=oldpdx+(this.jd._xscale-90)/2
		}else {
			this.gotoAndStop(3)
			if(this._xscale<15) this._xscale++
		}
	}

	function plonger_bas_gauche(){
		this._x+=vit_plonger;plonger=true
		this.tete._xscale=100
		sit="PLONGER a gauche"
		if(pbg1){
			if(this.tete._x>-25) this.tete._x-=3
			else {pbg1=false;this._xscale=12.5}
			this.tete.nextFrame()
			if(this.bg.av._rotation<110) this.bg.av._rotation+=15
			if(this.bd.av._rotation<90) this.bd.av._rotation+=15
			this.jg._rotation=0;this.jd._rotation=180;
			if(this.jd._xscale<400) this.jd._xscale+=50
			this.pg._x=oldpgx-(this.jg._xscale-90)/2
			this.pd._x=oldpdx+(this.jd._xscale-90)/2
		}else {
			this.gotoAndStop(2)
			if(this._xscale<15) this._xscale++
		}
	}
function rootballon(){
	orientx=_root.ter.top._x;orienty=_root.ter.top._y
	destx=_root.ter.top._x;  desty=_root.ter.top._y
}
function normal(v){
	orientx=_root.ter.top._x;  orienty=_root.ter.top._y
	this._rotation=protation-90;  vit=0

	if(this._x<(_root.ter.top._x-10)/3){
		if(this._x<70) {this._x+=v;pas_chasse_gauche()}
	}else if(this._x>(_root.ter.top._x+10)/3){
		if(this._x>-70) {this._x-=v;pas_chasse_droite()}
	}else repos();
}
function normalp(v){
	orientx=_root.ter.top._x;  orienty=_root.ter.top._y
	this._rotation=protation-90;  vit=0

	if(this._x<(xdepart-1)){
		if(this._x<70) {this._x+=v;pas_chasse_gauche()}
	}else if(this._x>(xdepart+1)){
		if(this._x>-70) {this._x-=v;pas_chasse_droite()}
	}else repos();
}
function normalb(v){
	orientx=_root.ter.top._x;  orienty=_root.ter.top._y
	this._rotation=protation-90;  vit=0

	if(this._x<(_root.ter.top._x-4)){
		if(this._x<70) {this._x+=v;pas_chasse_gauche()}
	}else if(this._x>(_root.ter.top._x+4)){
		if(this._x>-70) {this._x-=v;pas_chasse_droite()}
	}else repos();
}
function marcher(){
	r=this._rotation
	this._rotation=protation-90
	a+=vit/10
	this.jg._rotation=-90
	this.jd._rotation=90
	this.bg._y=20-(Math.cos(a)*90)/10
	this.bd._y=20-(Math.sin(a-2)*90)/10
	this.jg._xscale=10+(Math.sin(a+1.2)*90)
	this.jd._xscale=10+(Math.cos(a)*90)
	this.corps._rotation=(Math.cos(a)*10)
	//LES PIEDS SONT AU BOU DES JAMBES!!!
	this.pg._y=oldpgy+(this.jg._xscale)/2
	this.pd._y=oldpdy-(this.jd._xscale)/2
	this.pd._x=oldpdx-50
	this.pg._x=oldpgx+50
}

function pas_chasse_gauche(){	
	
	a+=0.2
	this.jg._xscale=(Math.cos(a))*70
	this.jd._xscale=(Math.cos(a))*40
	//LES PIEDS SONT AU BOU DES JAMBES!!!
	this.pg._x=oldpgx-(this.jg._xscale-90)/2
	this.pd._x=oldpdx+(this.jd._xscale-90)/2
	r=this._rotation+90
	this.pg._y=oldpgy;  this.jg._rotation=oldrjg
	this.pd._y=oldpdy;  this.jd._rotation=oldrjd
}
function pas_chasse_droite(){	
	this.pg._y=oldpgy;  this.jg._rotation=oldrjg
	this.pd._y=oldpdy;  this.jd._rotation=oldrjd
	r=this._rotation
	a+=0.2
	this.jg._xscale=(Math.cos(a))*40
	this.jd._xscale=(Math.cos(a))*70
	//LES PIEDS SONT AU BOU DES JAMBES!!!
	this.pg._x=oldpgx-(this.jg._xscale-90)/2
	this.pd._x=oldpdx+(this.jd._xscale-90)/2
}
function repos(){
		if(this.jg._xscale>-20) this.jg._xscale-=16
		if(this.jg._xscale<-20) this.jg._xscale+=16
		if(this.jd._xscale>-20) this.jd._xscale-=15
		if(this.jd._xscale<-20) this.jd._xscale+=15
		this.pg._x=oldpgx-(this.jg._xscale-90)/2
	this.pd._x=oldpdx+(this.jd._xscale-90)/2
	//LES PIEDS SONT AU BOU DES JAMBES!!!
	this.pg._y=oldpgy+(this.jg._xscale)/2
	this.pd._y=oldpdy-(this.jd._xscale)/2
	this.pd._x=oldpdx-50
	this.pg._x=oldpgx+50
}
	function boxer(){
		if(arret<3) {
			this.bg._rotation=260;this.bg.av._rotation=90
			this.bd._rotation=-90;this.bd.av._rotation=90
		}else{
			this.bg._rotation=160;this.bg.av._rotation=0
			this.bd._rotation=20;this.bd.av._rotation=0
		}
	}
}

