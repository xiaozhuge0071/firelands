class_name DeckManager extends RefCounted
signal card_changed

var card:Array[CardData]=[]
var discard:Array[CardData]=[]

func chushi(cards:Array[CardData])->void:
	card = cards.duplicate()
	card.shuffle()
	emit_signal("card_changed")

func gacha()->CardData:
	if card.is_empty():
		xi_pai()
	if card.is_empty():
		return null
	var card=card.pop_back()
	emit_signal("card_changed")
	return card
	
func ReturnCard()->void:
	pass

func xi_pai()->void:
	card=discard.duplicate()
	card.shuffle()
	discard.clear()
	emit_signal("card_changed")
