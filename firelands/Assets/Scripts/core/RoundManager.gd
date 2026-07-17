class_name RoundManager extends RefCounted

signal round_start(round_num:int)	#下一个回合信号
signal round_end(win:int)		#游戏结束信号

var game:Manager
var round_num:int=0		#回合计算

func _init(game_state:Manager):
	game=game_state

func start_round()->void:	#开始回合（包括新回合）
	round_num+=1
	game.player_id=1
	emit_signal("round_start",round_num)
	game.turn.start_turn(game.player_id)	#运行玩家回合

func check_end_round()->void:	#检查游戏是否结束
	for id in game.players:		#遍历每一个玩家并检测血量
		var p:Player=game.players[id]
		if p.hp<=0:
			end_round(id)

func end_round(lose:int)->void:		#结束游戏并宣言胜利
	var win=1 if lose==2 else 2
	emit_signal("round_end",win)
