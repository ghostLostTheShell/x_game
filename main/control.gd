extends Control

@onready var setupPage = $SetupPage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_settings_buttion_pressed() -> void:
	setupPage.visible = true
