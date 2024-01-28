extends Area2D


func _process(delta):
	self.position = Vector2(-400, 400)
	if (Input.is_action_just_pressed("collect_ant")):
		self.position = get_global_mouse_position()
		
