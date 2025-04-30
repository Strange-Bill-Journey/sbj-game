extends CharacterBody2D


@export var walk_speed = 150.0
@export var acceleration = 0.1
@export var deceleration = 0.05
@export var jump_force = -350.0
@export var decelerate_on_jump_release = 0.1
var speed

# CREDITS:
# https://www.youtube.com/watch?v=aQazVHDztsg

func _ready():
	add_to_group("Player")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y = jump_force
		$jump.play()
	# there's a better way to do this i hate looking at it.
	if Input.is_action_just_released("ui_select") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release

	if is_on_floor() == false:
		$Image.play("jump")
	
	# If I remove this code that's now useless since there's no running, the game breaks. Why?
	# TODO: Find a way to remove this code.
	if Input.is_action_pressed("run"):
		speed = walk_speed # Originally, there was a way to run.
	else:
		speed = walk_speed
	
	if Input.is_anything_pressed() == false:
		$Image.play("default")
	
	if is_on_wall() and is_on_floor():
		$Image.play("default")
		
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, speed * acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * deceleration)
	
	if Input.get_axis("ui_left", "ui_right") and is_on_floor():
		$Image.play("walk")
	
	# flip image when pressing left
	if Input.is_action_pressed("ui_left"):
		$Image.flip_h = true
	
	# flip image when pressing right
	if Input.is_action_pressed("ui_right"):
		$Image.flip_h = false

	move_and_slide()
