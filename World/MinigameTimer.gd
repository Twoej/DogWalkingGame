extends Timer


func _ready():
	start(8)


func _on_timeout():
	var rand_time = randf_range(3, 8)
	self.set_wait_time(rand_time)
