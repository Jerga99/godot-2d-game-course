
class_name ProjectileManifest
extends AbilityManifest

@export var damage = 10.0
@export var speed = 10.0
@export var target_group: String
@export var max_distance = 1000.0
@export var rotating = false
@export var rotation_speed = 360.0
@export var hit_sound: AudioConfig

var current_dir = Vector2.ZERO
var current_distance = 0.0

func activate(context: AbilityContext):
	if context.targets.size() > 0:
		var target_pos = context.get_target_position(0)
		current_dir = (target_pos - global_position).normalized()
		look_at(target_pos)

func _process(delta):
	var movement = current_dir * delta * speed
	current_distance += movement.length()
	global_position += movement
	
	if rotating:
		rotate(deg_to_rad(rotation_speed) * delta)
	
	if current_distance >= max_distance:
		queue_free()
	
func _on_area_2d_area_entered(area: Area2D):
	var parent = area.get_parent()
	
	if parent != null and parent.is_in_group(target_group):
		if parent is Entity:
			parent.apply_damage(damage)	
			
			if hit_sound != null: AudioController.play(hit_sound, global_position)
			
			queue_free()
		
		
		
		
		
