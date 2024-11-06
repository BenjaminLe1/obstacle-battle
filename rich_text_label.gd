extends RichTextLabel

var b1 = true
var b2 = true
var b3 = true

func _ready() -> void:
	var rawText = Connection.msg
	print(rawText)
	
	if rawText == "B1\n" and b1:
		print("B1 Pressed")
		Collision.B1 = true
		$B1.start
		b1 = false
	if rawText == "B2\n" and b2:
		print("B2 Pressed")
		Collision.B2 = true
		$B1.start
		b1 = false
	if rawText == "B3\n" and b3:
		print("B3 Pressed")
		Collision.B3 = true
		$B1.start
		b1 = false

func _on_b_1_timeout() -> void:
	b1 = true
func _on_b_2_timeout() -> void:
	b2 = true
func _on_b_3_timeout() -> void:
	b3 = true
