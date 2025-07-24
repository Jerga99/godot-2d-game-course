class_name Ability
extends Node

func activate(entity: Entity):
	var context = AbilityContext.new(entity, self)
	
	print("Activating ability: ", self.name)
	_activate_components(context)

func _activate_components(context: AbilityContext):
	for child in get_children():
		if child is AbilityComponent:
			child.activate(context)
