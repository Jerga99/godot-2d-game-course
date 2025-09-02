
class_name SpellButton
extends TextureButton

var ability: Ability = null

@export var icon: TextureRect
@export var progress_bar: TextureProgressBar

var binded_key: String = "":
	set (key):
		binded_key = key
		shortcut = Shortcut.new()
		var input_key = InputEventKey.new()
		input_key.keycode = key.unicode_at(0)
		shortcut.events = [input_key]
		
func _process(delta):
	if ability == null: return
	disabled = ability.current_cooldown > 0
	progress_bar.value = ability.current_cooldown
	
		
func set_ability(ability: Ability):
	self.ability = ability
	icon.texture = ability.icon_texture
	progress_bar.max_value = ability.cooldown

func _on_pressed():
	if ability == null: return
	if disabled: return
	
	disabled = true
	EventBus.play_cast_ability.emit(ability)
	
