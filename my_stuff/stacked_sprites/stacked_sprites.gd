@tool
class_name StackedSprites extends Sprite2D

@export var show_sprites := true:
	set(val):
		show_sprites = val
		render_sprites()

@export var from_goxel: bool = true #otherwise exported from magicavoxel

@export var rot_deg :float = 0:
	set(val):
		rot_deg = val
		set_sprites_rotation(deg_to_rad(rot_deg))

@export var rotate_sprites  :bool = false

@export var frames :int = 16:
	set(val):
		frames = val
		if from_goxel: hframes = frames
		else: vframes = frames
		if show_sprites: render_sprites()
		set_sprites_rotation(deg_to_rad(rot_deg))

@export var sheets: Array[Texture] = []:
	set(val):
		sheets = val
		texture = null if sheets.size() == 0 else sheets[use_spritesheet]
		if show_sprites: render_sprites()

@export var use_spritesheet :int = 0:
	set(val):
		use_spritesheet = val
		texture = sheets[use_spritesheet]
		if show_sprites: render_sprites()
		set_sprites_rotation(deg_to_rad(rot_deg))

func _ready() -> void:
	render_sprites()
	set_sprites_rotation(deg_to_rad(rot_deg))

func _process(delta: float) -> void:
	if rotate_sprites:
		for sprt in get_children():
			sprt.rotation += delta

func render_sprites() -> void:
	clear_sprites()
	
	if from_goxel:
		for i in range(hframes):
			var s := Sprite2D.new()
			s.texture = texture
			s.hframes = hframes
			s.frame = i
			s.position.y = -i
			add_child(s)
	else:
		for i in range(vframes - 1, -1, -1):
			var s := Sprite2D.new()
			s.texture = texture
			s.vframes = vframes
			s.frame = i
			s.position.y = i
			s.rotation = deg_to_rad(rot_deg)
			add_child(s)


func clear_sprites():
	for c in get_children():
		c.queue_free()

func set_sprites_rotation(angle_rad: float):
	if use_spritesheet != 0:
		angle_rad += deg_to_rad(90)
	for sprite: Sprite2D in get_children():
		sprite.rotation = angle_rad
