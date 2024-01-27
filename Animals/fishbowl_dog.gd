extends Area2D

var speed_vector = Vector2.ZERO

func _on_tree_entered():
	var viewport_width = get_viewport_rect().size.x
	if (position.x != 0):
		$DogSprite.set_flip_h(true)

func _ready():
	var speed = 0
	if ($DogSprite.is_flipped_h()):
		speed = randf_range(-450, -550)
	else:
		speed = randf_range(450, 550)
	var angle = randf_range(-0.1, 0.1)
	var direction_vector = Vector2.ZERO
	direction_vector.x = cos(angle)
	direction_vector.y = sin(angle)
	speed_vector = speed * direction_vector
	
func _process(delta):
	position.x += speed_vector.x * delta
	position.y += speed_vector.y * delta


