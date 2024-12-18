extends CharacterBody2D

@export var max_speed : float = 80
@export var acceleration_time : float ## The time it takes you to reach maximum speed, in seconds

@onready var acceleration = max_speed/acceleration_time
@onready var sprite = $AnimatedSprite2D

var target_direction : Vector2
var direction : Vector2 = Vector2.ZERO
var speed : float
var time : float
var move_time : float

func _physics_process(delta):
	time += delta
	target_direction = Input.get_vector("left","right","up","down").normalized()
	if target_direction:
		if speed < max_speed:
			speed += acceleration * delta
		else: speed = max_speed
	if !target_direction:
		speed = 0
	direction = target_direction
	direction.x = round(direction.x)
	direction.y = round(direction.y)
	direction = direction.normalized()
	print(speed)
	velocity = direction * speed
	move_and_slide()

func _process(delta: float) -> void:
	#sprite.global_position.x = round(self.global_position.x)
	#sprite.global_position.y = round(self.global_position.y)
	pass
