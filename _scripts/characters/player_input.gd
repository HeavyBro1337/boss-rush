extends Node2D

@export var movement : Movement

func _process(delta):
	var dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	movement.direction = dir
