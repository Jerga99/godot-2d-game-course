class_name SpawnObjectAc
extends AbilityComponent

@export var object_scene: PackedScene

func _activate(entity: Entity):
	if object_scene == null: return
	
	var node = object_scene.instantiate()
	entity.add_child((node))
	
