extends Node2D
class_name Tile

enum States {REVEALED, GRASS, FLAG}

var entity: Entity
var state = States.GRASS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_entity(new_entity: Entity, board: Board):
	new_entity.board = board
	if entity:
		remove_child(entity)
		add_child(new_entity)
		entity = new_entity
		entity.update_surroundings()
	else:
		add_child(new_entity)
		entity = new_entity

func trigger():
	if state != States.REVEALED:
		reveal()
	entity._trigger()

func reveal():
	state = States.REVEALED
	$Grass.frame = state
	entity.update_surroundings()
	entity._update()
	entity._reveal()

func _on_texture_button_pressed() -> void:
	entity._dig()
	trigger()
