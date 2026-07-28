class_name CardData extends RefCounted

var army:Army
var order:Order
var rehearsal:Rehearsal
var state:State

var id:int
var name:String
func _init(card_id:int,card_name:String)->void:
	id=card_id
	name=card_name
