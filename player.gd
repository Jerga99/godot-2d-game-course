extends Node2D

@export var speed: float = 20

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

#func _ready():
	#animated_sprite = get_node("AnimatedSprite2D")
	
func _process(delta: float):
	var horizontal = Input.get_axis("left", "right")
	var vertical = Input.get_axis("up", "down")
	
	var movement = Vector2(horizontal, vertical)
	var n_movement = movement.normalized()
	self.position += n_movement * speed * delta
	
	if n_movement.length() > 0:
		if horizontal > 0:
			animated_sprite.flip_h = false
		elif horizontal < 0:
			animated_sprite.flip_h = true
