extends Node2D

@export var frisbee: PackedScene

func _spawn_frisbee():
	var new_frisbee = frisbee.instantiate()
	var screenx = get_viewport_rect().size.x
	var screeny = get_viewport_rect().size.y
	var velocity_vector = Vector2.ZERO
	new_frisbee.position.x = randf_range(0, screenx)
	new_frisbee.position.y = randf_range(0, screeny)
	velocity_vector.x = randf_range(-1, 1)
	velocity_vector.y = randf_range(-1, 1)
	new_frisbee.velocity_vector = velocity_vector
	get_parent().add_child(new_frisbee)
