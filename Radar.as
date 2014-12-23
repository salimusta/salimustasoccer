onClipEvent (enterFrame) {
	//afficher les points radar
	for(x=0;x<=3;x++){
		this["rjoueur"+x]._x=(90*_root.ter["j"+x]._x)/650
		this["rjoueur"+x]._y=(130*_root.ter["j"+x]._y)/1000
		this["rordi"+x]._x=(90*_root.ter["o"+x]._x)/650
		this["rordi"+x]._y=(130*_root.ter["o"+x]._y)/1000
		this["rordi"+x].nom="o"+x
		this["rjoueur"+x].nom="j"+x
	}
	this.rballe._x=(90*_root.ter.top._x)/650
	this.rballe._y=(130*_root.ter.top._y)/1000
	this.rgoal2._x=(90*_root.ter.goal2._x)/650
	this.rgoal2._y=(130*_root.ter.goal2._y)/1000
	this.rgoal._x=(90*_root.ter.goal._x)/650
	this.rgoal._y=(130*_root.ter.goal._y)/1000
	this.rviseur._x=(90*_root.ter.viseur._x)/650
	this.rviseur._y=(130*_root.ter.viseur._y)/1000
	

}

onClipEvent (load) {
	xd=this._x
	yd=this._y
	for(x=0;x<=3;x++){
		if(x!=1) this.rjoueur1.duplicateMovieClip("rjoueur"+x,x)
		if(x!=1) this.rordi1.duplicateMovieClip("rordi"+x,x+20)
		
		//radar
_root["couleurrj"+x]=new Color(this["rjoueur"+x])
_root["couleurrj"+x].setTransform(_root[_root.equipe1+"_maillo"])
_root["couleurro"+x]=new Color(this["rordi"+x])
_root["couleurro"+x].setTransform(_root[_root.equipe2+"_maillo"])
	}
	
}