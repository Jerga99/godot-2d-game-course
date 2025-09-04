
class_name EnemySpawner
extends Node

@export var packed_enemies: Array[PackedScene] = []
@export var spawn_interval = 1.0

var spawn_timer = 0.0

func _process(delta: float):
	spawn_timer += delta
	
	if spawn_timer >= spawn_interval:
		spawn_timer = 0.0
		spawn_enemy()
	
func spawn_enemy():
	var idx = randi() % packed_enemies.size()
	var enemy_scene = packed_enemies[idx]
	var enemy = enemy_scene.instantiate() as Enemy
	
	enemy.global_position = Vector2.ZERO
	get_parent().add_child(enemy)
