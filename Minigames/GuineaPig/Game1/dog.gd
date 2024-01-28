extends Area2D

@export var speed = 700

func _process(delta):
	self.position.x += speed * delta
	if (speed == 700):
		$DogSprite.play("run")
	else:
		$DogSprite.stop()
