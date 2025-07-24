class_name AbilityComponent
extends Node

func activate(context: AbilityContext):
	print("Activation component: ", self.name)
	_activate(context)
	
func _activate(context: AbilityContext):
	pass
