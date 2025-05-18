extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_button_pressed() -> void:
	MusicController.buttonAudioPlayer.stream = preload("res://Music/click.wav")
	MusicController.buttonAudioPlayer.play()		
	visible = false # Replace with function body.


func _on_anonymous_login_button_pressed() -> void:
	MusicController.buttonAudioPlayer.stream = preload("res://Music/click.wav")
	MusicController.buttonAudioPlayer.play()		
	get_tree().change_scene_to_file("res://loding_page/loding.tscn")
