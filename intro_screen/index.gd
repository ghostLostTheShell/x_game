extends Node2D

@onready var guide = $Guide
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	await get_tree().create_timer(1).timeout
	var tween = get_tree().create_tween()
	tween.tween_property(guide, "modulate", Color(0, 0, 0, 1), 3.0)  
	await tween.finished
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://login/Login.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
