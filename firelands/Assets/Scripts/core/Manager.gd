class_name Manager extends RefCounted
signal state_changed(path:String)

var deck:DeckManager
var hand:HandManager
var round:RoundManager
var turn:TurnManager
var map:MapManager
