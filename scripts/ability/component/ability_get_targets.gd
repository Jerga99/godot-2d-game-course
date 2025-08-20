
class_name AbilityGetTargets
extends AbilityComponent

@export var radius = 30.0

func _activate(context: AbilityContext):
	var targets = check_colliders_around_position(context.caster, radius)
	context.targets = targets
	
func check_colliders_around_position(caster: Entity, radius: float) -> Array[Entity]:
	var shape = CircleShape2D.new()
	shape.radius = radius
	
	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = shape
	query.transform.origin = caster.position
	query.collide_with_areas = true
	
	var line = create_debug_circle(radius)
	caster.add_child(line)	

	var space_state = caster.get_world_2d().direct_space_state
	var results = space_state.intersect_shape(query)
	var targets: Array[Entity] = []
	
	if results.size() > 0:
		for result in results:
			var collider = result.collider
			var parent = collider.get_parent()
			
			if parent is Entity:
				targets.push_back(parent)
	
	call_deferred("destroy_line", line, 0.2)
	return targets
	
	
func create_debug_circle(radius: float):
	var points = 32
	var line = Line2D.new()
	line.width = 1
	line.default_color = Color(1, 0, 0)
	
	for i in range(points + 1):
		var angle = (TAU / points) * i
		line.add_point(Vector2(cos(angle), sin(angle)) * radius)
		
	return line
	
func destroy_line(line: Line2D, seconds: float):
	await get_tree().create_timer(seconds).timeout
	
	if (line != null):
		line.queue_free()
	
	
	
	
	
	
	
	
	
	
