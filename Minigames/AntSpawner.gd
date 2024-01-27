extends Node2D

@export var escaped_ant_tscn: PackedScene

func _spawn_ant():
	var new_ant = escaped_ant_tscn.instantiate()
	var screenx = get_viewport_rect().size.x
	var screeny = get_viewport_rect().size.y
	var velocity_vector = Vector2.ZERO
	new_ant.position.x = randf_range(0, screenx)
	new_ant.position.y = randf_range(0, screeny)
	velocity_vector.x = randf_range(-1, 1)
	velocity_vector.y = randf_range(-1, 1)
	new_ant.velocity_vector = velocity_vector
	get_parent().add_child(new_ant)
