extends RichTextLabel

func _ready() -> void:
	var rawText = "s"
	print(rawText)
	if rawText == "B1\n":
		print("B1 Pressed")
		Collision.B1 = true
	if rawText == "B2\n":
		print("B2 Pressed")
		Collision.B2 = true
	if rawText == "B3\n":
		print("B3 Pressed")
		Collision.B3 = true
