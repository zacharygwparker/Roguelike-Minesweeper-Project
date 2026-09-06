extends AnimatedSprite2D
class_name Entity

var board_position: Vector2i
var board: Board

func tile_at(positon_relative: Vector2i) -> Tile:
	return board.get_tile(board_position + positon_relative)

func entity_at(positon_relative: Vector2i) -> Entity:
	return board.get_entity(board_position + positon_relative)

func _update():
	pass

func _trigger():
	pass

func surroundings() -> Array[Vector2i]: 
	var outlist: Array[Vector2i] = []
	for i in [
		Vector2i(-1, -1),
		Vector2i(-1, 0),
		Vector2i(-1, 1),
		Vector2i(0, 1),
		Vector2i(1, 1),
		Vector2i(1, 0),
		Vector2i(1, -1),
		Vector2i(0, -1),
	]:
		outlist.append(i)
	return outlist

func update_surroundings():
	for i in surroundings():
		entity_at(i)._update()

func _reveal():
	pass

func _dig():
	pass
