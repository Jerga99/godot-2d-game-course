class_name Entity
extends Node2D

@export var max_health: float = 50
@export var damage_text_color: Color = Color.FIREBRICK

var current_anim: AnimationWrapper
var current_health: float
var is_dead: bool = false
var turning_cooldown = 0.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	current_health = max_health
	animated_sprite.material = animated_sprite.material.duplicate()
	animated_sprite.animation_finished.connect(on_animation_finished)
	
func _exit_tree():
	animated_sprite.animation_finished.disconnect(on_animation_finished)
	
func apply_damage(damage: float) -> bool:
	if is_dead: return false
	
	current_health -=damage
	current_health = max(0, current_health)
	_show_damage_taken_effect()
	_show_damage_popup(damage)
	
	if current_health == 0:
		print(name, " is dead!")
		is_dead = true
		play_animation(AnimationWrapper.new("die", true))
	
	return true
			
func play_animation(anim: AnimationWrapper):
	if animated_sprite.animation == anim.name: return
	
	if (
		current_anim != null and current_anim.is_high_priority
		and not anim.is_high_priority
	): return
	
	current_anim = anim
	animated_sprite.play(anim.name)
	
func turn_to_position(pos: Vector2):
	if position.x > pos.x and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
	elif position.x < pos.x and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	
func on_animation_finished():
	current_anim = null
	
func get_height() -> float:
	var anim = animated_sprite.animation
	var frame_tex = animated_sprite.sprite_frames.get_frame_texture(anim, 0)
	var height = frame_tex.get_height()
	return height * scale.y

func _show_damage_popup(damage: float):
	var height = get_height()
	var spawn_position = Vector2(position.x, position.y - (height * 0.5))
	FloatText.show_damage_text(str(int(damage)), spawn_position, damage_text_color)
	
func _show_damage_taken_effect():
	if animated_sprite.material != null:
		for i in 2:
			animated_sprite.material.set_shader_parameter("is_hurt", true)
			await get_tree().create_timer(0.05).timeout
			animated_sprite.material.set_shader_parameter("is_hurt", false)
			await get_tree().create_timer(0.05).timeout
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
