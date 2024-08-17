@tool
extends PopochiuRoom

const Data := preload('room_parking_1_state.gd')
var state: Data = load("res://game/rooms/parking_1/room_parking_1.tres")

var player_enter_room_pos : Vector2
var first_enter := true
#var entered_times := 0

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	if !Globals.visited_pool:
		C.MainNaked.hide()
		C.MainParking1.show()
		C.player = C.MainParking1
	else:
		C.MainParking1.hide()
		C.MainNaked.show()
		C.player = C.MainNaked
		C.player.position = R.get_prop("PoolFence2").position
	
	E.camera_zoom(1.5 * Vector2.ONE, 0.1)
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


