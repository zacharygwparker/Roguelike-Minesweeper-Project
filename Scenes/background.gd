extends Sprite2D

func _process(_delta: float) -> void:
	var camera = get_viewport().get_camera_2d()
	region_rect.size = get_viewport_rect().size / camera.zoom
	position = get_viewport_rect().position - get_viewport_rect().size / 2 + camera.position + Vector2(8, 8)
	region_rect.position = get_viewport_rect().position - get_viewport_rect().size / 2 + camera.position
