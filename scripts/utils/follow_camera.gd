extends Camera2D

@export var follow_target: Node2D

func _process(delta):
	self.position = follow_target.position
