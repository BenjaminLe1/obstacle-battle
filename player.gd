extends CharacterBody2D

const deathParticle = preload("res://death.tscn")
@export var game_over =  preload("res://game_over.tscn") as PackedScene
@onready var flash = $Sprite2D/FlashAnimation

var input_vector : Vector2
var acceleration = 200
var max_speed = 200
var rotation_dir : int
const rotation_speed = 3
const friction_weight = 0.1
var collision_count : int = 0  # Collision counter

func _process(delta):
	if Input.is_action_just_pressed("M"): #Collision.B1 and Collision.energy >= 50:
		if not Collision.shield:
			print("Shield Activated")
			shield()
			Collision.energy -= 50
		Collision.B1 = false
	if Input.is_action_just_pressed("N"):#Collision.B2 and Collision.energy >= 30:
		if not Collision.speed:
			print("Speed Up Activated")
			speed_up()
			Collision.energy -= 30
		Collision.B2 = false
	if Input.is_action_just_pressed("B"):#Collision.B3 and Collision.energy >= 70:
		if not Collision.shrink:
			print("Shrink Activated")
			shrink()
			Collision.energy -= 70
		Collision.B3 = false
	if Collision.hit:
		flash.play("flash")
		Collision.hit = false
	if Collision.shield:
		$shield.visible = true
	else:
		$shield.visible = false
	if Collision.lives <= 0:
		Collision.dead = true
		Kill()
		get_tree().change_scene_to_packed(game_over)

		
func shield():
	$shieldTimer.start
	Collision.shield = true
func speed_up():
	$speed_upTimer.start
	acceleration = 600
	max_speed = 600
	Collision.speed = true
func shrink():
	$shrinkTimer.start
	scale.x = .5
	scale.y = .5
	Collision.shrink = true

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
	
	#UPDATE FOR JOYSTICK

func _on_shield_timer_timeout() -> void:
	Collision.shield = false
func _on_speed_up_timer_timeout() -> void:
	acceleration = 200
	max_speed = 200
	Collision.speed = false
func _on_shrink_timer_timeout() -> void:
	scale.x = 1
	scale.y = 1
	Collision.shrink = false
func _on_energy_timeout() -> void:
	if Collision.energy < 100:
		Collision.energy += 1
