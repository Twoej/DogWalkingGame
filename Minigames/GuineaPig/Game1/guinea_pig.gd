extends Area2D

var speed = 700

func _process(delta):
	self.position.x += speed * delta
	if (speed == 700):
		$GuineaPigSprite.play("run")
	elif (speed == 0):
		$GuineaPigSprite.stop()
		$GuineaPigSprite.set_flip_h(true)


func _on_area_entered(dog):
	if (dog.is_in_group("dog")):
		self.queue_free()
		get_parent()._lost_game()
