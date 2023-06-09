extends Node2D

@export var movement : Movement
@export var animator : RotatableAnimator

func _process(delta):
	var dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	
	animator.angle = RotatableAnimator.vec_to_deg(get_local_mouse_position() - position)
	animator.set_animation("walk" if dir != Vector2.ZERO else "idle")
	
	movement.direction = dir
