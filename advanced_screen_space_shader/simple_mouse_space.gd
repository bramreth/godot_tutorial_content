extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var t = get_viewport().get_mouse_position()
	t.x /= get_viewport_rect().size.x
	t.y /= get_viewport_rect().size.y
	$CanvasLayer/ColorRect.get_material().set_shader_param("target", t)
