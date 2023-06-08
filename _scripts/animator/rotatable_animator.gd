extends Sprite2D

class_name RotatableAnimator

@export var defaultAnimation : Resource
@export var animations : Dictionary
@export var fps : float = 30

signal on_frame_changed()
signal on_animation_end()
signal on_animation_start()

var angle : float = 0
var currentFrame : int = 0
var _time : float = 0

var currentAnimation : String = "Default"


func _process(delta):
	
	print(name)
	var currAnim = get_node("./%s" % currentAnimation)
	
	_time += delta
	
	var in_time = _time >= 1 / fps
	var lt_frame_count = currentFrame + 1 < currAnim.frameCount
	var loop = currAnim.loop
	
	if lt_frame_count and in_time:
		on_frame_changed.emit()
		
		currentFrame += 1
		
		if loop:
			currentFrame %= currAnim.frameCount - 1
			
		if currentFrame == currAnim.frameCount and not loop:
			on_animation_end.emit()
				
		_time -= _time
	texture = currAnim.get_rotated_frame(angle, currentFrame)
	
func _ready():
	var a = load(defaultAnimation.resource_path).instantiate()
	a.name = currentAnimation
	add_child(a, true)
	
	# caching animations
	for k in animations:
		var v = load(animations[k]).instantiate()
		v.name = k
		add_child(v, true)
	
func set_animation(key : String):
	if currentAnimation != key:
		currentFrame = 0
		print("reseting")
	currentAnimation = key
