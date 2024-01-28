extends Area2D

var down: bool = false
var up: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("move_down")):
		down = true
	if (Input.is_action_just_released("move_down")):
		down = false
	if (Input.is_action_just_pressed("move_up")):
		up = true
	if (Input.is_action_just_released("move_up")):
		up = false
	
	if (up):
		position.y -= 300 * delta
	if (down):
		position.y += 300 * delta
	
	if (up || down):
		$PlayerSprite.play("run")
	else:
		$PlayerSprite.stop()


func _on_area_entered(dog):
	if (dog.is_in_group("dog")):
		dog.speed = 0
		get_parent()._won_game()
