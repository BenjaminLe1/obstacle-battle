extends CanvasLayer

var player  # Reference to the player node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$collisioncount.text = "Collisions: 0"
	
	# Get the player node (adjust the path to where the player node is located in your scene)
	player = get_node("player")  # Make sure the path is correct based on your scene structure

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		# Update the Label text with the player's collision_count
		$collisioncount.text = "Collisions: " + str(player.collision_count)
