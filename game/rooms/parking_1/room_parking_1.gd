@tool
extends PopochiuRoom

const Data := preload('room_parking_1_state.gd')

var state: Data = load("res://game/rooms/parking_1/room_parking_1.tres")

var rotate_clockwise := true
var rot_step := 0.0001
var rot_lim  := 0.1


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	E.camera_zoom(1.5 * Vector2.ONE, 0.1)


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

func _process(delta: float) -> void:
	wiggle_pixels()


func wiggle_pixels() -> void:
	rotation_degrees += rot_step if rotate_clockwise else -rot_step
	if rotation_degrees >= rot_lim || rotation_degrees <= -rot_lim:
		rotate_clockwise = !rotate_clockwise
