extends AnimatedSprite2D


var is_collected = false

func _ready() -> void:
	$".".play("default")

# https://www.youtube.com/watch?v=C7ms7YsmPHI
func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player") and not is_collected:
		is_collected = true
		Global.total_circles += 1
		queue_free()
