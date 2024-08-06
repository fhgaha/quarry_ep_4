@tool
extends PopochiuRoom

const Data := preload('room_motel_room_state.gd')

var state: Data = load("res://game/rooms/motel_room/room_motel_room.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	var rot_step := 10
	var rot_lim  := 90
	E.camera_zoom(1.3 * Vector2.ONE, 0.1)
	RenderingServer.set_default_clear_color(Color.BLACK)
	
	C.player = C.MainHotelRoom
	await play_enter_anims()


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

func play_enter_anims():
	await E.wait(2)
	C.Joni.say("Macccccccccccccccccccccccccccccc?")
	#await E.wait(2)
	
	#R.current.get_prop("DoorMainClosed").hide()
	#R.current.get_prop("DoorMainOpen").show()
	#
	#await E.wait(1)
	##var mac = C.player as CharacterMainNakedHotelRoom
	#var mac = C.player as PopochiuCharacter
	#mac.timer.start()
	#await mac.walk_to_marker("MacEnter")
	#await mac.walk_to_marker("MacEnter2")
	#mac.timer.stop()
	#
	#R.current.get_prop("DoorMainOpen").hide()
	#R.current.get_prop("DoorMainClosed").show()
	#
	#await E.wait(2)
	#await mac.say("Jesus")
	#await mac.say("Are you okay?")
	
	
	#Joni: Mac?
	#Mac: Jesus. You okay?
	
	
