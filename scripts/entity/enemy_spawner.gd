
class_name EnemySpawner
extends Node

@export var packed_enemies: Array[PackedScene] = []
@export var spawn_interval = 1.0
@export var spawn_around: Node2D

@export var min_spawn_radius = 120
@export var max_spawn_radius = 180

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
	
	var spawn_radius = randf_range(min_spawn_radius, max_spawn_radius)
	var rand_pos = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized() * spawn_radius
	var spawn_pos = spawn_around.global_position + rand_pos
	
	enemy.global_position = spawn_pos
	get_parent().add_child(enemy)
