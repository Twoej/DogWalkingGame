extends CharacterBody2D
@onready var anim = get_node("PlayerSprite");

func _process(delta):
	
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * 200
	if velocity.x && velocity.y == 0:
		anim.play("Idle")
	if velocity.x > 0 :
		anim.flip_h = false
		anim.play("Run")
	if velocity.x < 0 :
		anim.flip_h = true
		anim.play("Run")
		
	move_and_slide()
#func _on_timer_timeout():
	
