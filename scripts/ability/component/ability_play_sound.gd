class_name AbilityPlaySound
extends AbilityComponent

@export var audio_config: AudioConfig

func _activate(context: AbilityContext):
	AudioController.play()
	
