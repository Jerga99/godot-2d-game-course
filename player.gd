extends Node2D

@export var speed: float = 20

func _process(delta: float):
	var horizontal = Input.get_axis("left", "right")
	var vertical = Input.get_axis("up", "down")
	
	var movement = Vector2(horizontal, vertical)
	
	self.position += movement.normalized() * speed * delta
