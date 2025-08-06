extends Node

func show_damage_text(damage: String, spawn_pos: Vector2, color: Color):
	var label = Label.new()
	label.text = damage
	label.z_index = 1000
	
	label.label_settings = LabelSettings.new()
	label.label_settings.font_color = color
	label.label_settings.font_size = 18
	label.label_settings.outline_color = "#000"
	label.label_settings.outline_size = 1
	
	add_child(label)
	
	var x_offset = randf_range(-10.0, 10.0)
	var spawn_offset = label.size / 2
	label.position = spawn_pos - spawn_offset
	label.position.x += x_offset
	
