extends CharacterBody2D


var SPEED = -60.0

# Once again I used a tutorial. Thank god for all the youtube tutorials out there.
# https://www.youtube.com/watch?v=P02PcfgqrY8

# I cant understand any of this, by the way.

var facing_right = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_wall():
		flip()

	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()

	velocity.x = SPEED
	move_and_slide()

func flip():
	facing_right = !facing_right
	scale.x = abs(scale.x) * -1
	if facing_right:
		SPEED = abs(SPEED)
	else:
		SPEED = abs(SPEED) * -1


func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("Player"):
		print("The player touched a moving spike!")
		get_tree().call_deferred("reload_current_scene")
