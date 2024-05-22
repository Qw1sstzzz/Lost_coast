extends Control

func _ready():
	pass # Replace with function body.

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_quit_button_pressed():
	get_tree().quit()

