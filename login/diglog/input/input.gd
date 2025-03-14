@tool
extends Control
@export var iconTexture: Texture
@export var placeholder_text: String
@onready var icon = $TextureRect/Icon
@onready var input = $TextureRect/LineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	icon.texture = iconTexture
	input.placeholder_text = placeholder_text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
