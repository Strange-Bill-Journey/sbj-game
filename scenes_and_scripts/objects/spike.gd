extends Node2D

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		print("The player touched a spike!")
		Global.total_circles = 0
		get_tree().paused = true
		$fall.play()
		$EndScreen.visible = true
		Global.level_finished = true
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
