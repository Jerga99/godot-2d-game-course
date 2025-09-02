class_name Ability
extends Node

@export var icon_texture: Texture2D
@export var cooldown: float = 2.0

var current_cooldown: float

func activate(entity: Entity):
	var context = AbilityContext.new(entity, self)
	_activate_components(context)

func _activate_components(context: AbilityContext):
	for child in get_children():
		if child is AbilityComponent:
			child.activate(context)
