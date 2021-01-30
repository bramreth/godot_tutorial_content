extends Node2D

var on = false

func _input(event):
	if Input.get_action_strength("ui_accept"):
		on = not on
		if on:
			$AnimationPlayer.play("glow")
		else:
			$AnimationPlayer.play_backwards("glow")
