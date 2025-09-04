extends Node

var _play_scene: PlayScene = null

var packed_play_scene: PackedScene = preload("res://scenes/play_scene.tscn")
var packed_home_scene: PackedScene = preload("res://scenes/home_scene.tscn")

func _ready():
	_play_scene = get_tree().root.get_node("PlayScene")

func get_play_scene() -> PlayScene:
	if _play_scene == null:
		_play_scene = get_tree().root.get_node("PlayScene")
		
	return _play_scene

func go_to_play_scene():
	get_tree().change_scene_to_packed(packed_play_scene)
	
func go_to_home_scene():
	get_tree().change_scene_to_packed(packed_home_scene)
