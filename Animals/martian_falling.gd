extends Area2D

var bounced: bool = false
var velocityx: float = 115
var velocityy: float = 150
var initial_pos

func _ready():
	initial_pos = position.x

func _process(delta):
	if (!bounced):
		position.y += velocityy * delta
		position.x += velocityx * delta
		var time = $ParachuteOscillation.get_time_left()
		if (time > 1.75):
			velocityx -= 400 * delta
			$MartianSprite.set_frame(1)
			$MartianBlinkingSprite.set_frame(4)
		elif (1.75 > time && time > 1.5):
			velocityx -= 250 * delta
			$MartianSprite.set_frame(1)
			$MartianBlinkingSprite.set_frame(4)
		elif (1.5 > time && time > 1.25):
			velocityx -= 125 * delta
			$MartianSprite.set_frame(2)
			$MartianBlinkingSprite.set_frame(3)
		elif (1.25 > time && time > 1):
			velocityx += 125 * delta
			$MartianSprite.set_frame(2)
			$MartianBlinkingSprite.set_frame(3)
		elif (1 > time && time > 0.75):
			velocityx += 250 * delta
			$MartianSprite.set_frame(5)
			$MartianBlinkingSprite.set_frame(0)
		elif (0.75 > time && time > 0.5):
			$MartianSprite.set_frame(5)
			$MartianBlinkingSprite.set_frame(0)
			velocityx += 400 * delta
		elif (0.5 > time && time > 0.25):
			$MartianSprite.set_frame(2)
			$MartianSprite.set_frame(3)
			velocityx += 125 * delta
		else:
			$MartianSprite.set_frame(2)
			$MartianSprite.set_frame(3)
			velocityx -= 125 * delta
	
		if (randi_range(0, 200) == 100):
			$MartianBlinkingSprite.set_visible(true)
			$MartianSprite.set_visible(false)
			$BlinkTimer.start(0.5)
	if (bounced):
		position.y -= velocityy * delta
		velocityy -= 500 * delta


func _on_blink_timer_timeout():
	$MartianBlinkingSprite.set_visible(false)
	$MartianSprite.set_visible(true)
