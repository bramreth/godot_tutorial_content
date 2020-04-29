extends Camera2D

export var noise_seed = 1
var noise_x = OpenSimplexNoise.new()
var noise_y = OpenSimplexNoise.new()
var noise_r = OpenSimplexNoise.new()
var t = 0


var start_ofx = 0
var start_ofy = 0
var max_x = 125
var max_y = 125
var max_r = 235

export(float, 0, 1) var trauma = 0.0 # value from 0 to 1

func _ready():
	start_ofx = offset.x
	start_ofy = offset.y
	noise_x.set_seed(noise_seed + 0)
	noise_y.set_seed(noise_seed + 1)
	noise_r.set_seed(noise_seed + 2)

func _process(delta):
	trauma = lerp(trauma, 0, delta *0.75)
	t += delta * 500
	process_trauma(delta)
	
func process_trauma(delta):
	var shake = trauma * trauma
	offset.x = start_ofx + (shake * max_x * noise_x.get_noise_1d(t))
	offset.y = start_ofy + (shake * max_y * noise_y.get_noise_1d(t))
	rotation_degrees = shake * max_r * noise_r.get_noise_1d(t)
