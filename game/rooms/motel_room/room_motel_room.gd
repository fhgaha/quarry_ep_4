@tool
extends PopochiuRoom

const Data := preload('room_motel_room_state.gd')
var state: Data = load("res://game/rooms/motel_room/room_motel_room.tres")

var def_cam_anchor_mode : Camera2D.AnchorMode 
var entered_times := 1

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	var rot_step := 10
	var rot_lim  := 90
	
	E.camera.change_zoom(1.3 * Vector2.ONE, 0.0001)
	RenderingServer.set_default_clear_color(Color.BLACK)
	
	fix_camera_anchor()
	
	match entered_times:
		0:
			C.player = C.MainHotelRoom
			await play_enter_sequence()
			D.MacJoniHotelRoomFirst.start()
		1:
			await play_second_enter_sequence()
		_:
			pass
	entered_times += 1


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

func play_enter_sequence():
	var mac  := C.player as CharacterMainNakedHotelRoom
	var joni := C.Joni   as JoniMotelRoom
	
	joni.timer.stop()
	joni.sprites.use_spritesheet = joni.SpshEnum.IDLE_SIT
	
	await E.wait(2)
	C.WhiteText.say("*Click - click*")
	await G.dialog_line_finished
	
	joni.sprites.use_spritesheet = joni.SpshEnum.HIDE_GUN
	await E.wait(1)
	joni.sprites.use_spritesheet = joni.SpshEnum.POINT_GUN
	
	await E.wait(2)
	joni.say("Mac?")
	await G.dialog_line_finished
	await E.wait(2)
	
	R.current.get_prop("DoorMainClosed").hide()
	R.current.get_prop("DoorMainOpen").show()
	
	await E.wait(1)
	mac.timer.start()
	await mac.walk_to_marker("MacEnter")
	await mac.walk_to_marker("MacEnter2")
	mac.timer.stop()
	mac.sprites.use_spritesheet = mac.SpshEnum.IDLE
	
	R.current.get_prop("DoorMainOpen").hide()
	R.current.get_prop("DoorMainClosed").show()
	
	await E.wait(2)
	await mac.say("Jesus")
	#await G.dialog_line_finished	#the hell this breaks everything
	
	joni.sprites.use_spritesheet = joni.SpshEnum.HIDE_GUN
	await E.wait(1)
	joni.sprites.use_spritesheet = joni.SpshEnum.IDLE_SIT
	
	mac.timer.start()
	await mac.walk_to_marker("MacEnter3")
	mac.timer.stop()
	mac.sprites.use_spritesheet = mac.SpshEnum.IDLE
	
	await E.wait(1)
	await mac.say("Are you okay?")
	
	await E.wait(1)
	mac.timer.start()

func fix_camera_anchor():
	def_cam_anchor_mode = E.camera.anchor_mode
	E.camera.anchor_mode = Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT

func play_second_enter_sequence():
	C.MainHotelRoom.hide()
	C.Joni.hide()
	C.player = C.MainSecond
	var mac  := C.player as MainSecond
	var joni := C.JoniSecond as JoniSecondCharacter
	mac.position = Vector2(192, 92)
	mac.show()
	mac.timer.stop()
	mac.sprites.use_spritesheet = mac.SpshEnum.SIT
	
	R.get_prop("TvOff").hide()
	R.get_prop("TvOn").show()
	
	#tv talking
	await E.wait(2)
	#await C.WhiteText.say(use_i("There we have the American team preparing"))
	#await C.WhiteText.say(use_i("Mike Stamm, Tom Bruce, Jerry Heidenreich and finally, Mark Spitz"))
	#await C.WhiteText.say(use_i("Phenomenal teammates they have been on this US swim team"))
	#await C.WhiteText.say(use_i("Spitz has been the athlete to watch out for this race"))
	#await C.WhiteText.say(use_i("Having taken six gold medals already"))
	#await C.WhiteText.say(use_i("If the Americans can win this race, it will give Spitz his seventh gold"))
	#await C.WhiteText.say(use_i("Setting the record for most gold medals achieved by a single athlete"))
	#await C.WhiteText.say(use_i("And they are off and swimming"))
	
	#joni comes
	R.get_prop("DoorMainClosed").hide()
	R.get_prop("DoorMainOpen").show()
	
	await E.wait(1)
	joni.timer.start()
	await joni.walk_to_marker("JoniEnter1")
	joni.timer.stop()
	joni.sprites.rot_deg = 10
	joni.sprites.use_spritesheet = joni.SpshEnum.IDLE
	await mac.say("What the hell is the matter with you?")
	joni.timer.start()
	await joni.walk_to_marker("JoniEnter2")
	joni.timer.stop()
	joni.sprites.rot_deg = 25
	joni.sprites.use_spritesheet = joni.SpshEnum.IDLE
	await mac.say("You can't just run off like that")
	joni.timer.start()
	await joni.walk_to_marker("JoniEnter3")
	joni.timer.stop()
	joni.sprites.rot_deg = 10
	joni.sprites.use_spritesheet = joni.SpshEnum.IDLE
	
	await E.wait(2)
	joni.hide()
	var joni_sitting := C.Joni as JoniMotelRoom
	joni_sitting.sprites.use_spritesheet = joni_sitting.SpshEnum.IDLE_SIT
	joni_sitting.show()
	await E.wait(2)
	
	D.MacJoniHotelRoomThird.start()


func use_i(text: String) -> String:
	return "[i]%s[/i]" % text

func restore_camera_anchor():
	E.camera.anchor_mode = def_cam_anchor_mode
