extends Entity

func _trigger():
	play()
	$Timer.start()
	await TurnManager.wait_for($Timer.timeout)
	board.set_entity(board_position, GlobalResources.Empty_Scene.instantiate())
	for i in surroundings():
		tile_at(i).trigger()
	
