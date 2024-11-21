extends CharacterBody2D

var count = 0

var speed = 100 
var target_player = null 
const bombParticle = preload("res://bombParticle.tscn")

func _ready():
	target_player = get_parent().get_node("player")
	print(target_player)
	if target_player:
		print("player is being tracked")

func _physics_process(delta):
	if target_player:
		var direction = (target_player.global_position - global_position).normalized()
		velocity = direction * speed
		rotation = direction.angle()
		var collision_info = move_and_collide(velocity * delta * 2.2)
		if collision_info:
			var collided_with = collision_info.get_collider()
			if collided_with.is_in_group("player"):
				collided_with.collision_count += 1
				count += 1
				Collision.lives -= 1
				queue_free()  
			else:
				var _particle = bombParticle.instantiate()
				_particle.position = global_position
				_particle.rotation = global_rotation
				_particle.emitting = true
				get_tree().current_scene.add_child(_particle)
				queue_free()
				queue_free()


func _on_timer_timeout() -> void:
	var _particle = bombParticle.instantiate()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true
	get_tree().current_scene.add_child(_particle)
	queue_free()
