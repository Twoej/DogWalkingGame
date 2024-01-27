extends Node2D

@export var FishbowlDog_tscn: PackedScene

#dog timer runs out spawn new dog
func _spawn_dog():
	var new_dog = FishbowlDog_tscn.instantiate()
	self.add_child(new_dog)
	var screen_side = randi_range(0, 1)
	var viewport_width = get_viewport_rect().size.x
	new_dog.position.x = screen_side * viewport_width
	var rand_ypos = randf_range(350, 550)
	new_dog.position.y = rand_ypos
	
