class_name SpawnObjectAc
extends AbilityComponent

@export var object_scene: PackedScene
@export var set_as_child: bool = false
@export var spawn_offset: Vector2 = Vector2.ZERO

func _activate(entity: Entity):
	if object_scene == null: return
	
	var node = object_scene.instantiate() as Node2D
	
	if set_as_child:
		entity.add_child((node))
	else:
		var root = get_tree().get_root()
		node.position = entity.position
		root.add_child(node)
		
	node.position += spawn_offset
			
	
	
