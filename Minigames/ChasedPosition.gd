extends Node2D

#____ being chased by dog

func location():
player = get_node("../Player")
	var direction = (player.position - self.position).normalized()
