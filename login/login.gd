extends Node2D

@onready var backGround = $BackGround
@onready var ui = $Ui
@onready var loginDiglog = $Ui/LoginDiglog

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2.5).timeout
	ui.visible = true
	#backGround.texture = load("res://login/wallpaper/output.webp") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	loginDiglog.visible=true
