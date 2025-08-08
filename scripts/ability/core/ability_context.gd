class_name AbilityContext
extends RefCounted

var caster: Entity
var ability: Ability
var targets: Array[Variant] = []

func _init(_caster: Entity, _ability: Ability):
	self.caster = _caster
	self.ability = _ability
	
func get_target_position(idx: int) -> Vector2:
	var target = targets[idx]
	if target is Entity:
		return target.global_position
	elif target is Vector2:
		return target
	else:
		return Vector2.ZERO
