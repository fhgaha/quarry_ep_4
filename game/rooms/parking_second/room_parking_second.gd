@tool
extends PopochiuRoom

const Data := preload('room_parking_second_state.gd')

var state: Data = load("res://game/rooms/parking_second/room_parking_second.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	E.camera_zoom(1.5 * Vector2.ONE, 0.1)
	RenderingServer.set_default_clear_color(Color.BLACK)
	
	run_start_sequence()

func run_start_sequence():
	if C.MainParking1:
		C.MainParking1.hide()
	var mac = C.MainSecond as MainSecond
	var joni = C.JoniSecond
	C.player = mac
	joni.sprites.rot_deg = -17
	joni.hide()
	
	mac.timer.stop()
	mac.can_move = false
	mac.set_sprite_and_rot(mac.SpshEnum.SIT_BACK, -50)
	
	await E.wait(4)
	
	#joni appears
	await E.wait(1)
	joni.show()
	await E.wait(3)
	
	#joni walks to the chair
	joni.timer.start()
	await joni.walk_to_marker("JoniPath1")
	await joni.walk_to_marker("JoniPath2")
	await joni.walk_to_marker("JoniPath3")
	joni.timer.stop()
	joni.sprites.use_spritesheet = joni.SpshEnum.IDLE
	
	#joni sits
	await E.wait(1)
	joni.sprites.use_spritesheet = joni.SpshEnum.SIT
	joni.sprites.rot_deg = 53
	joni.position = R.get_marker_position("JoniSit")
	
	await E.wait(4)
	D.MacJoniParking.start()
	
	pass

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
