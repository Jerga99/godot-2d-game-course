class_name Ability
extends Node

func activate(entity: Entity):
	print("Activating ability: ", self.name)
	_activate_components(entity)

func _activate_components(entity: Entity):
	for child in get_children():
		if child is AbilityComponent:
			child.activate(entity)
