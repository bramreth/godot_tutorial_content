extends KinematicBody2D


var firing = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	$body/Position2D.look_at(get_global_mouse_position())
	
	if firing:
		$Camera2D.trauma = int(firing)
		var pt = $body/Position2D/RayCast2D.get_collision_point() - global_position
		pt = pt.abs()
		if pt:
			print(pt)
			$body/Position2D/lazor.polygon[2].x = pt.length()
			$body/Position2D/lazor.polygon[3].x = pt.length()
			$body/Position2D/lazor/Particles2D.position.x = pt.length()
		
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if not $body/Position2D/AnimationPlayer.is_playing():
					$body/Position2D/AnimationPlayer.play("blast")
					firing = true
			#released
			else:
				$body/Position2D/AnimationPlayer.play("blast_off")
				firing = false
				
	if Input.get_action_strength("ui_up"):
		$body/Position2D/lazor.get_material().set_shader_param("funk", 0)
	if Input.get_action_strength("ui_down"):
		$body/Position2D/lazor.get_material().set_shader_param("funk", 1)
	if Input.get_action_strength("ui_left"):
		$body/Position2D/lazor.get_material().set_shader_param("funk", 2)
	if Input.get_action_strength("ui_right"):
		$body/Position2D/lazor.get_material().set_shader_param("funk", 3)
				
				
