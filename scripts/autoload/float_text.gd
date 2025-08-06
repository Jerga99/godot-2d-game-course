extends Node

func show_damage_text(damage: String, position: Vector2, color: Color):
	var label = Label.new()
	label.text = damage
	label.z_index = 1000
	
	label.label_settings = LabelSettings.new()
	label.label_settings.font_color = color
	label.label_settings.font_size = 18
	label.label_settings.outline_color = "#000"
	label.label_settings.outline_size = 1
	
	label.position = position
	
	add_child(label)
	
