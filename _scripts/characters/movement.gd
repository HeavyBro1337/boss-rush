extends CharacterBody2D

class_name Movement

@export var speed : float = 200
@export var sprint_multiplier : float = 1.5
@export var acceleration : float = 0
@export var deceleration : float = 0

var is_sprinting : bool
var direction : Vector2
var current_velocity : Vector2

func _physics_process(delta):
	var vel : Vector2 = current_velocity.move_toward(direction, 
		(acceleration if direction != Vector2.ZERO else deceleration) * delta) 
	
	current_velocity = vel * (1.0 if not is_sprinting else sprint_multiplier)
	
	position += current_velocity * speed * delta
	
	move_and_slide()
