extends Node2D


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	get_tree().paused = false
	if Input.is_action_just_pressed("ui_enter"):
		get_tree().change_scene_to_file("res://scenes_and_scripts/levels/world1/test_level.tscn")
	if Input.is_action_just_pressed("ui_space"):
		OS.shell_open("https://github.com/Strange-Bill-Journey/sbj-game/wiki/Credits")
