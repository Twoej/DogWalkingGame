extends Node2D


func _on_trampoline_area_entered(martian):
	if (martian.is_in_group("martian")):
		martian.bounced = true


func _on_win_timer_timeout():
	pass
