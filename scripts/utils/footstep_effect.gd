class_name FootstepEffect
extends Node2D

@onready var foot_1 = $CPUParticles2D
@onready var foot_2 = $CPUParticles2D2

func play():
	if not foot_1.emitting: foot_1.restart()
	await get_tree().create_timer(0.2).timeout
	if not foot_2.emitting: foot_2.restart()
