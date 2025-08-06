extends Node

@onready var damage_font = preload("res://resources/damage_font.tres")

func show_damage_text(damage: String, spawn_pos: Vector2, color: Color):
	var label = Label.new()
	label.text = damage
	label.z_index = 1000
	label.scale = Vector2(0.14, 0.14)
	label.label_settings = LabelSettings.new()
	label.label_settings.font = damage_font
	label.label_settings.font_color = color
	label.label_settings.font_size = 100
	label.label_settings.outline_color = "#000"
	label.label_settings.outline_size = 1
	
	add_child(label)
	
	var x_offset = randf_range(-10.0, 10.0)
	var spawn_offset = label.size / 2
	label.position = spawn_pos - spawn_offset
	label.position.x += x_offset
	label.pivot_offset = label.size / 2
	
	var tween = create_tween()
	
	tween.tween_property(label, "position:x", label.position.x + x_offset, 0.35)
	tween.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	tween.parallel()
	tween.tween_property(label, "position:y", label.position.y - 10, 0.30)
	tween.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	tween.parallel()
	tween.tween_property(label, "scale", Vector2.ZERO, 0.40).set_ease(Tween.EASE_IN)
		
	await tween.finished
	label.queue_free()
	
	
	
	
	
	
	
	
	
	
	
