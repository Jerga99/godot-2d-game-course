class_name AbilityDealDamage
extends AbilityComponent

@export var damage: float = 10.0

func _activate(context: AbilityContext):
	var targets = context.targets
	
	for target in targets:
		if target is Entity:
			target.apply_damage(damage)
