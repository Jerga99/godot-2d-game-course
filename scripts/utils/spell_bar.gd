class_name SpellBar
extends PanelContainer

var spell_buttons: Array[SpellButton] = []

@export var button_container: Node

func _enter_tree():
	var i = 1
	for spell_button in button_container.get_children():
		if spell_button is SpellButton:
			spell_buttons.push_back(spell_button)
			spell_button.binded_key = str(i)
			i += 1
			
func register_ability(ability: Ability, idx: int):
	if idx >= 0 and idx < spell_buttons.size():
		var spell_button = spell_buttons[idx]
		spell_button.set_ability(ability)
