class_name AbilitySpawnManifest
extends AbilityComponent

@export var manifest_scene: PackedScene
@export var set_as_child: bool = false
@export var spawn_offset: Vector2 = Vector2.ZERO

func _activate(entity: Entity):
	if manifest_scene == null: return
	
	var ability_manifest = manifest_scene.instantiate() as AbilityManifest
	
	if set_as_child:
		entity.add_child((ability_manifest))
	else:
		var root = get_tree().get_root()
		ability_manifest.position = entity.position
		root.add_child(ability_manifest)
		
	ability_manifest.position += spawn_offset
	ability_manifest.activate(entity)
	
	
