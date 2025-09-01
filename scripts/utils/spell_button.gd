
class_name SpellButton
extends TextureButton

var binded_key: String = ""

func bind_key(key: String):
	binded_key = key
	shortcut = Shortcut.new()
	var input_key = InputEventKey.new()
	input_key.keycode = key.unicode_at(0)
	shortcut.events = [input_key]

func _on_pressed():
	print(binded_key + " pressed!")
