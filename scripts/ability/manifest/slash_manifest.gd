class_name SlashManifest
extends AbilityManifest

func _activate(entity: Entity):
	var mouse_pos = get_viewport().get_camera_2d().get_global_mouse_position()
	look_at(mouse_pos)
