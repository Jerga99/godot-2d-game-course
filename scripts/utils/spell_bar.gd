class_name SpellBar
extends PanelContainer

var spell_buttons: Array[SpellButton] = []

@export var button_container: Node

func _ready():
	var i = 1
	for spell_button in button_container.get_children():
		if spell_button is SpellButton:
			spell_buttons.push_back(spell_button)
			spell_button.bind_key(str(i))
			i += 1
			
