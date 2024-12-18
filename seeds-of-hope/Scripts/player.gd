extends CharacterBody2D

const speed = 200
const acceleration = 100
const deceleration = 200

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	var direction = Vector2.ZERO 
	
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	
	
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	
	direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized()

	
	if velocity.length() < speed:
		velocity+=direction*acceleration

	
	move_and_slide()
