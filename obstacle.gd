extends CharacterBody2D

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		queue_free()
		var collided_with = collision_info.get_collider()
		if collided_with.is_in_group("player"):
			collided_with.collision_count += 1
			print(collided_with.collision_count) # Increment the player's collision counter
			
			queue_free()  # Destroy the obstacle on collision
