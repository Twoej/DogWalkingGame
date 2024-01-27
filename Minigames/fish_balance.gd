extends Node2D

var fishbowl_tilt: float = 0
var tilt_speed = 100
var left: bool = false
var right: bool = false

func _dog_spawned(dog):
	var draw_order = randi_range(0, 1)
	if (draw_order == 1):
		move_child(dog, 0)


func _dog_passing(dog):
	if ($Player.position.x < dog.position.x && fishbowl_tilt > 0):
		fishbowl_tilt -= 0.2
	elif (fishbowl_tilt < 1):
		fishbowl_tilt += 0.2

func _process(delta):
	if (Input.is_action_just_pressed("tilt_left")):
		left = true
	elif (Input.is_action_just_released("tilt_left")):
		left = false
	if (Input.is_action_just_pressed("tilt_right")):
		right = true
	elif (Input.is_action_just_pressed("tilt_right")):
		right = false
	if (left && fishbowl_tilt > 0):
		fishbowl_tilt -= tilt_speed * delta
	if (right && fishbowl_tilt < 1):
		fishbowl_tilt += tilt_speed * delta
	print(fishbowl_tilt)
