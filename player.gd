extends Node2D


func _process(delta: float):
	
	self.position += Vector2(20, 10) * delta
	
	self.position.x += 20 * delta
	self.rotation += 10 * delta
	self.scale += Vector2(0.4, 0.4) * delta
	
	
