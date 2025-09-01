class_name SpellBar
extends PanelContainer


var spell_buttons: Array[SpellButton] = []

@export var button_container: Node

func _ready():
	for spell_button in button_container.get_children():
		if spell_button is SpellButton:
			spell_buttons.push_back(spell_button)
			
