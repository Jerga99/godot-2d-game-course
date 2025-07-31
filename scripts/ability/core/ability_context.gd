class_name AbilityContext
extends RefCounted

var caster: Entity
var ability: Ability
var target: Variant = null

func _init(_caster: Entity, _ability: Ability):
	self.caster = _caster
	self.ability = _ability
	
func get_target_position() -> Vector2:
	if target is Entity:
		return target.global_position
	elif target is Vector2:
		return target
	else:
		return Vector2.ZERO
