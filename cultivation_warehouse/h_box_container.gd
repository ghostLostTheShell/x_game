extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _can_drop_data(position, data):
	print(data)
	if data is NutritionTracker:
		return true
	
	return false
	
func _drop_data(at_position: Vector2, data: Variant):
	data.capacity=100
	#CultivationWarehouse.all_item_list.append(data)
