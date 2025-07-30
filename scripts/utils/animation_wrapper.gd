
class_name AnimationWrapper
extends RefCounted

var name: String = ""
var is_high_priority: bool = false

func _init(_name: String, _is_high_priority: bool = false):
	self.name = _name
	self.is_high_priority = _is_high_priority
