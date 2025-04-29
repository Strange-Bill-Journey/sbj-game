extends Node2D

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		print("The player touched a spike!")
		get_tree().call_deferred("reload_current_scene")
