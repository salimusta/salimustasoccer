onClipEvent (enterFrame) {
	_root.membres(this._name)
	_root.repos(this._name)
	_root.adversaire(this._name)
}
onClipEvent (load) {
	_root.init(this._name)

}