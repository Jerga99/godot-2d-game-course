class_name AbilityContext
extends RefCounted

var caster: Entity
var ability: Ability

func _init(_caster: Entity, _ability: Ability):
	self.caster = _caster
	self.ability = _ability
