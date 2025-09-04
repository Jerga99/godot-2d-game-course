extends Node

var buffer_size = 5
var available_players: Array[AudioStreamPlayer2D] = []

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	_setup_audio_players()

func _setup_audio_players():
	for i in range(buffer_size):
		var audio_player = AudioStreamPlayer2D.new()
		available_players.push_back(audio_player)
		add_child(audio_player)
		
func _get_avaiable_player():
	var player_idx = available_players.find_custom(func(player: AudioStreamPlayer2D):
		return not player.playing
	)
	
	if player_idx > -1:
		return available_players[player_idx]
	else: return null

		
func play(clip_config: AudioConfig, global_pos = Vector2.INF):
	if clip_config == null: return
	var audio_steams = clip_config.audio_streams
	if audio_steams.is_empty(): return
	
	var audio_player = _get_avaiable_player()
	
	if audio_player == null:
		_setup_audio_players()
		audio_player = _get_avaiable_player()
		
	var random_idx = randi() % clip_config.audio_streams.size()
		
	audio_player.stop()
	
	if global_pos != Vector2.INF:
		audio_player.global_position = global_pos
	
	audio_player.volume_db = clip_config.volume_db
	audio_player.max_distance = clip_config.max_distance
	audio_player.stream = clip_config.audio_streams[random_idx]
	audio_player.bus = clip_config.bus
	audio_player.play()
	
	return audio_player
	
	
	
	
	
	
	
	
	
	
	
