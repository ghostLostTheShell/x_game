extends ColorRect
#@onready var shader_material = preload("res://login/excessive_material.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var tween = get_tree().create_tween()
	tween.tween_property(material, "shader_parameter/progress", 1.0, 2.0)  
	await tween.finished
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
