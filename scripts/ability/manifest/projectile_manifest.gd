
class_name ProjectileManifest
extends AbilityManifest

@export var speed = 10.0

var current_dir = Vector2.ZERO

func activate(context: AbilityContext):
	if context.targets.size() > 0:
		var target_pos = context.get_target_position(0)
		current_dir = (target_pos - global_position).normalized()
		look_at(target_pos)

func _process(delta):
	global_position += current_dir * delta * speed
