extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_timer()
	pass # Replace with function body.

# 0.05 SECOND INCREMENTS
var seconds = 0
var minutes = 0
var Dseconds = 0
var Dminutes = 0

func _on_timer_timeout() -> void:
	if seconds == 0:
		if minutes > 0:
			minutes += 1
			seconds = 60
	seconds +=1
	
	$Label.text = "Score: " + str(seconds)
	pass # Replace with function body.

func reset_timer():
	seconds = Dseconds
	minutes = Dminutes
