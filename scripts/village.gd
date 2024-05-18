extends Node2D

var slime_preload = preload("res://scenes/slime.tscn")

func _process(delta):
	change_scenes()

func _on_village_exit_point_body_entered(body):
	if body.has_method('player'):
		global.transition_scene = true

func _on_village_exit_point_body_exited(body):
	if body.has_method('player'):
		global.transition_scene = false

func change_scenes():
	if global.transition_scene == true:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		if global.current_scene == 'village':
			get_tree().change_scene_to_file("res://scenes/world.tscn")
			global.finish_changescenes()
	

func _on_spawner_timeout():
	slime_spawn()

func slime_spawn():
	var slime = slime_preload.instantiate()
	slime.position = Vector2(randi_range(575, 760), randi_range(153,238))
	$Mobs.add_child(slime)
