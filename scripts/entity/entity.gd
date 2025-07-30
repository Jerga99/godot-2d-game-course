class_name Entity
extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	pass
	
func play_animation(anim_name: String):
	animated_sprite.play(anim_name)
