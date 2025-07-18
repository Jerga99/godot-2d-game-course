class_name Ability
extends Node

func activate():
	print("Activating ability: ", self.name)
	_activate_components()

func _activate_components():
	for child in get_children():
		if child is AbilityComponent:
			child.activate()
