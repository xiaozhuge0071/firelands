class_name Manager extends RefCounted
signal Manager_change(path:String)

var deck:DeckManager
var hand:HandManager
var round:RoundManager
var turn:TurnManager
var map:MapManager

var players:Dictionary={}
var player_id:int=1

func _init():
	deck=DeckManager.new()
	hand=HandManager.new()
	round=RoundManager.new(self)
	turn=TurnManager.new()
	map=MapManager.new()

func add_player(id:int)->void:
	var p:=Player.new()
	p.player_id=id
	players[id]=p

func get_player(id:int)->Player:
	return players.get(id)
	
func change(path:String,value)->void:
	set(path,value)
	Manager_change.emit(path)
