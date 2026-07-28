class_name DeckManager extends RefCounted
signal card_changed(player_id:int)

var card:Array[CardData]=[]		#牌堆
var discard:Array[CardData]=[]	#弃牌堆

func initialize(player_card:Array[CardData])->void:	#初始化卡组
	card=player_card.duplicate()		#把牌堆的卡组从外部拷贝到此处
	discard.clear()
	card.shuffle()
	emit_signal("card_changed")

func gacha(count:int=1)->Array[CardData]:		#抽卡（数量默认为1）
	var r_cards:Array[CardData]=[]
	for a in range(count):
		if card.is_empty():		#检测卡组是否为空
			ResetDeck()
		var cards:CardData=card.pop_back()
		r_cards.append(cards)
	emit_signal("card_changed")
	return r_cards
	
func FoldCard(card_fold:CardData)->void:
	if card_fold==null:
		return
	discard.append(card_fold)
	emit_signal('card_changed')

func ResetDeck()->void:		#将弃牌堆的卡转移到牌堆
	card=discard.duplicate()
	card.shuffle()
	discard.clear()
	emit_signal("card_changed")
	
func size(player_id:int)->int:
	if not discard.has(player_id):	
		return 0
	return discard[player_id].size()
