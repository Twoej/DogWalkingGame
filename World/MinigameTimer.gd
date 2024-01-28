extends Timer


func _ready():
	var rand_time = randf_range(3, 8)
	self.set_wait_time(rand_time)
	self.start(rand_time)


