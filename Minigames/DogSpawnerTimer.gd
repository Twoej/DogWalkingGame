extends Timer


func _ready():
	#dog spawn timer to 1.5s
	wait_time = 1


func _on_timeout():
	#dog spawn timer random intervals
	wait_time = randf_range(0.5, 2)
