extends CharacterBody2D

@export var speed: int = 50 #set speed 
@onready var anim = $AnimationPlayer #set animation to $

func handleInput():
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down") #get input 
	velocity = moveDirection * speed #move 
	
func updateAnimation():
	if velocity.length() == 0: #if velocity(movement) > 0 
		if anim.is_playing():
			anim.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left" 
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
		anim.play("walk" + direction)
	
		
func _physics_process(delta):
	handleInput()
	updateAnimation()
	move_and_slide()
