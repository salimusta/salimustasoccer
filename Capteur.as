onClipEvent (enterFrame) {
	tps2++
		tps++
		
		
	if(_root.distance("top","but2")<300){
		protation=Math.atan2 ( (this._y-_root.ter.top._y), (this._x-_root.ter.top._x) )
			protation/=(Math.PI/180)
		psit=90-Math.abs(_root.ter.top._rotation-protation)
	
		protation2=Math.atan2 ( (_root.ter.potobd._y-_root.ter.top._y), (_root.ter.potobd._x-_root.ter.top._x) )
			protation2/=(Math.PI/180)
		psit2=90-Math.abs(_root.ter.top._rotation-protation2)
		
		
		if(_root.distance(this._name,"top")<((this._height/2)+(_root.ter.top._height/2)+(_root.top_vit*(psit/130)))&&tps>5&&_root.top_z<17){
			//protation=Math.atan2 ( (this._y-_root.ter.top._y), (this._x-_root.ter.top._x) )
			//protation/=(Math.PI/180)
			
			a=_root.ter.top._rotation
			tr=protation
			dtra=(a-tr)*-2
			_root.ter.top._rotation=_root.ter.top._rotation+dtra+180
			tps=0
			_root.top_vit*=0.8
			_root.poto.start()
			_root.ter.flash._alpha=100 ; _root.ter.flash._x=_root.ter.top._x ;_root.ter.flash._y=_root.ter.top._y 
			
		}else if(_root.distance("potobd","top")<((_root.ter.potobd._height/2)+(_root.ter.top._height/2)+(_root.top_vit*(psit2/130)))&&tps>5&&_root.top_z<17){
			//protation=Math.atan2 ( (_root.ter.potobd._y-_root.ter.top._y), (_root.ter.potobd._x-_root.ter.top._x) )
			//protation/=(Math.PI/180)
			a=_root.ter.top._rotation
			tr=protation2
			dtra=(a-tr)*-2
			_root.ter.top._rotation=_root.ter.top._rotation+dtra+180
			tps=0
			_root.top_vit*=0.8
			_root.poto.start()
			_root.ter.flash._alpha=100 ; _root.ter.flash._x=_root.ter.top._x ;_root.ter.flash._y=_root.ter.top._y 
		}
	
		
		if(_root.ter.petifiletbg.hitTest(_root.ter.top)&&tps2>10&&_root.top_z<17){
			_root.ter.top._rotation=180-_root.ter.top._rotation; 
			tps2=0;
			_root.top_vit*=0.5
		}else if(_root.ter.petifiletbd.hitTest(_root.ter.top)&&tps2>10&&_root.top_z<17){
			_root.ter.top._rotation=180-_root.ter.top._rotation; 
			tps2=0
			_root.top_vit*=0.5
		}
	}
}
