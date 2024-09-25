extends CharacterBody2D

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		# Handle collision if needed
		queue_free()  # Destroy the obstacle on collision
