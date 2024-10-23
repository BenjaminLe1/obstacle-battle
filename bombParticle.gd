extends GPUParticles2D

func _ready():
	emitting = true
	
func _process(delta):
	if !emitting:
		queue_free()
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Collision.lives -= 1
