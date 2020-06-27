extends Node2D


func set_bound(texture_in, xin, yin, gpos):
	$Particles2D.process_material.set_shader_param("collision_bound", texture_in)
	#$Particles2D.process_material.set_shader_param("gpos", gpos)
	$Particles2D.process_material.set_shader_param("xdim", xin)
	$Particles2D.process_material.set_shader_param("ydim", yin)
