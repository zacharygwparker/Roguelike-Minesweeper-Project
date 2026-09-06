extends Camera2D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		position -= event.screen_relative / zoom.x
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
		zoom *= 1.1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN):
		zoom *= 0.9090909091
