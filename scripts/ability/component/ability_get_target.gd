
class_name AbilityGetTarget
extends AbilityComponent

@export var radius = 30.0

func _activate(context: AbilityContext):
	var targets = check_colliders_around_position(context.caster, radius)
	
	if targets.size() > 0:
		context.target = targets[0]
	
func check_colliders_around_position(caster: Entity, radius: float) -> Array[Entity]:
	var shape = CircleShape2D.new()
	shape.radius = radius
	
	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = shape
	query.transform.origin = caster.position
	query.collide_with_areas = true
	
	var space_state = caster.get_world_2d().direct_space_state
	var results = space_state.intersect_shape(query)
	var targets: Array[Entity] = []
	
	if results.size() > 0:
		for result in results:
			var collider = result.collider
			var parent = collider.get_parent()
			
			if parent is Entity:
				targets.push_back(parent)
	
	return targets
	
	
	
	
	
	
	
	
	
	
	
