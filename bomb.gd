extends CharacterBody2D

var count = 0
const bombParticle = preload("res://bombParticle.tscn")
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collided_with = collision_info.get_collider()
		if collided_with.is_in_group("player"):
			collided_with.collision_count += 1
			count += 1
			Collision.lives -= 1
			queue_free()  # Destroy the obstacle on collision
		else:
			queue_free()
func _on_timer_timeout() -> void:
	var _particle = bombParticle.instantiate()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true
	get_tree().current_scene.add_child(_particle)
	queue_free()
