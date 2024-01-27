extends Area2D

var velocityx: float = 100

func _process(delta):
	self.position.y += 100 * delta
	if ($ParachuteOscillate.get_time_left() > 1.25 || $ParachuteOscillate.get_time_left() < 0.25):
		velocityx -= 100 * delta
		position.x += velocityx * delta
	elif (($ParachuteOscillate.get_time_left() > 1 && $ParachuteOscillate.get_time_left() < 1.25) ||
	($ParachuteOscillate.get_time_left() > 0.25 && $ParachuteOscillate.get_time_left() < 0.5)):
		
