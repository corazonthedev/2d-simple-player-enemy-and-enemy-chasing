extends CharacterBody2D

@onready var anim = $AnimationPlayer
@export var speed: int = 10
@export var chase = false 
func _on_chase_area_body_entered(body):
	if body.name == "player":
		chase = true
func _on_chase_area_body_exited(body):
	if body.name == "player":
		chase = false
func chasing():
	var player
	if chase == true:
		#player = get_node("../../TileMap/player")
		player = get_node("../../Node2D/player")
		var direction = (player.global_position - global_position).normalized()
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
		if velocity.y > 0: direction = "Down"
		elif velocity.x < 0: direction = "Left" 
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
		anim.play("walk" + direction)
		print(direction)
		
	else:
			anim.play("Idle")
			velocity.x = 0 
			velocity.y = 0

@export var limit = 0.5
var startPosition
var endPosition 
func _ready():
	startPosition = position
	endPosition = startPosition + Vector2(0,2) #up
func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd
func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		changeDirection()
	velocity = moveDirection.normalized() * speed
	
	
func _physics_process(delta):
	updateVelocity()
	chasing()
	
	move_and_slide()

