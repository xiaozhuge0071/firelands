extends Node

var gs: Manager

func _ready() -> void:
	print("========== 回合流程测试开始 ==========")

	gs=Manager.new()

	# 添加玩家
	gs.add_player(1)
	gs.player_id = 1

	# 初始化牌库
	var deck_cards: Array[CardData] = [
		CardData.new(1, "火球术"),
		CardData.new(2, "盾墙"),
		CardData.new(3, "疾跑"),
		CardData.new(4, "治疗"),
		CardData.new(5, "背刺"),
	]
	gs.deck.initialize(deck_cards)

	# 模拟 2 个完整回合
	for round_index in range(1, 3):
		print("\n--- 第 %d 回合 ---" % round_index)
		run_turn(gs.player_id)
	
func run_turn(player_id: int) -> void:
	var gs = self.gs # 获取外部的 GameState 实例
	
	# 1️⃣ 回合开始
	gs.turn.start_turn(player_id)
	print("玩家 %d 回合开始" % player_id)
	
	# 2️⃣ 抽卡（抽 2 张）
	for i in range(2):
		var card=gs.deck.gacha()
		if card:
			gs.hand.addcard(player_id,card)
			print("抽到: %s" % card.name)
		else:
			print("牌库已空，无法抽卡")
	
	print("手牌数量: %d" % gs.hand.size())
	
	# 3️⃣ 打牌（打第 1 张）
	if gs.hand.size() > 0:
		var played_card = gs.hand.usecard(player_id,0)
		gs.deck.discard.append(played_card)
		print("打出: %s" % played_card.name)
	else:
		print("手牌为空，无法出牌")
	
	print("手牌剩余: %d" % gs.hand.size())
	print("弃牌堆数量: %d" % gs.deck.discard.size())
	
	# 4️⃣ 结束回合
	print("玩家 %d 回合结束" % gs.player_id)

	print("========== 回合流程测试结束 ==========")
	#ai测试
