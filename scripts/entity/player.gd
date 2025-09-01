class_name Player
extends Entity

@export var speed: float = 20
@export var weapon: Node2D
@export var footstep_clip: AudioConfig
@export var footstep_interval = 0.3
@export var spell_bar: SpellBar = null

var is_moving: bool = false
var weapon_right: Vector2
var weapon_left: Vector2
var spawn_location: Vector2
var footstep_timer = 0.0

@onready var ability_controller: AbilityController = $AbilityController
@onready var footstep_effect: FootstepEffect = $FootstepEffect

signal player_died(player: Player)

func _ready():
	super._ready()
	add_to_group("player")
	weapon_right = weapon.position
	weapon_left = self.position + (self.position - weapon.position)
	spawn_location = position
	
	var abilities = ability_controller.abilities
	
	for ability_idx in range(abilities.size()):
		var ability = abilities[ability_idx]
		spell_bar.register_ability(ability, ability_idx)
	
func _process(delta: float):
	if is_dead: return
	
	_handle_movemment(delta)
	_handle_footstep_sound(delta)
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
	turning_cooldown = max(0, turning_cooldown - delta)
	var horizontal = Input.get_axis("left", "right")
	var vertical = Input.get_axis("up", "down")
	
	var movement = Vector2(horizontal, vertical)
	var n_movement = movement.normalized()
	self.position += n_movement * speed * delta
	
	if n_movement.length() > 0:
		is_moving = true
		footstep_effect.play()
		
		if turning_cooldown == 0:
			if horizontal > 0:
				animated_sprite.flip_h = false
			elif horizontal < 0:
				animated_sprite.flip_h = true

func _handle_footstep_sound(delta: float):
	if is_moving:
		footstep_timer += delta
		if footstep_timer >= footstep_interval:
			AudioController.play(footstep_clip, global_position)
			footstep_timer = 0.0
	else:
		footstep_timer = 0.0

func _handle_animation():
	if is_moving:
		play_animation(AnimationWrapper.new("run"))
	else:
		play_animation(AnimationWrapper.new("idle"))
		

func _on_animated_sprite_2d_animation_finished():
	if current_anim.name == "die":
		player_died.emit(self)
