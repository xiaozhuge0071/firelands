class_name Player extends RefCounted

var player_id: int
var hp: int = 30
var max_hp: int = 30

var resources: Dictionary = {
	"mana": 0,
	"gold": 0
}

func pay(cost: Dictionary) -> bool:
	for k in cost:
		if resources.get(k, 0) < cost[k]:
			return false
	for k in cost:
		resources[k] -= cost[k]
	return true
#ai
