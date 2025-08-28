class_name AbilityAnimationRunner
extends AbilityComponent

@export var animation_name: String

func _activate(context: AbilityContext):
	context.caster.play_animation(AnimationWrapper.new(animation_name, true))
