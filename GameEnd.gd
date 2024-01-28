extends Timer

func _ready():
	$"/root/Global".reload = true

var world: PackedScene = preload("res://World/world.tscn")

func _on_timeout():
	get_tree().change_scene_to_packed(world)

func _loss():
	$Loss.set_visible(true)
	$"/root/Global".score += 1000
	$"/root/Global".minigames_played += 1
	
func _win():
	$Win.set_visible(true)
	$"/root/Global".score -= 1000
	$"/root/Global".minigames_played += 1
