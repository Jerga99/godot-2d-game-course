class_name SlashManifest
extends AbilityManifest

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

static var alternate_slash: bool = true

func _activate(context: AbilityContext):
	var mouse_pos = get_viewport().get_camera_2d().get_global_mouse_position()
	look_at(mouse_pos)
	
	alternate_slash = not alternate_slash
	animated_sprite.flip_v = alternate_slash

func _process(delta):
	if animated_sprite.frame_progress >= 1.0:
		queue_free()
		
