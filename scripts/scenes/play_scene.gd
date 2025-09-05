class_name PlayScene
extends Node

@export var screen_transition: ColorRect
@export var player_health_bar: PlayerHealthBar
@export var pause_menu: PauseMenu

func _ready():
	var player = get_tree().get_first_node_in_group("player") as Player
	player.player_died.connect(_handle_game_over)
	AudioController.play_bg_music("play_scene")
	EventBus.game_paused.connect(_handle_paused)

func _handle_game_over(player: Player):
	var tween = fade_in_overlay()
	await tween.finished
	player.position = player.spawn_location
	
	tween = await fade_out_overlay()
	await tween.finished
	
	player.current_health = player.max_health
	player.current_energy = player.max_energy
	player.is_dead = false
	
	EventBus.player_health_changed.emit(player.current_health, player.max_health)
	EventBus.player_energy_changed.emit(player.current_energy, player.max_energy)

	
func fade_out_overlay():
	var tween = create_tween()
	tween.tween_property(
		screen_transition,
		"color:a",
		0.0,
		1.0	
	).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	return tween
	
func fade_in_overlay():
	var tween = create_tween()
	tween.tween_property(
		screen_transition,
		"color:a",
		1.0,
		1.0	
	).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	return tween

func _on_pause_btn_pressed():
	EventBus.game_paused.emit(true)
	pause_menu.show()
	get_tree().paused = true
	
func _handle_paused(paused: bool):
	if paused:
		screen_transition.color = Color(0,0,0, 0.5)
	else:
		screen_transition.color = Color(0,0,0,0)
	
	
	
	
	
	
	
	
	
	
	
	
