extends Area2D


func _process(delta):
	var mouse_pos = get_global_mouse_position()
	self.position.x = mouse_pos.x
