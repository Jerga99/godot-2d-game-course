class_name AbilityDealDamage
extends AbilityComponent

@export var damage: float = 10.0

func _activate(context: AbilityContext):
	if context.target != null:
		print("Deal damage to: ", context.target.name)
