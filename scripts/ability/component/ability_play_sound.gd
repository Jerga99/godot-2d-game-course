class_name AbilityPlaySound
extends AbilityComponent

@export var audio_config: AudioConfig

func _activate(context: AbilityContext):
	var stream_player = $"../AudioStreamPlayer2D" as AudioStreamPlayer2D
	
	var randomIdx = randi() % audio_config.audio_streams.size()
	var audio_stream = audio_config.audio_streams[randomIdx]
	stream_player.stream = audio_stream
	stream_player.volume_db = audio_config.volume_db
	stream_player.autoplay = audio_config.autoplay
	stream_player.bus = audio_config.bus
	stream_player.play()
	
