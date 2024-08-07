@tool
extends PopochiuRoom

const Data := preload('room_motel_room_state.gd')
var state: Data = load("res://game/rooms/motel_room/room_motel_room.tres")

var def_cam_anchor_mode : Camera2D.AnchorMode 

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	var rot_step := 10
	var rot_lim  := 90
	
	E.camera.change_zoom(1.3 * Vector2.ONE, 0.0001)
	RenderingServer.set_default_clear_color(Color.BLACK)
	
	fix_camera_anchor()
	
	C.player = C.MainHotelRoom
	await play_enter_sequence()
	D.MacJoniHotelRoomFirst.start()


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

func restore_camera_anchor():
	E.camera.anchor_mode = def_cam_anchor_mode
