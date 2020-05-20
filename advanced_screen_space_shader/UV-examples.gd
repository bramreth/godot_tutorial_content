extends Node2D


func _input(event):
	if Input.get_action_strength("ui_up"):
		$CanvasLayer/ColorRect.get_material().set_shader_param("mode", 0)
		$CanvasLayer/AnimationPlayer.play("activate")
	if Input.get_action_strength("ui_left"):
		$CanvasLayer/ColorRect.get_material().set_shader_param("mode", 1)
		$CanvasLayer/AnimationPlayer.play("activate")
	if Input.get_action_strength("ui_right"):
		$CanvasLayer/ColorRect.get_material().set_shader_param("mode", 2)
		$CanvasLayer/AnimationPlayer.play("activate")
	if Input.get_action_strength("ui_down"):
		$CanvasLayer/AnimationPlayer.play_backwards("activate")
