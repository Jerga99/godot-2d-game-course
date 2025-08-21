class_name PlayScene
extends Node

func handle_game_over(player: Player):
	player.position = player.spawn_location
	player.is_dead = false
	print("Game over!")
