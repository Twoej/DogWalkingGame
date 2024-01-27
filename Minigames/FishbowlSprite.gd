extends Sprite2D



func _tremble():
	if (randi_range(0, 2) == 1):
		self.position.x = randf_range(-10, 10)
		self.position.y = randf_range(-10, 10)

func _shake():
	if (randi_range(0, 1) == 1):
		self.position.x = randf_range(-20, 20)
		self.position.y = randf_range(-20, 20)


func _on_fish_balance_game_over():
	self.set_visible(false)
	
