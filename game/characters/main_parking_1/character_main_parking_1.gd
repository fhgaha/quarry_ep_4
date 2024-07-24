@tool
extends PopochiuCharacter
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

@export var idle_spritesheet  : Texture
@export var walk1_spritesheet : Texture
@export var walk2_spritesheet : Texture

const Data := preload('character_main_parking_1_state.gd')

var state: Data = load("res://game/characters/main_parking_1/character_main_parking_1.tres")

var sprites: StackedSprites

var timer: Timer
var last_pos: Vector2
var is_walking: bool = false
var angle_rad : float

#region Virtual ####################################################################################
# When the room in which this node is located finishes being added to the tree
func _on_room_set() -> void:
	set_up_stacked_sprites()
	last_pos = position
	
	#stacked_sprites.use_spritesheet = 0
	timer = Timer.new()
	timer.wait_time = 0.2
	timer.timeout.connect(on_timeout)
	add_child(timer)
	timer.start()


func set_up_stacked_sprites():
	const StackedSpritesScript = preload("res://game/characters/main_parking_1/stacked_sprites/stacked_sprites.gd")
	$Sprite2D.set_script(StackedSpritesScript)
	sprites = $Sprite2D as StackedSprites
	sprites.sheets = [
		idle_spritesheet
		,walk1_spritesheet
		,walk2_spritesheet
	]
	sprites.render_sprites()

# When the node is clicked
func _on_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character walk to this character, gaze at it, and then
	# say something:
	#await C.player.walk_to_clicked()
#	await C.player.face_clicked()
#	await C.player.say("Hi!")


func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you could make the player instantly do something instead of walking there first


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character gaze at this character and then say something:
#	await C.player.face_clicked()
#	await C.player.say("Is someone...")


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# character. Note that you have to change the name of the `_item` parameter to `item`.
#	if item == I.Key:
#		await C.player.say("I don't want to give up my key")


# Use it to play the idle animation for the character
func _play_idle() -> void:
	super()


# Use it to play the walk animation for the character
# target_pos can be used to know the movement direction
func _play_walk(target_pos: Vector2) -> void:
	update_angle(target_pos)
	super(target_pos)


# Use it to play the talk animation for the character
func _play_talk() -> void:
	super()


# Use it to play the grab animation for the character
func _play_grab() -> void:
	super()


#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass

func on_timeout():
	if position == last_pos:
		sprites.use_spritesheet = 0
	else:
		if sprites.use_spritesheet == 0 || sprites.use_spritesheet == 1:
			sprites.use_spritesheet = 2
		elif sprites.use_spritesheet == 2:
			sprites.use_spritesheet = 1
	
	sprites.render_sprites()
	sprites.set_sprites_rotation(angle_rad)
	last_pos = position
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		walk(get_viewport().get_mouse_position())

func update_angle(trg_pos: Vector2):
	angle_rad = (
		(global_position - trg_pos).angle() 
		+ deg_to_rad(90)
	)
	sprites.set_sprites_rotation(angle_rad)

#endregion
