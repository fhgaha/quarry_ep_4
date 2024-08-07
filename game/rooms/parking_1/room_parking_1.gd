@tool
extends PopochiuRoom

const Data := preload('room_parking_1_state.gd')

var state: Data = load("res://game/rooms/parking_1/room_parking_1.tres")

var player_enter_room_pos : Vector2
var debug := false
var entered_time: int = 2

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	if entered_time == 1:
		if debug:
			C.player = C.MainParking1
	if entered_time == 2:
		set_up_for_second_enter()
		pass
	E.camera_zoom(1.5 * Vector2.ONE, 0.1)
	RenderingServer.set_default_clear_color(Color.BLACK)
	entered_time += 1

func set_up_for_second_enter():
	C.player = C.MainSecond
	
	C.player.show()

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


