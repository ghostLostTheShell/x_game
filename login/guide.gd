extends Sprite2D


func _ready() -> void:
	#var t = preload("res://login/wallpaper/wallhaven-k7yw91.jpg")
	#var image = Image.new()
	#image.create(1920, 1080, false, Image.FORMAT_RGB8)
	#image.fill(Color(0, 0, 0))  # 黑
	##texture_repeat
	#var texture = ImageTexture.new()
	#texture.create_from_image(image)
	#texture = texture
	
	#await get_tree().create_timer(20).timeout
	#texture = t
	await get_tree().create_timer(1).timeout
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 2)  # 1秒内透明
	await tween.finished
	
	
	queue_free()
