@tool
extends PopochiuRoom

const Data := preload('room_telephone_booth_state.gd')

var state: Data = load("res://game/rooms/telephone_booth/room_telephone_booth.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	if !(A.mx_triller as AudioCueMusic).is_playing():
		(A.mx_triller as AudioCueMusic).play()
	
	await E.wait(2)
	
	C.player = C.MainParking1
	D.TelephoneBoothMainKarl.start()


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	C.player = C.MainParking1
	
	#doesnt work
	#(A.mx_triller as AudioCueMusic).fade()
	#(A.mx_triller as AudioCueMusic).fade(1.5, false, 
		#-5, -100, Vector2.ZERO)
	(A.mx_triller as AudioCueMusic).stop()

#endregion
