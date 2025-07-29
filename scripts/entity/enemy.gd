class_name Enemy
extends Entity	

var player: Player

func _ready():
	super._ready()
	player =  get_tree().get_first_node_in_group("player")
	print(player.name)
