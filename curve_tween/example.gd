extends Sprite

func _input(event):
	if Input.get_action_strength("ui_accept"):
		$CurveTween.play(2, 100, 600)

func _on_CurveTween_curve_tween(sat):
	position.x  = sat
