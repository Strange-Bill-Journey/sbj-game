extends AnimatedSprite2D


func _ready():
	move_up()
	
func move_up():
	$".".play("up")
	await get_tree().create_timer(0.05).timeout
	$".".play("default")
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -50), 1)
	tween.tween_callback(move_down)

func move_down():
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, 50), 1)
	tween.tween_callback(move_up)
