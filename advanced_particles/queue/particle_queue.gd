extends Node2D
export (PackedScene) var particle
export (int) var buffer_count = 3

var particle_list = []
var index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(buffer_count):
		var p = particle.instance()
		add_child(p)
		particle_list.append(p)
	
func get_next_particle():
	return particle_list[index]
		
func trigger():
	particle_list[index].restart()
	index = (index + 1) % buffer_count

func trigger_all():
	for x in range(buffer_count):
		trigger()
