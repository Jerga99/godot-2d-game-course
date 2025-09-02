class_name PlayerHealthBar
extends UAProgressBar

func _enter_tree():
	EventBus.player_health_changed.connect(update_value)
