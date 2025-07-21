class_name SpawnObjectAc
extends AbilityComponent

@export var object_scene: PackedScene

func _activate():
	if object_scene == null: return
	
	var node = object_scene.instantiate()
	var play_scene = get_tree().get_root().get_node("PlayScene")
	play_scene.add_child((node))
	
