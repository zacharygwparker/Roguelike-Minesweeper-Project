extends Entity

var count = 0

func _update():
	if tile_at(Vector2i(0, 0)).state == Tile.States.REVEALED:
		count = 0
		for i in surroundings():
			if entity_at(i).is_in_group("mines"):
				count += 1
		frame = count
		if count == 0:
			for i in surroundings():
				tile_at(i).trigger()
