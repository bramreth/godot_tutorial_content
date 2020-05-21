extends KinematicBody2D

var dir = Vector2()

func _process(delta):
	move_and_slide(dir * 750)

func _input(event):
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	dir = dir.normalized()
