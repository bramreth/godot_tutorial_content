extends Camera2D

func _on_VSlider_value_changed(value):
	$CanvasLayer/ColorRect.get_material().set_shader_param("offset", value)
