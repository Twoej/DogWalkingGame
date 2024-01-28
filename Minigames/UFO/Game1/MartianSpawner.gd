extends Node2D


@export var martian_falling_tscn: PackedScene


func _spawn_martian():
	var new_martian = martian_falling_tscn.instantiate()
	new_martian.position.y = -50
	var viewport_width = get_viewport_rect().size.x
	var rand_x_pos = randf_range(200, viewport_width - 200)
	new_martian.position.x = rand_x_pos
	get_parent().add_child(new_martian)
