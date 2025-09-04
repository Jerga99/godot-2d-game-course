class_name Enemy
extends Entity	

@export var speed: float = 10.0
@export var stop_distance: float = 10.0
@export var aggresive = false
@export var memory = 0.0

var player: Player
var velocity: Vector2
var current_speed: float
var last_position
var chasing = false
var memory_timer = 0.0

@onready var ability_controller: AbilityController = $AbilityController
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D
@onready var hit_particles: CPUParticles2D = $HitParticles
@onready var pathfinding: Pathfinding = $Pathfinding

func _ready():
	super._ready()
	add_to_group("enemy")
	last_position = position
	player =  get_tree().get_first_node_in_group("player")
	
	if aggresive: chasing = true
	
	
func _process(delta: float):
	if is_dead: return
	
	var distance = position.distance_to(player.position)
	
	if not aggresive:
		if distance <= 60: chasing = true
	
	if chasing and player != null:
		var movement_dir = Vector2.ZERO
		
		if pathfinding != null:
			movement_dir = pathfinding.find_path(player.global_position).normalized()
		else:
			movement_dir = (player.position - self.position).normalized()
	
		if position.distance_to(player.position) > stop_distance:
			position += movement_dir * speed * delta
		else:
			ability_controller.trigger_ability_by_idx(0)
		
		_face_target(player.position - position)
		
	velocity = (position - last_position) / delta
	current_speed = velocity.length()
	
	last_position = position
	_handle_animations()
	
	if not aggresive and chasing and distance >= 100:
		memory_timer += delta
		
		if memory_timer >= memory:
			memory_timer = 0.0
			chasing = false


func _handle_animations():
	if current_speed <= 0:
		play_animation(AnimationWrapper.new("idle"))
	else:
		play_animation(AnimationWrapper.new("walk"))
		
func _face_target(dir: Vector2):
	if not animated_sprite.flip_h and dir.x < 0:
		animated_sprite.flip_h = true
	elif animated_sprite.flip_h and dir.x > 0:
		animated_sprite.flip_h = false
		
func get_height() -> float:
	if collision_shape != null:
		var shape = collision_shape.shape
		if shape is  CapsuleShape2D:
			return shape.height * scale.y
		elif shape is CircleShape2D:
			return shape.radius * scale.y
		else:
			return super.get_height()
	else:
		return super.get_height()
	
	
func _show_damage_taken_effect():
	super._show_damage_taken_effect()	
	
	if hit_particles != null:
		hit_particles.emitting = true
	

func _on_animated_sprite_2d_animation_finished():
	if current_anim.name == "die":
		queue_free()
	
