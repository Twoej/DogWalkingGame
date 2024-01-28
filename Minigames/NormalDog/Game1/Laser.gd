extends Node2D

var move: bool = false
var move_direction: Vector2

func _move(direction):
	move = true
	move_direction = direction

func _process(delta):
	if (move):
		self.position += move_direction * 5000 * delta
