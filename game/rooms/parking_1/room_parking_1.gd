@tool
extends PopochiuRoom

const Data := preload('room_parking_1_state.gd')

var state: Data = load("res://game/rooms/parking_1/room_parking_1.tres")

var player_enter_room_pos : Vector2

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	C.player = C.MainParking1
	E.camera_zoom(1.5 * Vector2.ONE, 0.1)
	#E.camera_zoom(0.5 * Vector2.ONE, 0.1)
	RenderingServer.set_default_clear_color(Color.BLACK)
	#if player_enter_room_pos:
		#C.player = player_enter_room_pos


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


