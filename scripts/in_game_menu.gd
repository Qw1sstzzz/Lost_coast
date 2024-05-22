extends CanvasLayer

@onready var click = $click

func _on_button_pressed():
	click.play()
	await click.finished
	get_tree().change_scene_to_file('res://scenes/menu.tscn')
