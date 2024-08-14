@tool
extends PopochiuRoom

const Data := preload('room_titles_state.gd')

var state: Data = load("res://game/rooms/titles/room_titles.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)
	
	await E.wait(1)
	C.WhiteText.say("Thanks for playing \nThe Sunnyside Motel in Huttsville, Arkansas")


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion
