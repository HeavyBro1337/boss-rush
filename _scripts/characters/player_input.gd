extends Node

@export var movement : Movement
@export var animator : RotatableAnimator

func _process(delta):
	var dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	
	animator.angle = RotatableAnimator.vec_to_deg(movement.get_global_mouse_position() - movement.position)
	animator.set_animation("walk" if dir != Vector2.ZERO else "idle")
	
	movement.direction = dir
	
func _input(event):
	if event.is_action("shoot"):
		print("Pow!")
