class_name AbilityDealDamage
extends AbilityComponent

@export var damage: float = 10.0

func _activate(context: AbilityContext):
	var target = context.target
	if target != null:
		if target is Entity:
			target.apply_damage(damage)
