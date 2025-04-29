extends Node2D

@export var scene = "res://scenes_and_scripts/levels/world1/test_level.tscn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.level_finished = false
	Global.total_circles = 0
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func finish_level():
	if Global.level_finished == true:
		Global.level_finished = false
		Global.total_circles = 0
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file(scene)
