
class_name AbilityGetTarget
extends AbilityComponent

@export var radius = 30.0

func _activate(context: AbilityContext):
	var results = check_colliders_around_position(context.caster, radius)
	print(results)
	
func check_colliders_around_position(caster: Entity, radius: float) -> Array:
	var shape = CircleShape2D.new()
	shape.radius = radius
	
	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = shape
	query.transform.origin = caster.position
	query.collide_with_areas = true
	
	var space_state = caster.get_world_2d().direct_space_state
	var results = space_state.intersect_shape(query)
	
	return results
	
