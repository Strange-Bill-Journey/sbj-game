extends Area2D

func _on_body_entered(body) -> void:
	if body.is_in_group("Player"):
		get_tree().paused = true
		$EndScreen.visible = true
		Global.level_finished = true
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
