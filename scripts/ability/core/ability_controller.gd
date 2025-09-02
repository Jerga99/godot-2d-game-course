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
	for ability in abilities:
		if cooldowns.get(ability, 0.0) > 0.0:
			var cooldown = max(0.0, cooldowns[ability] - delta)
			cooldowns[ability] = cooldown
			ability.current_cooldown = cooldown
		
		ability.can_be_casted = _can_be_casted(ability)
		
func _can_be_casted(ability: Ability):
	var cd = cooldowns.get(ability, 0.0)
	
	return cd == 0 and ability.energy_cost < entity.current_energy

func trigger_ability_by_idx(idx: int):
	if abilities.size() == 0: return
	
	var ability = abilities.get(idx)
	trigger_ability(ability)
	
func trigger_ability(ability: Ability):
	if ability == null:
		print("Ability not found!")
		return
		
	if cooldowns.get(ability, 0.0) > 0.0:
		#print(ability.name + " is on cooldown!")
		return
		
	if entity.current_energy < ability.energy_cost:
		print("Not enough energy!")
		return
 
	entity.spend_energy(ability.energy_cost)
	ability.activate(entity)
	cooldowns[ability] = ability.cooldown
	
	
	
	
	
	
	
	
	
	
	
	
	
	
