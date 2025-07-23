class_name SlashManifest
extends AbilityManifest

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _activate(entity: Entity):
	var mouse_pos = get_viewport().get_camera_2d().get_global_mouse_position()
	look_at(mouse_pos)

func _process(delta):
	if animated_sprite.frame_progress >= 1.0:
		queue_free()
