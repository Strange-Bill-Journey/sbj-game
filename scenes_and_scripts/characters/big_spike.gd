extends Sprite2D


# https://www.youtube.com/watch?v=MxrEM-jsMsM

func _ready():
	move_up()
	
func move_up():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(-100, 0), 0.5)
	tween.tween_callback(move_down)

func move_down():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(100, 0), 0.5)
	tween.tween_callback(move_up)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("The player touched the big spike!")
		Global.total_circles = 0
		get_tree().paused = true
		$fall.play()
		$EndScreen.visible = true
		Global.level_finished = true
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
