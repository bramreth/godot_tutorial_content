extends particle_queue

func _input(event):
	if Input.get_action_strength("click"):
		var p = get_next_particle()
		p.global_position = get_global_mouse_position()
		trigger()
