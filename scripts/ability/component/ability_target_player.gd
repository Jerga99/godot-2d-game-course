class_name AbilityTargetPlayer
extends AbilityComponent

func _activate(context: AbilityContext):
	var player = get_tree().get_first_node_in_group("player")
	context.targets = [player]
