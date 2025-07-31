class_name Entity
extends Node2D

@export var max_health: float = 50

var current_anim: AnimationWrapper
var current_health: float

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	current_health = max_health
	animated_sprite.animation_finished.connect(on_animation_finished)
	
func _exit_tree():
	animated_sprite.animation_finished.disconnect(on_animation_finished)
	
func apply_damage(damage: float):
	print(self.name, " takes ", damage, " damage")
	
func play_animation(anim: AnimationWrapper):
	if animated_sprite.animation == anim.name: return
	
	if (
		current_anim != null and current_anim.is_high_priority
		and not anim.is_high_priority
	): return
	
	current_anim = anim
	animated_sprite.play(anim.name)
	
func on_animation_finished():
	current_anim = null
	
	
	
	
