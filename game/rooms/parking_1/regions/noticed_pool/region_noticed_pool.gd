@tool
extends PopochiuRegion

var first_time := true

#region Virtual ####################################################################################
func _on_character_entered(chr: PopochiuCharacter) -> void:
	# This is optional. You can put here anything you want to happen when a
	# character enters the area.
	#chr.modulate = tint
	
	if first_time:
		chr.stop_walking()
		chr.say("Wait a minute! Is that a pool there?")
		first_time = false


func _on_character_exited(chr: PopochiuCharacter) -> void:
	# This is optional, too.
	chr.modulate = Color.WHITE


#endregion
