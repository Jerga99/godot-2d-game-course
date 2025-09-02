
class_name SpellButton
extends TextureButton

var ability: Ability = null

@export var icon: TextureRect
@export var progress_bar: TextureProgressBar
@export var timer: Timer

var binded_key: String = "":
	set (key):
		binded_key = key
		shortcut = Shortcut.new()
		var input_key = InputEventKey.new()
		input_key.keycode = key.unicode_at(0)
		shortcut.events = [input_key]
		
func _process(delta):
	if not timer.is_stopped():
		progress_bar.value = timer.time_left
		
func set_ability(ability: Ability):
	disabled = false
	self.ability = ability
	icon.texture = ability.icon_texture
	
	timer.wait_time = ability.cooldown
	progress_bar.max_value = ability.cooldown

func _on_pressed():
	if ability == null: return
	if disabled: return
	
	timer.start()
	disabled = true
	EventBus.play_cast_ability.emit(ability)
	
func _on_timer_timeout():
	timer.stop()
	disabled = false
