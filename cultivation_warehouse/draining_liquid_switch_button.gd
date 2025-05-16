extends TextureButton

var state = true

@onready var button_enable_texture = preload("res://textures/ui/switch_button/开.png")
@onready var button_disable_texture = preload("res://textures/ui/switch_button/关.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if state:
		texture_normal = button_disable_texture
		state= false
	else:
		texture_normal = button_enable_texture
		state= true
