class_name PlayerHealthBar
extends TextureProgressBar

var _max_value = 100

func set_health(current_health: float, max_health: float):
	var value_proportion = _max_value / max_health
	value = clamp(current_health * value_proportion, 0, _max_value)
	
#	player with 100 MAX HEALTH = 100 / 100 = 1, if player has 50 HEALTH then 50 * 1 = 50 ON PROGRESS BAR
#   plauer with 250 MAX HEALTH = 100 / 250  = 0.4, if player has 125 HEALTH then 125 * 0.4 = 50 ON PROGRESS BAR
