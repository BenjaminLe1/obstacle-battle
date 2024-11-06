extends CanvasLayer

var collisions = 0
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func _process(delta: float) -> void:
	$collisioncount.text = "Lives: " + str(Collision.lives) + "   Energy: " + str(Collision.energy)+ "   Special: " + str(Collision.special)
