@tool
class_name StackedSprites extends Sprite2D

@export var show_sprites := true:
	set(val):
		show_sprites = val
		render_sprites() if show_sprites else clear_sprites()

@export var rotate_sprites := false

func _ready() -> void:
	render_sprites()

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
	
	get_child(get_child_count() - 1).hide()

func clear_sprites():
	for c in get_children():
		c.queue_free()

func set_sprites_rotation(angle_rad: float):
	for sprite: Sprite2D in get_children():
		sprite.rotation = angle_rad
