extends Node

var current_scene = 'world' #world boss_island village
var transition_scene = false

var player_exit_village_posx = 81
var player_exit_village_posy = -222
var player_start_posx = 0
var player_start_posy = 0

var game_first_loading = true

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene == 'world':
			current_scene = 'village'
		else:
			current_scene = 'world'

