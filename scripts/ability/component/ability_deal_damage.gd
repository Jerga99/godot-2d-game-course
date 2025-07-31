class_name AbilityDealDamage
extends AbilityComponent

@export var damage: float = 10.0

func _activate(context: AbilityContext):
	if context.target != null and context.target is Entity:
		context.target.apply_damage(damage)
