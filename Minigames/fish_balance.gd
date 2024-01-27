extends Node2D


func _dog_spawned(dog):
	var draw_order = randi_range(0, 1)
	if (draw_order == 1):
		move_child(dog, 1)
