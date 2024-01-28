extends CharacterBody2D
@onready var anim = get_node("PlayerSprite");

var marker = self.position

func _process(delta):
	#print(self.position)
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

func _on_pet_magnet_body_entered(body):
	
	if body.is_in_group("Animals"):
		print("No")
		
pass

func _on_pet_magnet_body_exited(body):
	if body.is_in_group("Animals"):
		pass
pass

func _on_timer_timeout():
	print("YES")
	marker = self.position

func _on_timer_ready():
	$Timer.set_wait_time(2)
	$Timer.start()
	pass
