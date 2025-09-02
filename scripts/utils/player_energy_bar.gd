class_name PlayerEnergyBar
extends UAProgressBar

func _enter_tree():
	EventBus.player_energy_changed.connect(update_value)
