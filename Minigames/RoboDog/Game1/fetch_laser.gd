extends Node2D
var frisbee_count = 4

func _ready():
	for i in 4:
		$Frisbee_Spawner._spawn_frisbee()
