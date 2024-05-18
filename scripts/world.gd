extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if global.game_first_loading == true:
		$player.position.x = global.player_start_posx
		$player.position.y = global.player_start_posy
	else:
		$player.position.x = global.player_exit_village_posx
		$player.position.y = global.player_exit_village_posy


func _process(delta):
	change_scene()

func _on_village_transition_point_body_entered(body):
	if body.has_method('player'):
		global.transition_scene = true

func _on_village_transition_point_body_exited(body):
	if body.has_method('player'):
		global.transition_scene = false

func change_scene():
	if global.transition_scene == true:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		if global.current_scene == 'world':
			get_tree().change_scene_to_file("res://scenes/village.tscn")
			global.game_first_loading = false
			global.finish_changescenes()
