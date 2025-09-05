extends Node

func _ready():
	AudioController.play_bg_music("home_scene")

func _on_play_btn_pressed():
	ResourceLocator.go_to_play_scene()

func _on_exit_btn_pressed():
	get_tree().quit()
