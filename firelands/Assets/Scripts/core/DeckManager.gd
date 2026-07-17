class_name DeckManager extends RefCounted
signal card_changed

var card:Array[CardData]=[]
var discard:Array[CardData]=[]

func initialize(cards:Array[CardData])->void:
	card = cards.duplicate()
	card.shuffle()
	emit_signal("card_changed")

func gacha()->CardData:
	if card.is_empty():
		shuffle()
	if card.is_empty():
		return null
	var card=card.pop_back()
	emit_signal("card_changed")
	return card
	
func ReturnCard()->void:
	pass

func shuffle()->void:
	card=discard.duplicate()
	card.shuffle()
	discard.clear()
	emit_signal("card_changed")
