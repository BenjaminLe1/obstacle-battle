extends CharacterBody2D

signal collision_count_updated(new_count)

var pass_border = 0

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		var collided_with = collision_info.get_collider()
		if collided_with.is_in_group("player"):
			collided_with.collision_count += 1
			print(collided_with.collision_count) # Increment the player's collision counter
			emit_signal("collision_count_updated", collided_with.collision_count)
			queue_free()  # Destroy the obstacle on collision
		else:
			queue_free()
