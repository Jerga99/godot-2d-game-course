extends Node2D

@export var speed: float = 20

var is_moving: bool = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ability_controller: AbilityController = $AbilityController
	
func _process(delta: float):
	_handle_movemment(delta)
	_handle_abilities()	
	_handle_animation()

func _handle_abilities():
	if Input.is_action_just_pressed("ability_1"):
		ability_controller.trigger_ability_by_idx(0)
		
func _handle_movemment(delta: float):
	is_moving = false
	var horizontal = Input.get_axis("left", "right")
	var vertical = Input.get_axis("up", "down")
	
	var movement = Vector2(horizontal, vertical)
	var n_movement = movement.normalized()
	self.position += n_movement * speed * delta
	
	if n_movement.length() > 0:
		is_moving = true
		if horizontal > 0:
			animated_sprite.flip_h = false
		elif horizontal < 0:
			animated_sprite.flip_h = true
			
func _handle_animation():
	if is_moving:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	
	
	
	
	
	
	
	
	
	
	
	
