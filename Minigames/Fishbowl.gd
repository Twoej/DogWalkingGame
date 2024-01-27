extends Node2D

func _process(delta):
	var tilt = get_parent().fishbowl_tilt
	if (tilt < -0.5):
		$FishbowlSprite.set_frame(0)
		get_node("../Player/PlayerSprite").set_frame(1)
		$FishbowlSprite._shake()
	elif (tilt < -0.1):
		$FishbowlSprite.set_frame(1)
		get_node("../Player/PlayerSprite").set_frame(1)
		$FishbowlSprite._tremble()
	elif (tilt < 0.1):
		$FishbowlSprite.set_frame(2)
		get_node("../Player/PlayerSprite").set_frame(0)
	elif (tilt < 0.5):
		$FishbowlSprite.set_frame(3)
		get_node("../Player/PlayerSprite").set_frame(1)
		$FishbowlSprite._tremble()
	elif (tilt >= 0.5):
		$FishbowlSprite.set_frame(4)
		get_node("../Player/PlayerSprite").set_frame(1)
		$FishbowlSprite._shake()
	
