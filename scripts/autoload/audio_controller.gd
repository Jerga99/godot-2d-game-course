extends Node

var buffer_size = 5
var available_players: Array[AudioStreamPlayer2D] = []

func _ready():
	_setup_audio_players()

func _setup_audio_players():
	for i in range(buffer_size):
		var audio_player = AudioStreamPlayer2D.new()
		available_players.push_back(audio_player)
		add_child(audio_player)
		
func play():
	print("PLaying Sound!")
	
