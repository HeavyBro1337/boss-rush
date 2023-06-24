extends Node

@export var movement : Movement

var animator : RotatableAnimator
var legs : RotatableAnimator

func _ready():
	animator = get_parent().get_node("Visuals")
	legs = get_parent().get_node("Legs")

func _process(delta):
	var is_sprinting = Input.is_action_pressed("sprint")
	var dir : Vector2 = Input.get_vector("left", "right", "up", "down")
	var mouse_dir = position.direction_to(get_local_mouse_position())
	var is_moving_backwards = dir.dot(mouse_dir) < 0

	animator.angle = RotatableAnimator.vec_to_deg(mouse_dir)
	
func _input(event):
	if event.is_action("shoot"):
		print("Pow!")
    
	if dir != Vector2.ZERO:
		if not is_moving_backwards:
			animator.set_animation("walk" if not is_sprinting else "run")
			legs.set_animation("walk" if not is_sprinting else "run")
			legs.angle = rad_to_deg(dir.angle())
		else:
			animator.set_animation("walk_back")
			legs.set_animation("walk_back")
			legs.angle = rad_to_deg(fmod(dir.angle(), 360) + 180)
			print(legs.angle)
	else:
		legs.set_animation("idle")
	movement.direction = dir
	movement.is_sprinting = is_sprinting and not is_moving_backwards
