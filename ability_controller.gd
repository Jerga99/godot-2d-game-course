class_name AbilityController
extends Node

var abilities: Array[Ability] = []
var cooldowns: Dictionary = {}

func trigger_ability_by_idx(idx: int):
	print("Triggering ability: ", idx)
