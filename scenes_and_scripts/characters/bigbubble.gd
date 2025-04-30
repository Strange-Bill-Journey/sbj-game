extends AnimatedSprite2D


func _ready():
	move_up()
	
func move_up():
	$".".play("up")
	await get_tree().create_timer(0.05).timeout
	$".".play("default")
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -50), 0.3)
	tween.tween_callback(move_down)

func move_down():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, 50), 0.3)
	tween.tween_callback(move_up)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("The player touched a Jumping Bubble!")
		Global.total_circles = 0
		get_tree().call_deferred("reload_current_scene")
