extends Node2D


func _ready():
	for child in get_tree().get_nodes_in_group("zone"):
		child.connect("correct", self, "trigger")
		
func trigger():
	$topple/AnimationPlayer.play("topple")
