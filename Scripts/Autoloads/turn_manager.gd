extends Node

var waiting_list = 0

func wait_for(function: Signal):
	waiting_list += 1
	@warning_ignore("redundant_await")
	await function
	waiting_list -= 1
