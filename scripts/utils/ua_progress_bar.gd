class_name UAProgressBar
extends TextureProgressBar

var _max_value = 100

func update_value(ua_current_value: float, ua_max_value: float):
	var value_proportion = _max_value / ua_max_value
	value = clamp(ua_current_value * value_proportion, 0, _max_value)
