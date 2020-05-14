extends Sprite

var n = (get_material().get_shader_param("noise") as NoiseTexture)
var time = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * 100
	var i = (n.noise.get_noise_1d(time) + 1) * 1.5
	$Light2D.scale = Vector2(0.5 + i, 0.5 + i)
