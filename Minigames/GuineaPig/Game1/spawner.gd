extends Node2D

@export var guinea_pig_tscn: PackedScene
@export var dog_tscn: PackedScene

func _ready():
	var new_guinea_pig = guinea_pig_tscn.instantiate()
	new_guinea_pig.position.x = -100
	new_guinea_pig.position.y = 400
	get_parent().add_child.call_deferred(new_guinea_pig)



func _on_area_2d_area_entered(pig):
	if (pig.is_in_group("GuineaPig")):
		$TimeDifference.start(1)


func _on_time_difference_timeout():
	var new_dog = dog_tscn.instantiate()
	new_dog.position.x = -100
	new_dog.position.y = 400
	get_parent().add_child(new_dog)
