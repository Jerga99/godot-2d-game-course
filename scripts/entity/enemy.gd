class_name Enemy
extends Entity	

var player: Player
var velocity: Vector2
var current_speed: float
var last_position

@export var speed: float = 10.0

func _ready():
	super._ready()
	last_position = position
	player =  get_tree().get_first_node_in_group("player")
	
	
func _process(delta: float):
	if player != null:
		var dir = (player.position - self.position).normalized()
		self.position += dir * speed * delta
	
	velocity = (position - last_position) / delta
	current_speed = velocity.length()
	last_position = position
	
	_handle_animations()


func _handle_animations():
	if current_speed <= 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
	
	
	
	
	
	
	
	
	
	
	
	
		
