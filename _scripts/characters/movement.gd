extends CharacterBody2D

class_name Movement

@export var speed : float = 200
@export var acceleration : float = 0
@export var deceleration : float = 0

var direction : Vector2
var currentVelocity : Vector2

func _physics_process(delta):
	var vel : Vector2 = currentVelocity.move_toward(direction, 
		(acceleration if direction != Vector2.ZERO else deceleration) * delta) 
	currentVelocity = vel
	position += currentVelocity * speed * delta
	
	move_and_slide()
