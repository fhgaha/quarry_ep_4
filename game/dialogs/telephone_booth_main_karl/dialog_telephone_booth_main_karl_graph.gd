@tool
extends PopochiuDialog

var graph: GraphData

#region Virtual ####################################################################################
func _on_start() -> void:
	var graph_path: String = resource_path.get_slice('.', 0) + "_graph.res"
	graph = load(graph_path)
	var data: GraphData.ToPopochiuDialogue = graph.handle()
	for cb: Callable in data.callables:
		await cb.call()
	if data.options.size() == 0:
		options.clear()
	var opts: Array[PopochiuDialogOption] = []
	for op: String in data.options:
		var popo_opt:PopochiuDialogOption = create_opt(op, op)
		opts.append(popo_opt)
	update_options(opts)
	_show_options()


func _option_selected(opt: PopochiuDialogOption) -> void:
	var data: GraphData.ToPopochiuDialogue = graph.handle(opt.text)
	for cb: Callable in data.callables:
		await cb.call()
	var opts: Array[PopochiuDialogOption] = []
	for op: String in data.options.filter(
		func(opt_: String): return !opt_.is_empty()):
		var popo_opt:PopochiuDialogOption = create_opt(op, op)
		opts.append(popo_opt)
	update_options(opts)
	
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
	
	var result = expression.execute(variable_values, self)
	
	if expression.has_execute_failed():
		push_error("Could'nt execute the expression: %s" % result)

func show_frame(idx: int):
	var prop := (R.current as PopochiuRoom).get_prop("Char")
	(prop.get_child(1) as Sprite2D).frame = idx

func wait(seconds: float = 1.0):
	await E.wait(seconds)

func play_coin_sound():
	A.sfx_coin.play()

func play_hang_phone_sound():
	A.sfx_phone_slam_down.play()

func frame_test():
	var prop = (R.current as PopochiuRoom).get_prop("Char")
	#prop.frames = 2
	#prop.v_frames = 2
	#
	#prints("frms:", prop.frames, prop.v_frames)
	#await E.wait()
	#prop.current_frame = 0
	#await E.wait()
	#print(prop.current_frame)
	#prop.current_frame = 1
	#await E.wait()
	#print(prop.current_frame)
	#prop.current_frame = 2
	#await E.wait()
	#print(prop.current_frame)
	#prop.current_frame = 3
	#await E.wait()
	#print(prop.current_frame)
	#prop.current_frame = 4
	#await E.wait()
	#print(prop.current_frame)
	
	await E.wait()
	(prop.get_child(1) as Sprite2D).frame = 0
	await E.wait()
	print(prop.current_frame)
	(prop.get_child(1) as Sprite2D).frame = 1
	await E.wait()
	print(prop.current_frame)
	(prop.get_child(1) as Sprite2D).frame = 2
	await E.wait()
	print(prop.current_frame)
	(prop.get_child(1) as Sprite2D).frame = 3
	await E.wait()
	print(prop.current_frame)
	(prop.get_child(1) as Sprite2D).frame = 4
	await E.wait()
	print(prop.current_frame)
