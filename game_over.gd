class_name Main_Menu
extends Control



@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
@export var home_screen =  preload("res://start_screen.tscn") as PackedScene


func _ready():
	print("Entered this ready function")
	start_button.pressed.connect(on_start_pressed)
	exit_button.pressed.connect(on_exit_pressed)
	
func on_start_pressed() -> void:
	print("pressed start button")
	print("Current scene path:", get_tree().current_scene)
	if home_screen:	
		print("Entered if statement")
		get_tree().change_scene_to_packed(home_screen)
		print("changed scene")
	else:
		print("No home screen detected")
	
	

func on_exit_pressed() -> void:
	print("pressed exit button")
	get_tree().quit()
	
