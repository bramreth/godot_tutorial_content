extends "res://particle_queue.gd"


func _input(event):
	if Input.is_action_just_pressed("click"):
		var p = get_next_particle()
		p.global_position = get_global_mouse_position()
		p.process_material.set_shader_param("bound", p.to_local(Vector2(0, 400)).y)
		trigger()
