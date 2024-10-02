extends CanvasLayer

var collisions = 0
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$collisioncount.text = "Collisions: " + str(score) + "\n Lives: " + str(3 - collisions)
	
	
	

func _process(delta: float) -> void:
	pass
