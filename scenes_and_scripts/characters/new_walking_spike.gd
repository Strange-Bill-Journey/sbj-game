extends Sprite2D

@export var distance = -100
@export var speed = 2

func _ready():
	move_up()
	
func move_up():
	await get_tree().create_timer(0.5).timeout
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(distance, 0), speed).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_callback(move_down)
	$".".flip_h = false

func move_down():
	await get_tree().create_timer(0.5).timeout
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(-distance, 0), speed).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_callback(move_up)
	$".".flip_h = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("The player touched a Walking Spike")
		Global.total_circles = 0
		get_tree().paused = true
		$fall.play()
		$EndScreen.visible = true
		Global.level_finished = true
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
