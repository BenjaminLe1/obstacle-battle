extends CharacterBody2D

var input_vector : Vector2
#var vel : Vector2
const acceleration = 300
const max_speed = 500

var rotation_dir : int
const rotation_speed = 3.5
const friction_weight = 0.1

func _physics_process(delta):
	#ADJUST FOR JOYSTICK
	input_vector.x = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	rotation_dir = 0
	#ADJUST FOR JOYSTICK
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir += -1
	velocity += Vector2(input_vector.x * acceleration * delta, 0).rotated(rotation)
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	velocity.y = clamp(velocity.y, -max_speed, max_speed)

	if input_vector.x == 0:
		velocity = lerp(velocity, Vector2.ZERO, friction_weight)
		if abs(velocity.x) <= 0.1:
			velocity.x = 0
		if abs(velocity.y) <= 0.1:
			velocity.y = 0

	rotation += rotation_dir * rotation_speed * delta
	move_and_slide()
