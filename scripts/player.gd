extends Entity

@export var speed: float = 20
@export var weapon: Node2D

var is_moving: bool = false
var weapon_right: Vector2
var weapon_left: Vector2

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ability_controller: AbilityController = $AbilityController

func _ready():
	weapon_right = weapon.position
	weapon_left = self.position + (self.position - weapon.position)
	
func _process(delta: float):
	_handle_movemment(delta)
	_handle_abilities()	
	_handle_animation()

func _handle_abilities():
	if Input.is_action_just_pressed("ability_1"):
		ability_controller.trigger_ability_by_idx(0)
	if Input.is_action_just_pressed("ability_2"):
		ability_controller.trigger_ability_by_idx(1)
	if Input.is_action_just_pressed("ability_3"):
		ability_controller.trigger_ability_by_idx(2)
		
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
			weapon.position = weapon_right
			weapon.rotation = deg_to_rad(35)
		elif horizontal < 0:
			animated_sprite.flip_h = true
			weapon.position = weapon_left
			weapon.rotation = deg_to_rad(-35)
			
func _handle_animation():
	if is_moving:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	
	
	
	
	
	
	
	
	
	
	
	
