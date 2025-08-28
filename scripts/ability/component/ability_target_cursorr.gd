class_name AbilityTargetCursor
extends AbilityComponent

func _activate(context: AbilityContext):
	var mouse_pos = get_window().get_camera_2d().get_global_mouse_position()
	context.targets = [mouse_pos]
