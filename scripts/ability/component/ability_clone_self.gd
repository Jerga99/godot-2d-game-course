
class_name AbilityCloneSelf
extends AbilityComponent

func _activate(context: AbilityContext):
	var caster = context.caster
	var current_texture = caster.get_current_texture()
	print(current_texture)
