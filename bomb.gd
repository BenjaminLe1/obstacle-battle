extends CharacterBody2D

var count = 0
const bombParticle = preload("res://bombParticle.tscn")
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collided_with = collision_info.get_collider()
		if collided_with.is_in_group("player"):
			if Collision.shield:
				Collision.shield = false
			else:
				Collision.hit = true
				Collision.lives -= 1
			queue_free()  # Destroy the obstacle on collision
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
