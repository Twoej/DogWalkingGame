extends Node2D

var ant_count = 8

func _ready():
	for i in 8:
		$AntSpawner._spawn_ant()


func _on_area_2d_area_entered(ant):
	if (ant.is_in_group("ant")):
		ant._screen_edge()

func _process(delta):
	$Mouse.position = Vector2(-1435, 221)
	if (Input.is_action_just_pressed("collect_ant")):
		$Mouse.position = get_global_mouse_position()
	
	if (ant_count == 0):
		$GameEnd.Start(2)
		$GameEnd._win()
	

func _on_mouse_area_entered(ant):
	if (ant.is_in_group("ant")):
		ant.queue_free()
		ant_count -= 1


func _on_lose_timer_timeout():
	$GameEnd.start(2)
	$GameEnd._Loss()
