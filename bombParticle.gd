extends GPUParticles2D

func _ready():
	emitting = true
	
func _process(delta):
	if !emitting:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if Collision.shield:
			Collision.shield = false
		else:
			Collision.hit = true
			Collision.lives -= 1
