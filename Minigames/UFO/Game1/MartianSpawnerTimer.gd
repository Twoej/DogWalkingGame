extends Timer


func _ready():
	set_wait_time(1)


func _on_timeout():
	set_wait_time(randf_range(5, 8))
