extends CharacterBody2D

const deathParticle = preload("res://death.tscn")

var input_vector : Vector2
var acceleration = 200
var max_speed = 200
var rotation_dir : int
const rotation_speed = 3
const friction_weight = 0.1

var collision_count : int = 0  # Collision counter

func _process(delta):
	if Input.is_action_just_pressed("U"):
		shield()
		#IF shield is already true print error message "already active"
	if Input.is_action_just_pressed("I"):
		speed_up()
	if Input.is_action_just_pressed("O"):
		shrink()
	if Collision.shield:
		$shield.visible = true
	else:
		$shield.visible = false
	if Collision.lives <= 0:
		Kill()
func shield():
	$shieldTimer.start
	Collision.shield = true
func speed_up():
	$speed_upTimer.start
	acceleration = 600
	max_speed = 600
func shrink():
	$shrinkTimer.start
	scale.x = .5
	scale.y = .5
func Kill():
	var _particle = deathParticle.instantiate()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true
	get_tree().current_scene.add_child(_particle)
	queue_free()
func _physics_process(delta):
	input_vector.x = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	rotation_dir = 0
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

func _on_shield_timer_timeout() -> void:
	Collision.shield = false
func _on_speed_up_timer_timeout() -> void:
	acceleration = 200
	max_speed = 200
func _on_shrink_timer_timeout() -> void:
	scale.x = 1
	scale.y = 1
