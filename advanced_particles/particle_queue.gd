extends Node2D

export (PackedScene) var particle
export (int) var queue_count = 8

var index = 0

func _ready():
	for _i in range(queue_count):
		add_child(particle.instance())
		
func get_next_particle():
	return get_child(index)
	
func trigger():
	get_next_particle().restart()
	index = (index + 1) % queue_count
