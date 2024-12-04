extends RichTextLabel

var b1 = true
var b2 = true
var b3 = true

var pb1 = true
var pb2 = true
var pb3 = true

func print(msg):
	print(msg)
func msg(message, type):
	if type == "B":
		if message == "B1\n" and b1:
			print("B1 Pressed")
			Collision.B1 = true
			$B1.start()
			b1 = false
		if message == "B2\n" and b2:
			print("B2 Pressed")
			Collision.B2 = true
			$B2.start()
			b2 = false
		if message == "B3\n" and b3:
			print("B3 Pressed")
			Collision.B3 = true
			$B3.start()
			b3 = false
	elif type == "X": #0 - 4000
		Collision.X = int(message)
	elif type == "Y": #0 - 4000
		Collision.Y = int(message)
func msg2(message, type):
	if type == "B":
		if message == "pB1\n" and pb1:
			print("pB1 Pressed")
			Collision.pB1 = true
			$pB1.start()
			pb1 = false
		if message == "pB2\n" and pb2:
			print("pB2 Pressed")
			Collision.pB2 = true
			$pB2.start()
			pb2 = false
		if message == "pB3\n" and pb3:
			print("pB3 Pressed")
			Collision.pB3 = true
			$pB3.start()
			pb3 = false
	elif type == "X": #0 - 4000
		Collision.pX = int(message)
	elif type == "Y": #0 - 4000
		Collision.pY = int(message)
func hit():
	if Collision.hit2:
		Collision.hit2 = false
		return "HIT"
	else:
		return ""
func getReturn():
	return str(Collision.lives)
func getReturn2():
	return str(Collision.lives)
func _on_b_1_timeout() -> void:
	b1 = true
func _on_b_2_timeout() -> void:
	b2 = true
func _on_b_3_timeout() -> void:
	b3 = true
func _on_p_b_1_timeout() -> void:
	pb1 = true
func _on_p_b_2_timeout() -> void:
	pb2 = true
func _on_p_b_3_timeout() -> void:
	pb3 = true
