//-----------------GENERAL-------------------------
stop()
//intialisation
pos=0
ordi_controle=0
fx=1.6
situation="engagement_joueur"

equipe=["France","Turquie","Italie","Belgique","Allemagne","Espagne","Portugal","Angleterre","Bresil","Grece","Irlande","Hollande","Roumanie","Bulgarie","Lettonie","Russie","Japon","Chine","Maroc","Tunisie","Algerie","Egypte","Afrique_du_Sud","Nigeria","Cameroun","Senegal","Etats_Unis","Mexique","Canada","Argentine"]


for(x=0;x<=40;x++){
	equ=equipe[x]
	if(equ==equipe1){
		_root[equ+"_maillo"]=_root[equ+maillo.charAt(0)][0]
		_root[equ+"_maillo2"]=_root[equ+maillo.charAt(0)][1]
		_root[equ+"_short"]=_root[equ+maillo.charAt(0)][2]
		_root[equ+"_chaussette"]=_root[equ+maillo.charAt(0)][3]
	}else if(equ==equipe2){
		_root[equ+"_maillo"]=_root[equ+maillo.charAt(1)][0]
		_root[equ+"_maillo2"]=_root[equ+maillo.charAt(1)][1]
		_root[equ+"_short"]=_root[equ+maillo.charAt(1)][2]
		_root[equ+"_chaussette"]=_root[equ+maillo.charAt(1)][3]
	}
}

//Chaussures
for(x=0;x<=3;x++){
	_root["chaussure_j"+x]=random(5)+1
	_root["chaussure_o"+x]=random(5)+1
	_root["coupe_j"+x]=random(8)+1
	_root["coupe_o"+x]=random(8)+1
}
chaussure_j0=2


function couleur_maillo2(n,m){
	if(n.charAt(n)=="j"){
		c=new Color(m)
		c.setTransform(_root[equipe1+"_maillo2"])
	}else if(n.charAt(n)=="o"){
		c=new Color(m)
		c.setTransform(_root[equipe2+"_maillo2"])
	}
}
function couleur_chaussette(n,m){
if(n.charAt(n)=="j"){
		c=new Color(m)
		c.setTransform(_root[equipe1+"_chaussette"])
	}else if(n.charAt(n)=="o"){
		c=new Color(m)
		c.setTransform(_root[equipe2+"_chaussette"])
	}
}
function couleur_short(n,m){
	if(n.charAt(n)=="j"){
		c=new Color(m)
		c.setTransform(_root[equipe1+"_short"])
	}else if(n.charAt(n)=="o"){
		c=new Color(m)
		c.setTransform(_root[equipe2+"_short"])
	}
}


function couleur_maillo(n,m){
	if(n.charAt(n)=="j"){
		c=new Color(m)
		c.setTransform(_root[equipe1+"_maillo"])
	}else if(n.charAt(n)=="o"){
		c=new Color(m)
		c.setTransform(_root[equipe2+"_maillo"])
	}

}

//SON

passe=new Sound()
passe.attachSound("passe")
tir=new Sound()
tir.attachSound("tir")
rebond=new Sound()
rebond.attachSound("rebond")
poto=new Sound()
poto.attachSound("poto")
sifflet=new Sound()
sifflet.attachSound("sifflet")
poitrine=new Sound()
poitrine.attachSound("poitrine")

for(x=1;x<=4;x++){
_root["chuteson"+x]=new Sound()
_root["chuteson"+x].attachSound("chute"+x)
}


