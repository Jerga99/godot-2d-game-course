class_name AbilityComponentGroup
extends AbilityComponent

var sub_components: Array[AbilityComponent] = []

func _ready():
	for child in get_children():
		if child is AbilityComponent:
			sub_components.push_back(child)

func _activate(context: AbilityContext):
	for sub_component in sub_components:
		sub_component.activate(context)
