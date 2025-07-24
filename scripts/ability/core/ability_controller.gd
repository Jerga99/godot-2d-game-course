class_name AbilityController
extends Node

var abilities: Array[Ability] = []
var cooldowns: Dictionary = {}
var entity: Entity

func _ready():
	entity = get_parent()
	
	for child in get_children():
		if child is Ability:
			abilities.push_back(child)

func trigger_ability_by_idx(idx: int):
	if abilities.size() == 0: return
	
	var ability = abilities.get(idx)
	_trigger_ability(ability)
	
func _trigger_ability(ability: Ability):
	if ability == null:
		print("Ability not found!")
		return

	ability.activate(entity)
