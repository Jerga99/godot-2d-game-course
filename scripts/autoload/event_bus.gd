extends Node

signal play_cast_ability(ability: Ability)
signal player_health_changed(current_health: float, max_health: float)
signal player_energy_changed(current_energy: float, max_energy: float)

signal game_paused(paused: bool)
signal scene_changed(scene: String)
