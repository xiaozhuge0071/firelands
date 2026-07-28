class_name HandManager extends RefCounted
signal hand_change(player_id:int)	#手牌改变信号
signal card_play(card:CardData)		#卡牌触发信号
signal discards(card:CardData,player_id:int)	#丢弃卡牌信号
signal hand_over(player_id:int,cardsize:int)	#手牌超限信号

var hands:Dictionary={}		#保存手牌
const maxhand:int=16		#最大手牌上限为16

func gethand(player_id:int)->Array[CardData]:	#检索手牌数据
	if not hands.has(player_id):	
		hands[player_id]=[] as Array[CardData]
	return hands[player_id]

func addcard(player_id:int,r_cards:Array[CardData])->bool:	#添加卡牌
	var hand=gethand(player_id)
	for card in r_cards:
		hand.append(card)
	emit_signal("hand_change",player_id)
	return true

func usecard(player_id:int,index:int)->CardData:	#使用卡牌
	var hand=gethand(player_id)
	if index<0 or index>=hand.size():
		return null
	var card=hand[index]	#确认卡牌是哪张
	hand.remove_at(index)	#从手牌移除该卡
	emit_signal('card_play',card,player_id)
	emit_signal('hand_change',player_id)
	return card		#返回卡牌类型

func checkend(player_id:int)->void:		#检查回合结束
	var hand=gethand(player_id)
	var cardsize:=hand.size()-maxhand	#获取超出手牌数量
	if cardsize>0:
		emit_signal('handover',player_id,cardsize)

func size(player_id:int)->int:
	if not hands.has(player_id):
		return 0
	return hands[player_id].size()

func discard(player_id:int,ind:Array[int])->void:	#玩家自主丢弃手牌
	var hand:=gethand(player_id)
	
	#防止顺序混乱
	ind.sort()
	ind.reverse()
	
	for index in ind:
		if index<0 or index>=hands.size():
			continue
		var card:CardData=hand[index]
		hand.remove_at(index)
		emit_signal('handchange',player_id)
		emit_signal('discards',card,player_id)
