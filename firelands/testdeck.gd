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
<<<<<<< HEAD
=======
	"""
	在deckmanager中添加一个多次抽卡的逻辑，减少代码复用
	后续要抽多张卡就直接用这个函数就行，没必要每次for循环了
	"""
	for i in range(2):
		var card=gs.deck.gacha()
		if card:
			gs.hand.addcard(player_id,card)
			print("抽到: %s" % card.name)
		else:
			print("牌库已空，无法抽卡")
>>>>>>> 9b1ab062879798ad903fbade53d1f24ddc3823d9
	
	var card=gs.deck.gacha(3)
	
	if card:
		gs.hand.addcard(player_id,card)
		for a in card:
			print("抽到: %s" % a.name)
	else:
		print("牌库已空，无法抽卡")
	
	print("手牌数量: %d" % gs.hand.size(player_id))
	
	# 3️⃣ 打牌（打第 1 张）
<<<<<<< HEAD
	if gs.hand.size(player_id) > 0:
		var played_card = gs.hand.usecard(player_id,0)
		gs.deck.FoldCard(played_card)
=======
	if gs.hand.size() > 0:
		"""
		之后得写卡牌效果的实施了，也就是玩家拖动卡牌后，在松开鼠标左键时应当识别所在的节点类型
		之后将这个节点传给卡牌，让卡牌执行效果
		这一块的逻辑放到卡牌里面写，因为每一个卡牌的效果不同
		先把卡牌的操作状态机添加上，然后再添加效果触发就行
		"""
		var played_card = gs.hand.usecard(player_id,0)
		"""
		下面这里将卡牌放到弃牌堆，不要直接添加到数组中
		在deckmanager添加一个单独的函数，用来处理卡牌的弃牌逻辑
		这样的有些卡牌进入弃牌堆时可能出现的效果就可以在这里执行
		"""
		gs.deck.discard.append(played_card)
>>>>>>> 9b1ab062879798ad903fbade53d1f24ddc3823d9
		print("打出: %s" % played_card.name)
	else:
		print("手牌为空，无法出牌")
	
	print("手牌剩余: %d" % gs.hand.size(player_id))
	print("弃牌堆数量: %d" % gs.deck.size(player_id))
	
	# 4️⃣ 结束回合
	print("玩家 %d 回合结束" % gs.player_id)

	print("========== 回合流程测试结束 ==========")
	#ai测试
