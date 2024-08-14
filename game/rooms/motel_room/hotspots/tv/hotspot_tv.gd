@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	G.block()
	var mac = C.player as CharacterMainNakedHotelRoom
	await E.wait(1)
	await mac.walk_to_clicked()
	mac.sprites.rot_deg = 260
	R.get_prop("TvOff").hide()
	R.get_prop("TvOn").show()
	C.WhiteText.position = Vector2(211, 73)
	await E.wait(1)
	mac.walk_to_marker("MacSit")
	await E.wait(1)
	mac.timer.stop()
	mac.sprites.rot_deg = 245
	await E.wait(1)
	mac.sprites.use_spritesheet = mac.SpshEnum.SIT
	mac.z_index = 1
	
	await E.wait(1)
	D.MacJoniHotelRoomSecond.start()
	hide()


func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you could make the player instantly goto another room on an exit hotspot instead
	# of waiting for the player to walk there.
#	await R.current = R.NewRoom


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you can make the player character gaze at this hotspot and then say something:
#	await C.player.face_clicked()
#	await C.player.say("A window")


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# hotspot. Note that you have to change the name of the `_item` parameter to `item`.
#	if item == I.Key:
#		await C.player.say("No can do")


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
