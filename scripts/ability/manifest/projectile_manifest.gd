
class_name ProjectileManifest
extends AbilityManifest

@export var damage = 10.0
@export var speed = 10.0
@export var target_group: String

var current_dir = Vector2.ZERO

func activate(context: AbilityContext):
	if context.targets.size() > 0:
		var target_pos = context.get_target_position(0)
		current_dir = (target_pos - global_position).normalized()
		look_at(target_pos)

func _process(delta):
	global_position += current_dir * delta * speed


func _on_area_2d_area_entered(area: Area2D):
	var parent = area.get_parent()
	
	if parent != null and parent.is_in_group(target_group):
		if parent is Entity:
			parent.apply_damage(damage)	
			queue_free()
		
		
		
		
		
