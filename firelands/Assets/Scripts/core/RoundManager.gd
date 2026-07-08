class_name RoundManager extends RefCounted

signal round_start(round_num:int)
signal round_end(win:int)

var game:Manager
var round_num:int=0

func _init(game_state:Manager):
	game=game_state

func start_round()->void:
	round_num+=1
	game.player_id=1
	emit_signal("round_start",round_num)
	game.turn.start_turn(game.player_id)

func check_end_round()->void:
	for id in game.players:
		var p:Player=game.players[id]
		if p.hp<=0:
			end_round(id)

func end_round(lose:int)->void:
	var win=1 if lose==2 else 2
	emit_signal("round_end",win)
