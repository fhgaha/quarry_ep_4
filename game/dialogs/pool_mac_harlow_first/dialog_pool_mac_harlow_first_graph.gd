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

func harlow_look_for_sign():
	var harlow = C.Harlow as PopochiuCharacter
	harlow.timer.start()
	var original_pos = harlow.position
	await harlow.walk_to(R.get_marker_position("LookForSignFirst"))
	await E.wait(1.5)
	await harlow.walk_to(R.get_marker_position("LookForSignSecond"))
	await E.wait(1.5)
	await harlow.walk_to(R.get_marker_position("LookForSignThird"))
	await E.wait(1.5)
	await harlow.walk_to(original_pos)
	harlow.timer.stop()
	harlow.sprites.use_spritesheet = harlow.SpshEnum.IDLE
	harlow.sprites.rot_deg = -20

func naked_climb_out_of_the_pool():
	var naked = C.MainNaked as PopochiuCharacter
	naked.sprites.use_spritesheet = naked.SpshEnum.ROW_1
	naked.sprites.rot_deg = -140
	naked.position += Vector2(15, -5)
	await E.wait(1)
	
	naked.position = R.get_marker_position("NakedOutOfPool")
	naked.sprites.use_spritesheet = naked.SpshEnum.IDLE
	naked.sprites.rot_deg = 130
	await E.wait(1)

func harlow_walk_away():
	var harlow = C.Harlow as PopochiuCharacter
	harlow.timer.start()
	await harlow.walk_to(R.get_marker_position("RoomExit"))
	harlow.hide()
	(C.MainNaked as PopochiuCharacter).timer.start()
