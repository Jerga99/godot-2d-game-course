class_name Pathfinding
extends Node2D

@export var neigbour_check_radius = 30.0
@export var separation_force = 300

func find_path(target_pos: Vector2):
	var shape = CircleShape2D.new()
	shape.radius = neigbour_check_radius
	
	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = shape
	query.collide_with_areas = true
	query.transform.origin = global_position
	
	var space_state = get_world_2d().direct_space_state
	var results = space_state.intersect_shape(query)
	var neigbours: Array[Enemy] = []
	
	if results.size() > 0:
		for result in results:
			var collider = result.collider
			var parent = collider.get_parent() 
			
			if parent is Enemy and parent != self.get_parent():
				neigbours.push_back(parent)
				
	var separation_vector = separation(neigbours)
	
	return (target_pos - global_position) + separation_vector * separation_force
				
func separation(neigbours: Array[Enemy]):
	var seperation_vector = Vector2.ZERO
	
	for neighbour in neigbours:
		var to_me = global_position - neighbour.global_position
		var distance = to_me.length()
		
		if distance > 0:
			seperation_vector += to_me.normalized() / distance
			
	return seperation_vector
	
	
	
	
	
	
	
	
	
	
	
	
	
	
