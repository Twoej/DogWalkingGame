extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false
const SPEED = 50.0

func _physics_process(delta):
	#Gravity for falling
	velocity.y += gravity * delta
	
	player = get_node("../Player")
	var direction = (player.position - self.position).normalized()
	#print(direction)
	#print(player.global_position)
	if chase == true:
		if direction.x > 0:
			print("right")
			#get_node("AnimatedSprite2D").fliph = true
			#velocity.x = direction * SPEED
		else:
			print("left")
			#get_node("AnimatedSprite2D").fliph = false
			#velocity.x = direction * SPEED
				
	move_and_slide()
	
func _on_player_detection_body_entered(body):
	if body.get_name() == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.get_name() == "Player":
		chase = false
