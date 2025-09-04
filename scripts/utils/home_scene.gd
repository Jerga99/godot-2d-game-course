extends Node

func _on_play_btn_pressed():
	ResourceLocator.go_to_play_scene()

func _on_exit_btn_pressed():
	get_tree().quit()
