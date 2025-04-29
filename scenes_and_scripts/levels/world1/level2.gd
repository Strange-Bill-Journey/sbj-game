extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.level_finished = false
	Global.total_circles = 0
	get_tree().paused = false
	$CircleUI.visible = true
