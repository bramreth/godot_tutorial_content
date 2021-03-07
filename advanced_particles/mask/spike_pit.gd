extends Node2D

func tick():
	$spike_origin/AnimationPlayer.play("tick_tick")
	$spike_origin.visible = true


func _on_Area2D_body_entered(body):
	print(body.name)
	if not $spike_origin.visible:
		tick()
	

func blow():
	$spike_origin.visible = false
	$Particles2D.restart()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "tick_tick":
		blow()
		$spike_origin/AnimationPlayer.play("boom")


func _on_hurtbox_body_entered(body):
	body.damage(20)

func _input(event):
	if Input.get_action_strength("ui_accept"):
		tick()
