class_name PlayerHealthBar
extends TextureProgressBar

var _max_value = 100

func _enter_tree():
	EventBus.player_health_changed.connect(set_health)

func set_health(current_health: float, max_health: float):
	var value_proportion = _max_value / max_health
	value = clamp(current_health * value_proportion, 0, _max_value)
