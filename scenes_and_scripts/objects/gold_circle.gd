extends AnimatedSprite2D


var is_collected = false

func _ready() -> void:
	$".".play("default")

# https://www.youtube.com/watch?v=C7ms7YsmPHI
func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player") and not is_collected:
		$coin.play()
		is_collected = true
		Global.total_circles += 1
		hide()
		await get_tree().create_timer(1).timeout
		queue_free()
