extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.level_finished = false
	Global.total_circles = 0
	get_tree().paused = false
	$CircleUI.visible = true

func _on_music_change_body_entered(body) -> void:
	if body.is_in_group("Player"):
		print("why do i hear boss music?")
		$MusicChange.set_deferred("monitoring", false)
		$MusicChange.set_deferred("monitorable", false)
		$levelmusic.stream = load("res://music/boss.ogg")
		$levelmusic.play()
