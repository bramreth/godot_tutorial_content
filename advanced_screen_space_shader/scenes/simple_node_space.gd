extends Node2D

onready var target = get_node("icon")
var toggle = false
export var n: NodePath
var nod

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var t = target.get_global_transform_with_canvas().origin
	t.x = clamp(t.x, 0, get_viewport_rect().size.x)
	t.y = clamp(t.y, 0, get_viewport_rect().size.y)
	t.x /= get_viewport_rect().size.x
	t.y /= get_viewport_rect().size.y
	nod = get_node(n)
	nod.get_material().set_shader_param("target", t)

func _input(event):
	if Input.get_action_strength("ui_accept"):
		$CanvasLayer/Tween.interpolate_property(
			nod.get_material(),
			"shader_param/intensity", 
			float(toggle), 
			float(not toggle), 
			1, 
			Tween.TRANS_LINEAR,
			Tween.EASE_IN
			)
		toggle = not toggle
		$CanvasLayer/Tween.start()
