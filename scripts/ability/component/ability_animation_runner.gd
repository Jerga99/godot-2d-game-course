class_name AbilityAnimationRunner
extends AbilityComponent

func _activate(context: AbilityContext):
	context.caster.play_animation("slash")
