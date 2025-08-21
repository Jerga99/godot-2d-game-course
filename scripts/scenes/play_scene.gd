class_name PlayScene
extends Node

func _ready():
	var player = get_tree().get_first_node_in_group("player") as Player
	player.player_died.connect(_handle_game_over)

func _handle_game_over(player: Player):
	player.position = player.spawn_location
	player.is_dead = false