/*function init(nom){
	 _root["vit"+nom]=0
	_root["tir"+nom]=false;  
	_root["pre_tir"+nom]=false; 
	_root["passe"+nom]=false;  
	_root["pre_passe"+nom]=false; 
	_root["pre_centre"+nom]=false;  
	_root["centre"+nom]=false
	_root["tacle"+nom]=false; 
	_root["pui"+nom]=0
	_root["y"+nom]=ter[nom].pg._y
	_root["y2"+nom]=ter[nom].bg._y
	_root["pre_chute"+nom]=false
	_root["chute"+nom]=false
}*/
	/*function chute(nom){
		if(ter[nom].bd._yscale<140) ter[nom].bd._yscale+=40
		if(ter[nom].bg._yscale<140) ter[nom].bg._yscale+=40
		else {_root["chute"+nom]=true;ter[nom]._yscale=12}
		ter[nom].bg._rotation=0
		ter[nom].bd._rotation=0
		if(ter[nom].j1._yscale>-150) ter[nom].j1._yscale-=60
		if(ter[nom].j2._yscale>-150) ter[nom].j2._yscale-=60
		
	}
	function lever_jambe(nom){
			if(ter[nom].corps._rotation<10) ter[nom].corps._rotation+=8
			if(ter[nom].bd._rotation>-20) ter[nom].bd._rotation+=20
			if(ter[nom].bd._yscale<100) ter[nom].bd._yscale+=40
			if(ter[nom].bg._yscale<110) ter[nom].bg._yscale+=40
			if(ter[nom].bg._rotation<50) ter[nom].bg._rotation+=20
			if(ter[nom].j1._yscale>-100) ter[nom].j1._yscale-=80
	}

	function jambe_tir(nom){
		if(ter[nom].corps._rotation>-10) ter[nom].corps._rotation-=2
			if(ter[nom].j1._yscale<150) ter[nom].j1._yscale+=40
			if(ter[nom].bg._rotation>-50) ter[nom].bg._rotation-=15
			if(ter[nom].bd._rotation<20) ter[nom].bd._rotation-=5
			if(ter[nom].j2._yscale>-100) ter[nom].j2._yscale-=10
	}*/
/*	function marcher(nom){
		ter[nom].bg._yscale=10+(Math.cos(_root["a"+nom])*100)
		ter[nom].bd._yscale=10+(Math.sin(_root["a"+nom]-2)*100)
		ter[nom].j1._yscale=10+(Math.sin(_root["a"+nom]-2)*120)
		ter[nom].j2._yscale=10+(Math.cos(_root["a"+nom])*120)
		ter[nom].corps._rotation=(Math.cos(_root["a"+nom])*10)
		ter[nom].bg._rotation=0; ter[nom].bd._rotation=180
		_root["a"+nom]+=_root["vit"+nom]/13
	}*/
	/*function repos(nom){
		if(ter[nom].bg._yscale>0) ter[nom].bg._yscale-=3
		if(ter[nom].bg._yscale<0) ter[nom].bg._yscale+=3
		if(ter[nom].bd._yscale>0) ter[nom].bd._yscale-=3
		if(ter[nom].bd._yscale<0) ter[nom].bd._yscale+=3
		if(ter[nom].j1._yscale>20) ter[nom].j1._yscale-=16
		if(ter[nom].j1._yscale<20) ter[nom].j1._yscale+=16
		if(ter[nom].j2._yscale>20) ter[nom].j2._yscale-=15
		if(ter[nom].j2._yscale<20) ter[nom].j2._yscale+=15
		if(ter[nom].corps._rotation>0) ter[nom].corps._rotation-=2
		if(ter[nom].corps._rotation<0) ter[nom].corps._rotation+=2
		ter[nom].pg._rotation=0
		ter[nom].bg._rotation=45; ter[nom].bd._rotation=180
	}*/
	/*function jambe_passe(nom){
		if(ter[nom].corps._rotation>-10) ter[nom].corps._rotation-=2
		if(ter[nom].j1._yscale<140) ter[nom].j1._yscale+=50
		if(ter[nom].bg._rotation>-50) ter[nom].bg._rotation-=15
		if(ter[nom].bd._rotation<20) ter[nom].bd._rotation-=5
		if(ter[nom].j2._yscale>-100) ter[nom].j2._yscale-=20
		ter[nom].pg._rotation=-45
	
	}*/
