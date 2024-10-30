extends RichTextLabel

func _ready() -> void:
	var rawText = get_parsed_text();
	if rawText == "B1\n":
		Collision.B1 = true;
	if rawText == "B2\n":
		Collision.B2 = true;
	if rawText == "B3\n":
		Collision.B3 = true;
