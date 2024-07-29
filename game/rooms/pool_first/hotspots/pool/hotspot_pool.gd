@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

var first_time := true

#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	if !first_time: return
	
	first_time = false
	clickable = false
	var character := C.MainParking1 as PopochiuCharacter
	character.cutscene_running = true
	await character.stop_walking()
	await character.face_clicked()
	#await character.say("...")
	await character.walk_to(R.get_prop("PoolLoungeChair").position + Vector2(-10, 10))
	character.undress()
	await E.play_transition(PopochiuTransitionLayer.FADE_IN, 1.0)
	C.player = C.MainNaked
	var naked = C.MainNaked as PopochiuCharacter
	naked.position = character.position
	character.position = Vector2(-100, 0)
	character.can_move = false
	await E.play_transition(PopochiuTransitionLayer.FADE_OUT, 1.0)
	await naked.walk_to_hotspot("Pool")
	naked.timer.stop()
	naked.sprites.use_spritesheet = naked.SpshEnum.IDLE
	naked.sprites.rot_deg = -35
	await E.wait(1)

	#dive
	naked.position += Vector2(10, 5)
	naked.sprites.use_spritesheet = naked.SpshEnum.DIVE_1
	naked.sprites.rot_deg = -60
	await E.wait(0.2)
	naked.position += Vector2(10, 5)
	naked.sprites.use_spritesheet = naked.SpshEnum.DIVE_2
	await E.wait(0.2)
	naked.visible = false
	await E.wait(1.2)

	#rowing forth
	naked.sprites.use_spritesheet = naked.SpshEnum.ROW_1
	naked.position += 3 * Vector2(10, 3)
	await E.wait(0.2)
	naked.visible = true
	await E.wait(0.5)
	naked.sprites.use_spritesheet = naked.SpshEnum.ROW_2
	naked.position += 2 * Vector2(10, 3)
	await E.wait(0.5)
	naked.sprites.use_spritesheet = naked.SpshEnum.ROW_1
	naked.position += 2 * Vector2(10, 3)
	await E.wait(0.5)
	naked.sprites.use_spritesheet = naked.SpshEnum.ROW_2
	naked.position += 2 * Vector2(10, 3)

	#rowing back
	await E.wait(1)
	naked.sprites.rot_deg = 126
	naked.sprites.use_spritesheet = naked.SpshEnum.ROW_1
	naked.position -= Vector2(10, 3)
	await E.wait(0.5)
	naked.sprites.use_spritesheet = naked.SpshEnum.ROW_2
	naked.position -= 2 * Vector2(10, 3)
	
	naked.sprites.use_spritesheet = naked.SpshEnum.IDLE_IN_WATER
	naked.sprites.rot_deg = 224



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
