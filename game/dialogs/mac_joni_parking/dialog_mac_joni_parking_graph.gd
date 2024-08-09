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

var cleaning_lady : PopochiuCharacter

func cleaning_lady_walk_first():
	var cleaning_lady := C.CleaningLady as PopochiuCharacter
	cleaning_lady.timer.start()
	await cleaning_lady.walk_to_marker("CleaningLadyWalk1")
	cleaning_lady.timer.stop()
	cleaning_lady.sprites.use_spritesheet = cleaning_lady.SpshEnum.IDLE
	cleaning_lady.sprites.rot_deg = -107

func cleaning_lady_walk_second():
	var cleaning_lady := C.CleaningLady as PopochiuCharacter
	cleaning_lady.timer.start()
	await cleaning_lady.walk_to_marker("CleaningLadyWalk2")
	cleaning_lady.timer.stop()
	cleaning_lady.hide()
	await E.wait(2)
