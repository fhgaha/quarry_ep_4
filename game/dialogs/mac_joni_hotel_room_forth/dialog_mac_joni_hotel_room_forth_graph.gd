@tool
extends PopochiuDialog

var graph: GraphData

#region Virtual ####################################################################################
func _on_start() -> void:
	var graph_path: String = resource_path.get_slice('.', 0) + "_graph.res"
	graph = load(graph_path)
	_update_graph_options()

func _option_selected(opt: PopochiuDialogOption) -> void:
	_update_graph_options(opt)

func _update_graph_options(opt: PopochiuDialogOption = null):
	var data: GraphData.ToPopochiuDialogue =\
	await graph.handle(opt.text if opt != null else "")
	for cb: Callable in data.callables:
		await cb.call()
	if data.options.size() == 0:
		options.clear()
	var new_opts: Array[PopochiuDialogOption] = []
	for op: String in data.options.filter(func(opt: String): return !opt.is_empty()):
		var popo_opt:PopochiuDialogOption = create_opt(op, op)
		new_opts.append(popo_opt)
	update_options(new_opts)
	_show_options()

# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned one in _on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)

#endregion

func update_options(array: Array[PopochiuDialogOption]) -> void:
	options.clear()
	options.append_array(array)

func create_opt(id: String, text: String, visible: bool = true) -> PopochiuDialogOption:
	var opt = PopochiuDialogOption.new()
	opt.id      = id
	opt.text    = text
	opt.visible = visible
	return opt

func evaluate(command, variable_names = [], variable_values = []) -> void:
	var expression = Expression.new()
	var error = expression.parse(command, variable_names)
	if error != OK:
		push_error(expression.get_error_text())
		return
	
	var result = await expression.execute(variable_values, self)
	
	if expression.has_execute_failed():
		push_error("Could'nt execute the expression: %s" % result)

func mac_stand_shouting():
	var mac = C.MainSecond as MainSecond
	mac.set_sprite_and_rot(mac.SpshEnum.IDLE, 22)

func do_after_dialogue():
	var mac = C.MainSecond as MainSecond
	var pink_lady = C.PinkLady as PinkLadyCharacter
	var joni = C.Joni as JoniMotelRoom
	mac.walk_speed = 200
	mac.set_sprite_and_rot(mac.SpshEnum.IDLE, 0)
	mac.timer.start()
	await mac.walk_to_marker("JoniEnter3")
	mac.timer.stop()
	mac.set_sprite_and_rot(mac.SpshEnum.IDLE, 10)
	
	await E.wait(1)
	
	pink_lady.position = R.get_marker_position("MacEnter")
	pink_lady.set_sprite_and_rot(pink_lady.SpshEnum.IDLE, 15)
	pink_lady.show()
	
	#C.WhiteText.position = R.get_prop("DoorMainClosed").position
	await C.WhiteTextSilent.say("*Knock-knock*")
	A.sfx_knock.play()
	
	#mac walks away
	mac.walk_speed = 30
	mac.timer.start()
	await mac.walk_to_marker("JoniEnter1")
	mac.timer.stop()
	mac.set_sprite_and_rot(mac.SpshEnum.IDLE, 153)
	
	R.get_prop("DoorMainClosed").hide()
	R.get_prop("DoorMainOpen").show()
	
	await E.wait(1)
	await pink_lady.say("Is everything okay?")
	
	mac.ignore_walkable_areas = true
	mac.timer.start()
	await mac.walk_to_marker("MacEnter")
	await mac.walk_to_marker("CharHidden")
	mac.timer.stop()
	
	await joni.say("It's fine, uh, sorry")
	await pink_lady.say("It doesn't sound like it's fine...")
	
	#transition
	R.goto_room("MotelRoom")
