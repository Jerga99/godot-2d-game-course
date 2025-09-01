
class_name SpellButton
extends TextureButton

var ability: Ability = null

@export var icon: TextureRect

var binded_key: String = "":
	set (key):
		binded_key = key
		shortcut = Shortcut.new()
		var input_key = InputEventKey.new()
		input_key.keycode = key.unicode_at(0)
		shortcut.events = [input_key]
		
func set_ability(ability: Ability):
	self.ability = ability
	icon.texture = ability.icon_texture

func _on_pressed():
	if ability == null: return
	
	print(ability.name + " pressed!")