//Definition des fonctions
/*function conv_rad(angle){
	return 2.0*Math.PI*(angle)/360.0
}
function conv_deg(angle){
	return (360*angle)/2.0*Math.PI
}*/
/*function distance(obj1,obj2){
	fdx=ter[obj1]._x-ter[obj2]._x
	fdy=ter[obj1]._y-ter[obj2]._y
	return Math.sqrt((fdx*fdx)+(fdy*fdy))
}*/
function balle_ant(nom){
	_root["dest_x"+nom]=ter.top._x+(Math.sin(_root.conv_rad(ter.top._rotation+90))*top_m*6)
	_root["dest_y"+nom]=ter.top._y-(Math.cos(_root.conv_rad(ter.top._rotation+90))*top_m*6)
}
function indice_balle(){
	nb_image=(top_mz/0.03)*2      
	ter.ind_balle._x=ter.top._x;ter.ind_balle._y=ter.top._y;ter.ind_balle._rotation=ter.top._rotation
	ter.ind_balle._x+=Math.cos( conv_rad(ter.ind_balle._rotation))*nb_image*top_vit
	ter.ind_balle._y+=Math.sin( conv_rad(ter.ind_balle._rotation))*nb_image*top_vit
	ter.ind_balle._visible=true
	reset_tps()
}
/*function tacle(nom){
	if(ter[nom]._currentFrame==1) { _root["vit"+nom]=5;  ter[nom]._yscale=7;  ter[nom].gotoAndStop(2) }	
	if(ter[nom]._yscale<14) ter[nom]._yscale++
	if(_root["vit"+nom]>1) _root["vit"+nom]-=0.2
	else { _root["tacle"+nom]=false;  ter[nom].gotoAndStop(1) }
}
function chute2(nom){
if(_root["vit"+nom]>0) _root["vit"+nom]-=0.5
		if(ter[nom]._yscale<14) ter[nom]._yscale++
		ter[nom].gotoAndStop(3)
		if( _root["tps"+nom]>=20) {_root["chute"+nom]=false;ter[nom].gotoAndStop(1);_root["pre_chute"+nom]=false}
}*/
//JOIIIIIIIIIIIIIIIIIIIIIII----------------------
function joie(nom){
		 ter[nom].bg._rotation=-111
		 ter[nom].bd._rotation=-70
		ter[nom].bd._yscale=130
		ter[nom].bg._yscale=130
	}

function flecher(nom){
ter.fleche._visible=true
ter.fleche._x=ter.top._x
ter.fleche._y=ter.top._y
ter.fleche._rotation=ter[nom]._rotation
}
function ai_passe(nom){
ter.test._x=ter[nom]._x;  ter.test._y=ter[nom]._y;  ter.test._visible=false
			receveur=new Array()
			for(x=0;x<=3;x++){
				if(x!=nom.charAt(1)){
					ter.test._rotation=((Math.atan2( (ter[nom]._y-ter["o"+x]._y),(ter[nom]._x-ter["o"+x]._x)))/((Math.PI/180)))-180
					ter.test._xscale=distance(nom,"o"+x)
					for(x=0;x<=3;x++){
						if(x!=nom.charAt(1)){
							if(ter.test.hitTest(ter["j"+x])) true
							else if(distance("o"+x,nom)<700&&ter["o"+x]._y>ter[nom]._y) receveur.push("o"+x)
						}
					}
					if(receveur.length<1){		
						for(x=0;x<=3;x++){
							if(x!=nom.charAt(1)){
								if(ter.test.hitTest(ter["j"+x])) true
								else if(distance("o"+x,nom)<400) receveur.push("o"+x)
							}
						}		
					}
				}
			}

}

function marquage(nom){
		_root["dest_x"+nom]=ter[marquage[nom.charAt(1)]]._x
		_root["dest_y"+nom]=ter[marquage[nom.charAt(1)]]._y-30
}
function reset_tps(){
	for(x=0;x<=3;x++){
		_root["tpso"+x]=0
		_root["tpsj"+x]=0
	}
}
