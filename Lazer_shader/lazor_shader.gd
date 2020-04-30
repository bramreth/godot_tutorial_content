extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VSlider_value_changed(value):
	get_material().set_shader_param("intensity", value)


func _on_HSlider_value_changed(value):
	get_material().set_shader_param("layers", value)
