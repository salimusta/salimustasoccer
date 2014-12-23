onClipEvent (enterFrame) {
	if (_root.situation == "ordi_but" | _root.situation == "joueur_but") {
		this._visible = true;  this.gotoAndStop(1)
		tps++
		
		
		if(tps>150){
			//INITIALISATION DU JEU
			_root.ter.top._x=0;  _root.ter.top._y=0
			_root.ter._x=275;  _root.ter._y=200
			_root.ter._xscale=_root.ter._yscale=1000
			if (_root.situation == "ordi_but") _root.situation="engagement_joueur"
			if (_root.situation == "joueur_but") _root.situation="engagement_ordi"
			_root.tpso1=0
			_root.top_vit=0;  _root.pos=0
		}
	}else if (_root.situation.charAt(13)=="p"|_root.situation.charAt(11)=="p") {
		this._visible = true;  this.gotoAndStop(2);  this.affi="PENALTY!!"
	} else if (_root.situation.charAt(0)=="s") {
		this._visible = true;  this.gotoAndStop(2);  this.affi="Six metres.."
	}else if (_root.situation.charAt(0)=="f") {
		this._visible = true;  this.gotoAndStop(2);  this.affi="Coup franc!"
	}else if (_root.situation.charAt(0)=="c"&&_root.situation.charAt(2)!="u") {
		this._visible = true;  this.gotoAndStop(2);  this.affi="Corner!"
	}else if (_root.situation.charAt(0)=="t") {
		this._visible = true;  this.gotoAndStop(2);  this.affi="Touche.."
	}else {
		this._alpha=100
		this._visible = false
		tps=0
	}
}
