extends CharacterBody2D
@onready var anim = get_node("PlayerSprite");

var direction : Vector2 = Vector2() 
var SPEED = 2

func read_input():
	
	if Input.is_action_pressed("Up"):
		velocity.y -= 1 * SPEED
		direction = Vector2(0, -1)
		#anim.play("Run")
	if Input.is_action_just_released("Up"):
		velocity.y += 1 * SPEED
		direction = Vector2(0, -1)
		
	if Input.is_action_pressed("Down"):
		velocity.y += 1 * SPEED
		direction = Vector2(0, 1)
		#anim.play("Run")
	if Input.is_action_just_released("Down"):
		velocity.y -= 1 * SPEED
		direction = Vector2(0, 1)
		
	if Input.is_action_pressed("Left"):
		velocity.x -= 1 * SPEED
		direction = Vector2(-1, 0)
		anim.flip_h = true
		anim.play("Run")
	if Input.is_action_just_released("Left"):
		velocity.x += 1 * SPEED
		direction = Vector2(-1, 0)
		
	if Input.is_action_pressed("Right"):
		velocity.x += 1 * SPEED
		direction = Vector2(1, 0)
		get_node("PlayerSprite").flip_h = false
		anim.play("Run")
		
		
	if Input.is_action_just_released("Right"):
		velocity.x -= 1 * SPEED
		direction = Vector2(1, 0)

	move_and_slide()

func _physics_process(delta):
	read_input();
	
