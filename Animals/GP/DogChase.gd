extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var dogAnim = get_node("DogChaseSprite");
var player
var chase = false
var SPEED = 2

func _physics_process(delta):
	#Gravity for falling
	velocity.y += gravity * delta
	
	player = get_node("../Player")
	var direction = (player.position - self.position).normalized()
	
	if chase == true:
		if direction.y > 0:
			velocity.y += SPEED * delta
			dogAnim.flip_h = false
			dogAnim.play("GoldDogRun")
		else:
			velocity.y += SPEED * delta
			dogAnim.flip_h = true
			dogAnim.play("GoldDogRun")
		if direction.x > 0:
			velocity.x += SPEED * delta
			dogAnim.flip_h = false
			dogAnim.play("GoldDogRun")
		else:
			velocity.x += SPEED * delta
			dogAnim.flip_h = true
			dogAnim.play("GoldDogRun")
				
	move_and_slide()
	
func _on_player_detection_body_entered(body):
	if body.get_name() == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.get_name() == "Player":
		chase = false
