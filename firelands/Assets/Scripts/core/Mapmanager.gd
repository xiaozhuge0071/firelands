class_name MapManager extends RefCounted

signal unit_deployed(pos: Vector2i, unit: UnitData)

var grid: Dictionary = {}
# key: Vector2i, value: UnitData

func deploy_unit(pos: Vector2i, unit: UnitData) -> bool:
	if grid.has(pos):
		return false
	grid[pos] = unit
	emit_signal("unit_deployed", pos, unit)
	return true

func remove_unit(pos: Vector2i) -> void:
	grid.erase(pos)

func get_unit(pos: Vector2i) -> UnitData:
	return grid.get(pos)
#ai生成测试
