extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_timer()
	pass # Replace with function body.

var seconds = 0
var minutes = 0
var Dseconds = 30
var Dminutes = 1

func _on_timer_timeout() -> void:
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -=1
	
	$Label.text = str(minutes) + ": " + str(seconds)
	pass # Replace with function body.

func reset_timer():
	seconds = Dseconds
	minutes = Dminutes
