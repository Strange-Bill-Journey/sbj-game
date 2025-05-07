extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.level_finished = false
	get_tree().paused = false
	$CircleUI.visible = true
