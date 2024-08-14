@tool
extends PopochiuRoom

const Data := preload('room_motel_room_state.gd')
var state: Data = load("res://game/rooms/motel_room/room_motel_room.tres")

var def_cam_anchor_mode : Camera2D.AnchorMode 
var entered_times := 3

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	var rot_step := 10
	var rot_lim  := 90
	
	E.camera.change_zoom(1.3 * Vector2.ONE, 0.0001)
	RenderingServer.set_default_clear_color(Color.BLACK)
	
	fix_camera_anchor()
	
	C.PinkLady.hide()
	C.Harlow.hide()
	R.get_hotspot("Door").hide()
	
	match entered_times:
		0:
			C.player = C.MainHotelRoom
			await play_enter_sequence()
			D.MacJoniHotelRoomFirst.start()
		1:
			play_second_enter_sequence()
		2:
			play_third_enter_sequence()
		3:
			play_forth_enter_sequence()
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

func play_enter_sequence() -> void:
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

func fix_camera_anchor() -> void:
	def_cam_anchor_mode = E.camera.anchor_mode
	E.camera.anchor_mode = Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT

func play_second_enter_sequence() -> void:
	C.MainHotelRoom.hide()
	C.Joni.hide()
	C.player = C.MainSecond
	var mac  := C.player as MainSecond
	var joni := C.JoniSecond as JoniSecondCharacter
	mac.position = Vector2(192, 92)
	mac.show()
	mac.timer.stop()
	mac.set_sprite_and_rot(mac.SpshEnum.SIT, 33)
	
	R.get_prop("TvOff").hide()
	R.get_prop("TvOn").show()
	
	#tv talking
	await E.wait(2)
	await C.WhiteText.say(use_i("TV: There we have the American team preparing"))
	await C.WhiteText.say(use_i("Mike Stamm, Tom Bruce, Jerry Heidenreich and finally, Mark Spitz"))
	await C.WhiteText.say(use_i("Phenomenal teammates they have been on this US swim team"))
	await C.WhiteText.say(use_i("Spitz has been the athlete to watch out for this race"))
	await C.WhiteText.say(use_i("Having taken six gold medals already"))
	await C.WhiteText.say(use_i("If the Americans can win this race, it will give Spitz his seventh gold"))
	await C.WhiteText.say(use_i("Setting the record for most gold medals achieved by a single athlete"))
	await C.WhiteText.say(use_i("And they are off and swimming"))
	
	#joni comes
	R.get_prop("DoorMainClosed").hide()
	R.get_prop("DoorMainOpen").show()
	
	await E.wait(1)
	joni.timer.start()
	await joni.walk_to_marker("JoniEnter1")
	joni.timer.stop()
	joni.sprites.rot_deg = 10
	joni.sprites.use_spritesheet = joni.SpshEnum.IDLE
	await E.wait(0.5)
	mac.sprites.use_spritesheet = mac.SpshEnum.IDLE
	mac.sprites.rot_deg = -50
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

func play_third_enter_sequence() -> void:
	var mac = C.MainSecond as MainSecond
	C.player = mac
	C.MainHotelRoom.hide()
	C.JoniSecond.hide()
	mac.position = Vector2(191, 75)
	mac.set_sprite_and_rot(mac.SpshEnum.IDLE)
	var joni = C.Joni as JoniMotelRoom
	joni.set_sprite_and_rot(joni.SpshEnum.IDLE_SIT, -113)
	
	R.get_prop("TvOff").hide()
	R.get_prop("TvOn").show()
	
	await E.wait(2)
	#tv talking
	#await C.WhiteText.say(use_i("TV: It is believed that several have escaped on foot"))
	#await C.WhiteText.say(use_i("Everyone has been warned not to pick up any hitchhikers"))
	#await C.WhiteText.say(use_i("Originally, they said that the hostages were safe"))
	#await C.WhiteText.say(use_i("Now that has been changed"))
	#await C.WhiteText.say(use_i("And an Olympics spokesman said"))
	#await C.WhiteText.say(use_i("\"We are afraid the information given so far is too optimistic\""))
	#await C.WhiteText.say(use_i("When was it agreed, do you know, to allow the guerillas"))
	#await C.WhiteText.say(use_i("To go from the building to the helicopters..."))
	
	R.get_prop("DoorMainClosed").hide()
	R.get_prop("DoorMainOpen").show()
	
	await E.wait(1)
	mac.timer.start()
	await mac.walk_to_marker("MacEnter")
	
	R.get_prop("DoorMainOpen").hide()
	R.get_prop("DoorMainClosed").show()
	
	mac.timer.stop()
	mac.set_sprite_and_rot(mac.SpshEnum.IDLE, 12)
	
	await E.wait(2)
	mac.timer.start()
	await mac.walk_to_prop("TvOn")
	mac.timer.stop()
	mac.set_sprite_and_rot(mac.SpshEnum.IDLE, -64)
	await E.wait(1)
	
	R.get_prop("TvOn").hide()
	R.get_prop("TvOff").show()
	
	await E.wait(1)
	mac.timer.start()
	await mac.walk_to_prop("Chair")
	mac.timer.stop()
	mac.set_sprite_and_rot(mac.SpshEnum.IDLE, 174)
	await E.wait(1)
	mac.position = R.get_marker_position("ChairSit")
	mac.set_sprite_and_rot(mac.SpshEnum.SIT, 174)
	
	await E.wait(2)
	await joni.say("I was watching that")
	await mac.say("Yeah, well, let me tell you how it ends: not well")
	
	D.MacJoniHotelRoomForth.start()

