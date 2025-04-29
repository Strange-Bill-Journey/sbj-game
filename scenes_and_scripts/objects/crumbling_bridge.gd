extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		$AnimatedSprite2D.play("crumbling")
		await get_tree().create_timer(0.6).timeout
		queue_free()
