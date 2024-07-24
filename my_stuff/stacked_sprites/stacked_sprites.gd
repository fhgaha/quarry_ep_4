@tool
class_name StackedSprites extends Sprite2D

@export var show_sprites := true:
	set(val):
		show_sprites = val
		texture = sheets[use_spritesheet]
		hframes = h_frames
		render_sprites() if show_sprites else clear_sprites()
		set_sprites_rotation(deg_to_rad(rot_deg))

@export var rot_deg :float = 0:
	set(val):
		rot_deg = val
		set_sprites_rotation(deg_to_rad(rot_deg))

@export var rotate_sprites  :bool = false
@export var h_frames        :int = 16
@export var use_spritesheet :int = 0:
	set(val):
		use_spritesheet = val
		texture = sheets[use_spritesheet]

@export var sheets: Array[Texture] = []

func _process(delta: float) -> void:
	if rotate_sprites:
		for sprt in get_children():
			sprt.rotation += delta

func render_sprites() -> void:
	clear_sprites()
	for i in range(hframes):
		var s := Sprite2D.new()
		s.texture = texture
		s.hframes = hframes
		s.frame = i
		s.position.y = -i
		add_child(s)

func clear_sprites():
	for c in get_children():
		c.queue_free()

func set_sprites_rotation(angle_rad: float):
	if use_spritesheet != 0:
		angle_rad += deg_to_rad(90)
	for sprite: Sprite2D in get_children():
		sprite.rotation = angle_rad
