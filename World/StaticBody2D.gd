extends StaticBody2D


func _on_tp_begin_body_entered(body):
	if(body.name == "Player"):
		$"../Player".position = Vector2(2250, 125)
		$"../DogChase".position = Vector2(2250, 125)

func _on_tp_end_body_entered(body):
	if(body.name == "Player"):
		$"../Player".position = Vector2(-450, 125)
		$"../DogChase".position = Vector2(-450, 125)
