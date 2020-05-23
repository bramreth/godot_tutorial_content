extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var t = get_viewport().get_mouse_position()
	t.x /= get_viewport_rect().size.x
	t.y /= get_viewport_rect().size.y
	$CanvasLayer/ColorRect.get_material().set_shader_param("target", t)
