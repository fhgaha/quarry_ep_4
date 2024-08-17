@tool
extends PopochiuRoom

const Data := preload('room_start_screen_state.gd')
var state: Data = load("res://game/rooms/start_screen/room_start_screen.tres")

var sprite : PopochiuProp

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)
	sprite = R.get_prop("Bg") as PopochiuProp
	rot_step = 0.001
	rot_lim  = 0.3
	
	await E.wait(4)
	
	A.mx_triller.play()
	R.get_prop("Title").show()
	
	await E.wait(4)
	
	R.get_prop("Disclaimer").show()
	
	await E.wait(4)
	
	R.get_prop("BasedOnTvSeries").show()
	
	await E.wait(4)
	
	C.WhiteTextSilent.text_color = Color.DARK_ORANGE
	await C.WhiteTextSilent.say("Click to start")
	
	E.in_room = true	#weird thing should not use this
	R.goto_room("TelephoneBooth", false)
	
	C.WhiteTextSilent.text_color = Color.WHITE


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
	if !sprite: return
	
	sprite.rotation_degrees += rot_step if rotate_clockwise else -rot_step
	if (sprite.rotation_degrees >= rot_lim 
	|| sprite.rotation_degrees <= -rot_lim):
		rotate_clockwise = !rotate_clockwise
