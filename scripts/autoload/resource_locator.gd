extends Node

var _play_scene: PlayScene = null

func _ready():
	_play_scene = get_tree().root.get_node("PlayScene")

func get_play_scene() -> PlayScene:
	if _play_scene == null:
		_play_scene = get_tree().root.get_node("PlayScene")
		
	return _play_scene
