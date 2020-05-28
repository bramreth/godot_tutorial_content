extends Sprite

func _ready():
	$CurveTween.play(3.0)
#	$CurveTween.play(1.5, scale.x, scale.x + 1)

func _on_CurveTween_curve_tween(sat):
	scale = Vector2(sat, sat) 
