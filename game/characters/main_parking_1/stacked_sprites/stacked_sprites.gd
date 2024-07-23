class_name StackedSprites extends Sprite2D

func _ready() -> void:
	render_sprites()

func render_sprites() -> void:
	for i in range(hframes):
		var s := Sprite2D.new()
		s.texture = texture
		s.hframes = hframes
		s.frame = i
		s.position.y = -i
		add_child(s)
