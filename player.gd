extends Node2D

@export var speed: float = 20

func _process(delta: float):
	var horizontal = Input.get_axis("ui_left", "ui_right")
	var vertical = Input.get_axis("ui_up", "ui_down")
	
	var movement = Vector2(horizontal, vertical)
	
	self.position += movement * speed * delta
