extends Control
@onready var mission_view = $MissionView

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_5_pressed() -> void:
	MusicController.buttonAudioPlayer.stream = preload("res://Music/click.wav")
	MusicController.buttonAudioPlayer.play()	
	mission_view.visible = true
