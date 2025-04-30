extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		$Area2D.set_deferred("monitorable", false)
		$Area2D.set_deferred("monitoring", false)
		$coin.play()
		move_up()
		await get_tree().create_timer(0.1).timeout
		move_down()
		Global.total_circles += 1
		$AnimatedSprite2D.play("hit")

func move_up():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -10), 0.1)
	tween.tween_callback(move_down)

func move_down():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, 10), 0.1)
