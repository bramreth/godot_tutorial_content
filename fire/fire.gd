extends Sprite

var time = 0
onready var n = (get_material().get_shader_param("noise") as NoiseTexture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * 75
	var offset = n.noise.get_noise_1d(time)
	$Light2D.scale = Vector2(1.5 + offset/3, 1.5 + offset/3)
