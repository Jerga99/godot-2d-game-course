class_name AbilityComponent
extends Node

@export var exec_delay: float = 0.0

func activate(context: AbilityContext):
	
	if exec_delay > 0:
		await get_tree().create_timer(exec_delay, false).timeout
	
	_activate(context)
	
func _activate(context: AbilityContext):
	pass
