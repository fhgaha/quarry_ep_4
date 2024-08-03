@tool
extends PopochiuRoom

const Data := preload('room_pool_first_state.gd')

var state: Data = load("res://game/rooms/pool_first/room_pool_first.tres")

var player_enter_room_pos : Vector2

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	player_enter_room_pos = R.get_hotspot("RoomExit").position
	C.player = C.MainParking1
	E.camera_zoom(1.0 * Vector2.ONE, 0.1)
	RenderingServer.set_default_clear_color(Color.BLACK)


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
