class_name TurnManager extends RefCounted
enum Phase{GACHA,MAIN,BATTLE,END}

signal phase_change(phase:Phase)
signal turn_end(player_id:int)

var current_phase:Phase=Phase.GACHA
var current_player:int=1

func start_turn(player_id:int)->void:
	current_player=player_id
	current_phase=Phase.GACHA
	emit_signal("phase_changed",current_phase)
	_execute_phase()

func _execute_phase()->void:
	match current_phase:
		Phase.GACHA:
			
			current_phase=Phase.MAIN
			emit_signal("phase_changed",current_phase)

		Phase.MAIN:
			pass

		Phase.BATTLE:
			pass

		Phase.END:
			end_turn()

func end_turn()->void:
	emit_signal("turn_end",current_player)
