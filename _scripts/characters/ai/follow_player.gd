extends NavigationAgent2D

@export var movement : Movement
@export var animator : RotatableAnimator

var player : Node2D

func _ready():
	player = get_node("/root/Scene/Player")
	target_position = player.position

func _process(delta):
	target_position = player.position
	var dir : Vector2 = (get_next_path_position() - movement.position).normalized()
	animator.angle = RotatableAnimator.vec_to_deg(dir)
	movement.direction = dir
