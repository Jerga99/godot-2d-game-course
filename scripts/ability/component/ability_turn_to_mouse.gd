class_name AbilityTurnToMouse
extends AbilityComponent

func _activate(context: AbilityContext):
	var mouse_pos = get_window().get_camera_2d().get_global_mouse_position()
	context.caster.turn_to_position(mouse_pos)
