extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.level_finished = false
	Global.total_circles = 0
	get_tree().paused = false
	$CircleUI.visible = true

func _on_scene_changer_body_entered(body) -> void:
	if body.is_in_group("Player"):
		print("why do i hear boss music?")
		$SceneChanger.set_deferred("monitoring", false)
		$SceneChanger.set_deferred("monitorable", false)
		get_tree().call_deferred("change_scene_to_file", "res://scenes_and_scripts/levels/world1/level4b.tscn")
