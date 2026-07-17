class_name TurnManager extends RefCounted
enum Phase{GACHA,READY,MAIN,END}	#枚举每一个阶段

signal phase_change(phase:Phase)	#阶段变更信号
signal turn_end(player_id:int)		#玩家回合结束信号

var current_phase:Phase=Phase.READY		#回合开始直接进行预演
var current_player:int=1	#当前玩家id

func start_turn(player_id:int)->void:	#当新回合开始
	current_player=player_id	#下一位玩家
	current_phase=Phase.GACHA	#把当前回合重置为抽卡阶段
	emit_signal("phase_changed",current_phase)
	phases()

func phases()->void:
	match current_phase:
		Phase.GACHA:	#抽卡阶段
			current_phase=Phase.MAIN
			emit_signal("phase_changed",current_phase)

		Phase.READY:	#预演阶段
			pass

		Phase.MAIN:		#出牌阶段
			pass

		Phase.END:		#结束阶段
			pass

func end_turn()->void:		#玩家回合结束
	emit_signal("turn_end",current_player)
