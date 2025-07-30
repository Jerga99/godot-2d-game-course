class_name AbilitySpawnManifest
extends AbilityComponent

@export var manifest_scene: PackedScene
@export var set_as_child: bool = false
@export var spawn_offset: Vector2 = Vector2.ZERO

func _activate(context: AbilityContext):
	if manifest_scene == null: return
	
	var ability_manifest = manifest_scene.instantiate() as AbilityManifest
	var caster = context.caster
	
	if set_as_child:
		caster.add_child((ability_manifest))
	else:
		var root = get_tree().get_root()
		ability_manifest.position = caster.position
		root.add_child(ability_manifest)
		
	ability_manifest.position += spawn_offset
	ability_manifest.activate(context)
	
	
