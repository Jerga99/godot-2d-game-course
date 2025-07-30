class_name Enemy
extends Entity	

@export var speed: float = 10.0
@export var stop_distance: float = 10.0

var player: Player
var velocity: Vector2
var current_speed: float
var last_position

@onready var ability_controller: AbilityController = $AbilityController

func _ready():
	super._ready()
	last_position = position
	player =  get_tree().get_first_node_in_group("player")
	
	
func _process(delta: float):
	if player != null:
		var dir = (player.position - self.position).normalized()
		
		if position.distance_to(player.position) > stop_distance:
			position += dir * speed * delta
		else:
			ability_controller.trigger_ability_by_idx(0)
		
		velocity = (position - last_position) / delta
		current_speed = velocity.length()
		_face_target(dir)
	
	last_position = position
	_handle_animations()


func _handle_animations():
	if current_speed <= 0:
		play_animation(AnimationWrapper.new("idle"))
	else:
		play_animation(AnimationWrapper.new("walk"))
		
func _face_target(dir: Vector2):
	if not animated_sprite.flip_h and dir.x < 0:
		animated_sprite.flip_h = true
	elif animated_sprite.flip_h and dir.x > 0:
		animated_sprite.flip_h = false
	
	
	
	
	
	
	
	
	
	
	
	
		
