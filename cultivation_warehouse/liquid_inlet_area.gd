extends Control

class_name LiquidInletArea

var has_item:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _can_drop_data(position, data):
	
	if has_item == false and data is NutritionTracker:
		return true
		
	return false
	
func _drop_data(at_position: Vector2, data: Variant):
	pass
