extends CharacterBody2D

var count = 0

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
