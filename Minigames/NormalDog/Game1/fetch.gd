extends Node2D

var thrown: bool = false
var ball_pos: Vector2

func _ready():
	$TennisBall.set_freeze_enabled(true)

func _process(delta):
	if (Input.is_action_just_pressed("throw") && !thrown):
		thrown = true
		$TennisBall/TennisBallSprite.set_visible(true)
		$TennisBall.set_freeze_enabled(false)
		$TennisBall.add_constant_central_force(Vector2(800, -800))
		$TennisBall/ArcTimer.start(0.5)


func _on_arc_timer_timeout():
	$TennisBall.constant_force = Vector2(0, 0)


func _on_ground_body_entered(ball):
	if (ball.is_in_group("ball")):
		$GameEnd.start(2)
		$GameEnd._loss()


func _on_mouse_body_entered(ball):
	if (ball.is_in_group("ball")):
		ball_pos = ball.position
		var ball_direction_vector = ball_pos - $Laser/LaserSprite.position
		var ball_unit_vector = ball_direction_vector / sqrt(pow(ball_direction_vector.x, 2) + pow(ball_direction_vector.y, 2))
		$Laser.look_at(ball.position)
		$Laser/LaserSprite.set_visible(true)
		$Laser._move(ball_unit_vector)
		ball.queue_free()
		$GameEnd.start(2)
		$GameEnd._win()
		


