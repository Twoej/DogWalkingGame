extends Label


func _process(delta):
	self.text = "Ants Left: " + str(get_parent().ant_count) + "!"
