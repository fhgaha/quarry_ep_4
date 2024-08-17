@tool
extends PopochiuRegion

#region Virtual ####################################################################################
func _on_character_entered(chr: PopochiuCharacter) -> void:
	# This is optional. You can put here anything you want to happen when a
	# character enters the area.
	#chr.modulate = tint
	
	if !Globals.noticed_pool_there && chr == C.MainParking1:
		Globals.noticed_pool_there = true
		chr.stop_walking()
		chr.say("Wait a minute! Is that a pool there?")


func _on_character_exited(chr: PopochiuCharacter) -> void:
	# This is optional, too.
	chr.modulate = Color.WHITE


#endregion
