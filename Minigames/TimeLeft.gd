extends Label


func _process(delta):
	self.text = str(snapped(get_parent().get_time_left(), 1))
