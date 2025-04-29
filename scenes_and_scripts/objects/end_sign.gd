extends Sprite2D

func _ready() -> void:
	$EndScreen.visible = false

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		get_tree().paused = true
		$EndScreen.visible = true
		Global.level_finished = true
		Level.finish_level()
