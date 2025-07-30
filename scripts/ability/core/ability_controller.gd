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
			
func _process(delta: float):
	for ability in cooldowns.keys():
		if cooldowns[ability] > 0.0:
			var cooldown = max(0.0, cooldowns[ability] - delta)
			cooldowns[ability] = cooldown		

func trigger_ability_by_idx(idx: int):
	if abilities.size() == 0: return
	
	var ability = abilities.get(idx)
	_trigger_ability(ability)
	
func _trigger_ability(ability: Ability):
	if ability == null:
		print("Ability not found!")
		return
		
	if cooldowns.get(ability, 0.0) > 0.0:
		#print(ability.name + " is on cooldown!")
		return
 
	ability.activate(entity)
	cooldowns[ability] = ability.cooldown
	
	
	
	
	
	
	
	
	
	
	
	
	
	
