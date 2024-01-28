extends Node2D

var fishbowl_tilt: float = 0
var tilt_speed = 0.5
var left: bool = false
var right: bool = false
signal game_over
var game_is_over: bool = false

func _dog_spawned(dog):
	var draw_order = randi_range(0, 1)
	if (draw_order == 1):
		move_child(dog, 0)


func _dog_passing(dog):
	if ($Player.position.x < dog.position.x && fishbowl_tilt > -1):
		fishbowl_tilt -= 0.4
	elif (fishbowl_tilt < 1):
		fishbowl_tilt += 0.4

func _process(delta):
	if (Input.is_action_just_pressed("tilt_left")):
		left = true
	elif (Input.is_action_just_released("tilt_left")):
		left = false
	if (Input.is_action_just_pressed("tilt_right")):
		right = true
	elif (Input.is_action_just_released("tilt_right")):
		right = false
	if (left && fishbowl_tilt > -1):
		fishbowl_tilt -= tilt_speed * delta
	if (right && fishbowl_tilt < 1):
		fishbowl_tilt += tilt_speed * delta
	
	if ((fishbowl_tilt >= 0.8 || fishbowl_tilt <= -0.8) && $LoseTimer.is_stopped() && !game_is_over):
		$LoseTimer.start(0.5)
	elif (fishbowl_tilt < 0.8 && fishbowl_tilt > -0.8):
		$LoseTimer.stop()

func _on_lose_timer_timeout():
	game_over.emit()
	if (fishbowl_tilt > 0):
		$Fishbowl/FishbowlRight.set_visible(true)
		$Fishbowl/FishRight.set_visible(true)
		$Fishbowl/FishbowlLeft.set_scale(Vector2.ZERO)
		$Fishbowl/FishLeft.set_scale(Vector2.ZERO)
	if (fishbowl_tilt < 0):
		$Fishbowl/FishbowlLeft.set_visible(true)
		$Fishbowl/FishLeft.set_visible(true)
		$Fishbowl/FishbowlRight.set_scale(Vector2.ZERO)
		$Fishbowl/FishRight.set_scale(Vector2.ZERO)


func _on_game_over():
	$GameEnd.start(2)
	$GameEnd._loss()
	



func _on_win_timer_timeout():
	$GameEnd.start(2)
	$GameEnd._win()
