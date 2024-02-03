extends Node2D

var m_speed = 20 
@export var moving = false
var dest = $Destination.global_position

func go_(delta):
	if moving:
		$Octopus.global_position = $Octopus.global_position.move_toward(dest,delta*m_speed)
	if $Octopus.global_position == dest:
		moving = false 

func _process(delta):
	go_(delta)
	if Input.is_action_just_pressed("move_jump"):
		moving=true 
	

	
