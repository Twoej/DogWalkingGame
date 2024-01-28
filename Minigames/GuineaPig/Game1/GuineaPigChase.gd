extends Node2D


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_area_2d_area_entered(pig):
	if (pig.is_in_group("GuineaPig")):
		pig.speed = 0

func _lost_game():
	print("Lost")

func _won_game():
	print("won")
