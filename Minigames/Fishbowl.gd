extends Node2D

func _process(delta):
	var tilt = get_parent().fishbowl_tilt
	if (tilt < -0.9):
		$FishbowlSprite.set_frame(0)
	elif (tilt < -0.3):
		$FishbowlSprite.set_frame(0)
	elif (tilt < 0.3):
		$FishbowlSprite.set_frame(2)
	elif (tilt < 0.9):
		$FishbowlSprite.set_frame(3)
	else:
		$FishbowlSprite.set_frame(4)
