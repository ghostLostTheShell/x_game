extends Panel


@onready var nextButton =  $NextButton
@onready var previousButton =  $NextButton
var index = 0

@onready var p1_texture = preload("res://textures/ui/HelpDialog/说明1.png")
@onready var p2_texture = preload("res://textures/ui/HelpDialog/说明2.png")
@onready var p3_texture = preload("res://textures/ui/HelpDialog/说明3.png")
@onready var p4_texture = preload("res://textures/ui/HelpDialog/说明4.png")
@onready var p5_texture = preload("res://textures/ui/HelpDialog/说明5.png")


@onready var main = $Main
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main.texture = p1_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next_button_pressed() -> void:
	MusicController.buttonAudioPlayer.stream = preload("res://Music/click.wav")
	MusicController.buttonAudioPlayer.play()
	
	if index < 4:
		index = index + 1
	else:
		pass
		
	match index:
		0:
			main.texture = p1_texture
		1:
			main.texture = p2_texture
		2:
			main.texture = p3_texture
		3:
			main.texture = p4_texture
		4:
			main.texture = p5_texture

			


func _on_previous_button_pressed() -> void:
	MusicController.buttonAudioPlayer.stream = preload("res://Music/click.wav")
	MusicController.buttonAudioPlayer.play()	
	if index > 0:
		index = index - 1
	else:
		pass
		
	match index:
		0:
			main.texture = p1_texture
		1:
			main.texture = p2_texture
		2:
			main.texture = p3_texture
		3:
			main.texture = p4_texture
		4:
			main.texture = p5_texture


func _on_close_button_pressed() -> void:
	
	MusicController.buttonAudioPlayer.stream = preload("res://Music/click.wav")
	MusicController.buttonAudioPlayer.play()
	
	visible = false
