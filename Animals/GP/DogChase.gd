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
	print(direction)
	#print(player.global_position)
	if chase == true:
		if direction.y < 0:
			velocity.y -= 1 * SPEED
			direction = Vector2(0, -1)
			dogAnim.play("Run")
		
		if direction.y > 0:
			velocity.y += 1 * SPEED
			direction = Vector2(0, 1)
			dogAnim.play("Run")
		
		if direction.x < 0:
			velocity.x -= 1 * SPEED
			direction = Vector2(-1, 0)
			dogAnim.flip_h = true
			dogAnim.play("Run")
		
		if direction.x > 0:
			velocity.x += 1 * SPEED
			direction = Vector2(1, 0)
			get_node("PlayerSprite").flip_h = false
			dogAnim.flip_h = false
			dogAnim.play("Run")
				
	move_and_slide()
	
func _on_player_detection_body_entered(body):
	if body.get_name() == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.get_name() == "Player":
		chase = false
