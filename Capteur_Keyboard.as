onClipEvent (keyDown) {
	if(Key.getAscii()==110|Key.getAscii()==78) _root.key_n=true
	if(Key.getAscii()==98|Key.getAscii()==66) _root.key_b=true
	if(Key.getAscii()==118|Key.getAscii()==86) _root.key_v=true
	if(Key.getAscii()==106) _root.situation="faute_joueur_p"
}
onClipEvent (keyUp) {
	if(Key.getAscii()==110|Key.getAscii()==78) _root.key_n=false
	if(Key.getAscii()==98|Key.getAscii()==66) _root.key_b=false	
	if(Key.getAscii()==118|Key.getAscii()==86) _root.key_v=false
}
onClipEvent (load) {
minutes="00";  secondes=0
mi_temps=1
_root.situation="0"
}
onClipEvent (enterFrame) {
	
	//ACTION SPECIALE
	if(Key.isDown(Key.CONTROL)&&Key.isDown(Key.HOME)&&Key.isDown(Key.INSERT)){
		for(x=0;x<=3;x++){
			_root["pre_chuteo"+x]=true
		}
	}
	if(minutes>=2){
	if(mi_temps==1){
		mi_temps++
		_root.pos=0
		_root.ter._rotation=180
		_root.ter._x=275;  _root.ter._y=200
		_root.radar._rotation=180
		_root.situation="engagement_ordi"
		minutes=0
		secondes=0
		_root.top_vit=0
		_root.ter.top._x=0;_root.ter.top._y=0
		_root.tpso1=0
	}else if(mi_temps==2){
		_root.nextFrame()
	}
	}
	//GESTION DU TEMPS
	if(_root.situation==0)  time++
	if(time>=30) {time=0;secondes++}
	if(secondes>=60) {minutes++;secondes=0}
	if(secondes<10&&secondes.length<=1) secondes="0"+secondes
	
	_root.time=minutes+" : "+secondes

	//AFFICHAGE DE L FPS
	new_time=getTimer() 
	dif_time=new_time-old_time
	_root.fps=int((1000/dif_time)*10)/10
	num++
	moy+=_root.fps
	_root.moyenne=int((moy/num)*10)/10
	old_time=getTimer() 
	sit=_root.situation
	//SORTIES

	if(_root.situation!=0) _root.game_tps++
	else _root.game_tps=0
	if(_root.game_tps>50){
		
		if(sit.charAt(0)=="b"){
			if(sit.charAt(4)=="j"){
					_root.top_vit=0
					_root.score1++
					_root.situation="joueur_but"
				_root.top_vit=0
			}else if(sit.charAt(4)=="o"){
					_root.score2++
					_root.situation="ordi_but"
					_root.top_vit=0
			}
		}else if(sit.charAt(0)=="t"){
			//TOUCHE
			if(sit.charAt(7)=="j"){
				//touche pour le joueur
				_root.ter.top._y=_root.sortiey
				_root.ter[_root.joueur_proche]._y=_root.sortiey
				_root.situation="touche_con"
				//touche pour l'ordi
			}else if(sit.charAt(7)=="o"){
				_root.ter.top._y=_root.sortiey
				_root.ter[_root.lanceur]._y=_root.sortiey
				_root.situation="touche"
				_root["tps"+_root.lanceur]=0
			}
		}else if(sit.charAt(0)=="s"){
			if(sit.charAt(10)=="j"){ 
				_root.ter.top._x=75-random(150)
				_root.ter.top._y=455
				_root.situation="joueur_sixmetres"
			}else if(sit.charAt(10)=="o"){ 
				_root.ter.top._x=75-random(150)
				_root.ter.top._y=-455
				_root.situation="ordi_sixmetres"
			}
		}else if(sit.charAt(0)=="c"){
			if(sit.charAt(7)=="j"){ 
				if(_root.ter.top._x<0) {_root.ter.top._x=-325;  _root.ter.top._rotation=90}
				else {_root.ter.top._x=325;   _root.ter.top._rotation=270}
				_root.ter.top._y=-500
				_root.situation="joueur_corner"
			}else if(sit.charAt(7)=="o"){ 
				if(_root.ter.top._x<0) _root.ter.top._x=-325
				else _root.ter.top._x=325
				_root.ter.top._y=500
				_root.situation="pre_ordi_corner"
			}
		}else if(sit.charAt(0)=="f"){
			//le joueur a fait une faute
			if(sit.charAt(6)=="j"){ 
				//penalty
				if(sit.charAt(13)=="p"){ 
					_root.situation="penalty_ordi"
				}else{
					_root.situation="coupfranc_ordi"
				}
			}else if(sit.charAt(6)=="o"){ 
				//penalty
				if(sit.charAt(11)=="p"){ 
					_root.situation="penalty_joueur"
				}else{
					_root.situation="coupfranc_joueur"
				}
			}
		}
	}
	
}