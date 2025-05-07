extends Sprite2D

@export var scene = "res://scenes_and_scripts/levels/world1/familiar_path.tscn"

func _ready() -> void:
	$EndScreen.visible = false

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		get_tree().paused = true
		$AudioStreamPlayer.play()
		$EndScreen.visible = true
		Global.level_finished = true
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file(scene)
