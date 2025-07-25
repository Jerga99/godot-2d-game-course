class_name SlashManifest
extends AbilityManifest

static var alternate_slash: bool = true
@export var rotation_offset: float = 45.0

var cloned_weapon: Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _activate(context: AbilityContext):
	var mouse_pos = get_viewport().get_camera_2d().get_global_mouse_position()
	look_at(mouse_pos)
	
	alternate_slash = not alternate_slash
	animated_sprite.flip_v = alternate_slash
	
	var weapon = context.caster.get_node("Weapon") as Node2D
	
	if weapon != null:
		weapon.hide()
		var base_angle = (mouse_pos - context.caster.global_position).angle()
		var offset_rad = deg_to_rad(rotation_offset)
		
		if !alternate_slash:
			offset_rad = -offset_rad
		
		var weapon_angle = base_angle + offset_rad
		var weapon_direction = Vector2(cos(weapon_angle), sin(weapon_angle))
		
		cloned_weapon = weapon.duplicate()
		cloned_weapon.show()
		context.caster.add_child((cloned_weapon))
		
		cloned_weapon.global_position  = context.caster.global_position + weapon_direction * 15.0
		cloned_weapon.rotation = weapon_angle + PI / 2
			
func _process(delta):
	if animated_sprite.frame_progress >= 1.0:
		_finish_attack()
		
func _finish_attack():
	hide()
	if cloned_weapon:
		await get_tree().create_timer(0.25).timeout
		cloned_weapon.queue_free()
	
	queue_free()
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
