extends CanvasLayer

# https://www.youtube.com/watch?v=cvBbkDKT7yI

func _process(_delta):
	$CircleLabel.text = "Circles: " + str(Global.total_circles)
