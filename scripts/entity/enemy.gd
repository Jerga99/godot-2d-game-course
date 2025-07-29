class_name Enemy
extends Entity	

var player: Player

@export var speed: float = 10.0

func _ready():
	super._ready()
	player =  get_tree().get_first_node_in_group("player")
	
	
func _process(delta: float):
	if player != null:
		var dir = (player.position - self.position).normalized()
		self.position += dir * speed * delta
		
