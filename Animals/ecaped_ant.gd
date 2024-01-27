extends Area2D

@export var velocity: int
var velocity_vector = Vector2.ZERO

func _process(delta):
	self.position.x += velocity * velocity_vector.x * delta
	self.position.y += velocity * velocity_vector.y * delta

func _screen_edge():
	if (position.x > get_viewport_rect().size.x):
		position.x = 0
	if (position.y > get_viewport_rect().size.y):
		position.y = 0
	if (position.x < 0):
		position.x = get_viewport_rect().size.x
	if (position.y < 0):
		position.y = get_viewport_rect().size.y
