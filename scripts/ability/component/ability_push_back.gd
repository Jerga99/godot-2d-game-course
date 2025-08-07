class_name AbilityPushBack
extends AbilityComponent

@export var push_back_distance = 30
@export var duration = 1.0
@export var frequency = 3

var push_back_counter = 0

func _activate(context: AbilityContext):
	push_back_counter += 1
	
	if push_back_counter == frequency:
		push_back_counter = 0
		var caster = context.caster
		var caster_pos = caster.position
		var mouse_pos = get_window().get_camera_2d().get_global_mouse_position()
		
		var push_dir = (caster_pos - mouse_pos).normalized()
		var target_pos = caster_pos + push_dir * push_back_distance
		
		var tween = create_tween()
		tween.tween_property(caster, "position", target_pos, duration)
		tween.set_ease(Tween.EASE_OUT)
