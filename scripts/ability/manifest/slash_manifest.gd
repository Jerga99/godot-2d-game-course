class_name SlashManifest
extends AbilityManifest

@export var rotation_offset: float = 45.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

static var alternate_slash: bool = true

func _activate(context: AbilityContext):
	var mouse_pos = get_viewport().get_camera_2d().get_global_mouse_position()
	look_at(mouse_pos)
	
	alternate_slash = not alternate_slash
	animated_sprite.flip_v = alternate_slash
	
	var weapon = context.caster.get_node("Weapon") as Node2D
	
	if weapon != null:
		var base_angle = (mouse_pos - context.caster.global_position).angle()
		var offset_rad = deg_to_rad(rotation_offset)
		
		if alternate_slash:
			offset_rad = -offset_rad
		
		var weapon_angle = base_angle + offset_rad
		var weapon_direction = Vector2(cos(weapon_angle), sin(weapon_angle))
		
		weapon.global_position  = context.caster.global_position + weapon_direction * 15.0
		weapon.rotation = weapon_angle + PI / 2
			
func _process(delta):
	if animated_sprite.frame_progress >= 1.0:
		queue_free()
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