func play_forth_enter_sequence() -> void:
	var mac = C.MainSecond as MainSecond
	var joni = C.Joni as JoniMotelRoom
	var harlow = C.Harlow as HarlowCharacter
	C.player = mac
	C.MainHotelRoom.hide()
	C.JoniSecond.hide()
	mac.set_sprite_and_rot(mac.SpshEnum.SIT_BACK, -39)
	joni.set_sprite_and_rot(joni.SpshEnum.IDLE_SIT, -113)
	
	#tv talking
	#await E.wait(2)
	#C.WhiteText.say(use_i("TV: ...my father use to say ,\"Our greatest hopes and our worst fears are seldom realized\""))
	#C.WhiteText.say(use_i("Our worst fears have been realized tonight"))
	#C.WhiteText.say(use_i("They've now said that there were 11 hostages"))
	#C.WhiteText.say(use_i("Two were killed in their rooms yestarday morning"))
	#C.WhiteText.say(use_i("Nine were killed at the airport tonight"))
	#C.WhiteText.say(use_i("They're all gone"))
	#C.WhiteText.say(use_i("...the Israeli Olympic team is destroyed, much of it"))
	#C.WhiteText.say(use_i("The Arabs, three of them, are still alive in a hospital..."))
	
	#
	#await E.wait(3)
	#await mac.say("If they haven't found him by tomorrow, we can go home")
	#await joni.say("I shouldn't have said that")
	#await E.wait(2)
	#await joni.say("About killing children")
	#await E.wait(2)
	#await joni.say("So sorry")
	#await E.wait(2)
	#await mac.say("It's okay")
	#await mac.say("I threw some pretty low blows there myself")
	#await mac.say("How did you and Cliff start?")
	#await joni.say("We worked together")
	#await mac.say("Did you love him?")
	#await joni.say("No")
	#await joni.say("I was just angry enough at the world")
	#await joni.say("At you")
	#await joni.say("To do it")
	#await joni.say("I needed something")
	#await joni.say("I needed to feel something other than what I felt")
	#await mac.say("Which is what?")
	#await joni.say("Just completely and totally alone")
	#await E.wait(2)
	#await joni.say("Mac?")
	#await E.wait(2)
	#await mac.say("Yeah?")
	#await E.wait(2)
	#await joni.say("Did you...")
	#await joni.say("Kill him?")
	
	C.WhiteText.position = Vector2(200, 67)
	await C.WhiteText.say("*Knock-knock*")
	
	harlow.position = R.get_marker_position("DoorEnter")
	harlow.sprites.rot_deg = -10
	harlow.show()
	#await harlow.say("Guys, you are in there?")
	#await mac.say("Yeah, Harlow?")
	#await harlow.say("I left my tools in your room, I need them")
	#await harlow.say("Room 6's AC's crapped out and they're bitching like crazy")
	
	R.get_hotspot("Door").show()	#read in Door script after this
	mac.timer.start()
	
	mac.say("It's just a little bit late, Harlow")
	
	await Globals.mac_opened_door_to_harlow
	
	R.get_prop("DoorMainClosed").hide()
	R.get_prop("DoorMainOpen").show()
	mac.can_move = false
	
	await E.wait(1)
	
	await harlow.say("Sam, I'm sorry")
	await harlow.say("He said...")
	
	#killing harlow
	R.get_prop("BloodFirst").show()
	
	await E.wait(1)
	
	harlow.sprites.use_spritesheet = harlow.SpshEnum.DEAD
	harlow.sprites.rot_deg = -121
	harlow.position = R.get_marker_position("MacEnter2")
	mac.timer.stop()
	mac.hide()
	mac.can_move = false
	R.get_prop("FightMacLayFirst").position = R.get_marker_position("FightMacLayFirst")
	R.get_prop("FightMacLayFirst").show()
	
	await E.wait(1.5)
	
	R.get_prop("FightEvilWalkFirst").position = R.get_marker_position("FightEvilWalkFirst")
	R.get_prop("FightEvilWalkFirst").show()
	R.get_prop("FightMacLayFirst").position = R.get_marker_position("FightMacLaySecond")
	
	await E.wait(1.5)
	
	R.get_prop("FightEvilWalkFirst").hide()
	R.get_prop("FightEvilWalkSecond").position = R.get_marker_position("FightEvilWalkSecond")
	R.get_prop("FightEvilWalkSecond").show()
	
	await E.wait(1.5)
	
	R.get_prop("FightMacLayFirst").hide()
	R.get_prop("FightEvilWalkSecond").hide()
	R.get_prop("FightHitFirst" ).position = R.get_marker_position("Fight")
	R.get_prop("FightHitSecond").position = R.get_marker_position("Fight")
	R.get_prop("FightHitSecond").show()
	
	#evil hit mac
	await evil_hit_mac()
	
	await E.wait(2)
	
	await evil_hit_mac()
	await E.wait(1)
	joni.position = R.get_marker_position("FightJoniPlace1")
	joni.sprites.rot_deg = -82
	
	await E.wait(2)
	
	await evil_hit_mac()
	await E.wait(1)
	joni.position = R.get_marker_position("FightJoniPlace2")
	joni.sprites.rot_deg = -49
	joni.z_index = 0
	
	await E.wait(2)
	
	await C.Evil.say("Who fucking sent you?")
	await E.wait(1)
	await evil_hit_mac()
	await E.wait(1)
	await C.Evil.say("[shake]WHO?[/shake]")
	await E.wait(1)
	await evil_hit_mac()
	await E.wait(1)
	await C.Evil.say("Was it him?")
	
	await E.wait(2)
	joni.set_sprite_and_rot(joni.SpshEnum.POINT_GUN)
	
	await E.wait(1)
	await evil_hit_mac()
	await E.wait(1)
	
	#joni shoot
	R.get_prop("BloodSecond").show()
	await E.wait(0.5)
	await C.Evil.say("[shake]Hargh![/shake]")
	
	R.get_prop("FightHitSecond").hide()
	R.get_prop("FightHitFirst" ).hide()
	
	R.get_prop("FightEvilPoint").show()
	R.get_prop("FightMacLayFirst").position = R.get_marker_position("FightMacLayThird")
	R.get_prop("FightMacLayFirst").show()
	
	await E.wait(1)
	
	await C.Evil.say("[shake]YOU FUCKING...[/shake]")
	
	#pink lady appears
	var pink_lady = C.PinkLady as PinkLadyCharacter
	pink_lady.set_sprite_and_rot(pink_lady.SpshEnum.GUN_POINT, 47)
	pink_lady.position = R.get_marker_position("JoniEnter1")
	pink_lady.show()
	
	await E.wait(1)
	
	#shoots
	
	R.get_prop("BloodThird").show()
	
	await E.wait(1)
	
	R.get_prop("FightEvilPoint").hide()
	R.get_prop("FightEvilDead").show()
	R.get_prop("FightMacLayFirst").position = R.get_marker_position("FightMacLayForth")
	R.get_prop("FightMacLayFirst").angle_deg = -24
	mac.position = R.get_marker_position("FightMacLayForth")
	
	await E.wait(1)
	
	pink_lady.set_sprite_and_rot(pink_lady.SpshEnum.GUN_IDLE, 47)
	
	await E.wait(1)
	
	await pink_lady.say("Go now")
	await mac.say("Who the fuck are you?")
	await pink_lady.say("Who do you think?")
	await pink_lady.say("You really need to get out of here")
	
	await E.wait(1)
	
	R.get_prop("FightMacLayFirst").hide()
	mac.show()
	mac.can_move = true
	Globals.is_after_fight = true
	
	await Globals.mac_asks_joni_to_leave
	
	await C.MainSecond.say("Joni?")
	await C.MainSecond.say("Baby, come on")
	await C.MainSecond.say("Baby, we have to go")
	
	joni.follow_player = true
	
	


func evil_hit_mac(action: Callable = func():{}):
	R.get_prop("FightHitSecond").hide()
	R.get_prop("FightHitFirst" ).show()
	await E.wait(0.2)
	R.get_prop("FightHitSecond").show()
	R.get_prop("FightHitFirst" ).hide()
	
	await action.call()


func use_i(text: String) -> String:
	return "[i]%s[/i]" % text


func restore_camera_anchor():
	E.camera.anchor_mode = def_cam_anchor_mode
