extends Sprite2D

class_name RotatableAnimator

@export var animation : Dictionary
@export var fps : float = 30
@export var currentFrame : int = 0

signal on_frame_changed()
signal on_animation_end()
signal on_animation_start()

var angle : float = 0
var _time : float = 0



func _process(delta):
	_time += delta
	if _time >= 1 / fps:
		on_frame_changed.emit()
		
		currentFrame += 1
		currentFrame %= $CurrentAnimation.frameCount
		if currentFrame == 0:
			on_animation_end.emit()
		_time -= _time
	texture = $CurrentAnimation.get_rotated_frame(angle, currentFrame)
	
func _ready():
	var a = load(animation.resource_path).instantiate()
	a.name = "CurrentAnimation"
	add_child(a)
