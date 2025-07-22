class_name AbilityComponent
extends Node

func activate(entity: Entity):
	print("Activation component: ", self.name)
	_activate(entity)
	
func _activate(entity: Entity):
	pass
