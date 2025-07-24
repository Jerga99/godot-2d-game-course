class_name AbilityContext
extends RefCounted

var caster: Entity
var ability: Ability

func _init(caster: Entity, ability: Ability):
	self.caster = caster
	self.ability = ability
