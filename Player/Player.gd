extends CharacterBody2D
@export var test: PackedScene
@onready var anim = get_node("PlayerSprite");

func _process(delta):
	
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * 500
	if velocity.x && velocity.y == 0:
		anim.play("Idle")
	if velocity.x > 0:
		anim.flip_h = false
		anim.play("Run")
	else:
		anim.flip_h = true
		anim.play("Run")
		
	move_and_slide()
