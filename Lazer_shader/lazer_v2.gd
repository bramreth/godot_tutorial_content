extends Polygon2D


func fire():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("blast")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
