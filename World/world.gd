extends Node2D

var minigame1: PackedScene = preload("res://Minigames/GuineaPig/Game1/GuineaPigChase.tscn")
var minigame2: PackedScene = preload("res://Minigames/GuineaPig/Game1/GuineaPigChase.tscn")
var minigame3: PackedScene = preload("res://Minigames/Fish/Game1/fish_balance.tscn")
var minigame4: PackedScene = preload("res://Minigames/Ant/Game1/ant_collecting.tscn")
var minigame5: PackedScene = preload("res://Animals/martian_falling.tscn")
var minigame6: PackedScene = preload("res://Minigames/NormalDog/Game1/fetch.tscn")
var minigame7: PackedScene = preload("res://Minigames/GuineaPig/Game1/GuineaPigChase.tscn")

var minigame_list = [minigame1, minigame2, minigame3, minigame4, minigame5, minigame6, minigame7]

var upcoming_scene: PackedScene

func _ready():
	if ($"/root/Global".minigames_played >= 4):
		$"/root/Global".current_day += 1

func _on_minigame_timer_timeout():
	var minigame = randi_range(0, $"/root/Global".current_day - 1)
	var later_minigame = randi_range(0, 2)
	if (later_minigame == 0):
		minigame + 2
		if (minigame > $"/root/Global".current_day - 1):
			minigame = $"/root/Global".current_day - 1
	$MinigameNotif.position = $"/root/World/Player".position + Vector2(-170, -100)
	if (minigame == 0):
		$MinigameNotif.set_text("The dog is getting away!")
		$LoadTimer.start(2)
	elif (minigame == 1):
		$MinigameNotif.set_text("Protect the defenceless guinea pig")
		$LoadTimer.start(2)
	elif (minigame == 2):
		$MinigameNotif.set_text("Uh oh! Balance the fish bowl")
		$LoadTimer.start(2)
	elif (minigame == 3):
		$MinigameNotif.set_text("The ants are scattering! Catch them")
		$LoadTimer.start(2)
	elif (minigame == 4):
		$MinigameNotif.set_text("The aliens are falling! Catch them")
		$LoadTimer.start(2)
	elif (minigame == 5):
		$MinigameNotif.set_text("Play fetch!")
		$LoadTimer.start(2)
		
	upcoming_scene = minigame_list[minigame]
	

func _on_load_timer_timeout():
	get_tree().change_scene_to_packed(upcoming_scene)
