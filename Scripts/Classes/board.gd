extends Node2D
class_name Board

var tiles: Dictionary[Vector2i, Tile]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for x in range(5):
		for y in range(5):
			generate_tile(Vector2(x, y))

func generate_tile(tile_position: Vector2i):
	var new_tile = GlobalResources.Tile_Scene.instantiate()
	tiles[tile_position] = new_tile
	add_child(new_tile)
	new_tile.position = tile_position * 16
	if randf() < 0.20:
		set_entity(tile_position, GlobalResources.Mine_Scene.instantiate())
	else:
		set_entity(tile_position, GlobalResources.Empty_Scene.instantiate())
	new_tile.entity.board_position = tile_position
	new_tile.entity.board = self

func set_entity(tile_position: Vector2i, new_entity: Entity):
	new_entity.board_position = tile_position
	new_entity.board = self
	var tile = tiles[tile_position]
	if tile.entity:
		tile.remove_child(tile.entity)
		tile.entity.queue_free()
		tile.entity = new_entity
		tile.add_child(new_entity)
		tile.entity.update_surroundings()
	else:
		tile.add_child(new_entity)
		tile.entity = new_entity

func get_entity(tile_position: Vector2i) -> Entity:
	if not tiles.has(tile_position):
		generate_tile(tile_position)
	return tiles[tile_position].entity

func get_tile(tile_position: Vector2i) -> Tile:
	if not tiles.has(tile_position):
		generate_tile(tile_position)
	return tiles[tile_position]
