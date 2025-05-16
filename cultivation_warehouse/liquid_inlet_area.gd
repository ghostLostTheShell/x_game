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
	print("%s, %s" % [data.name, data is NutritionTracker])
	if has_item == false and data is NutritionTracker:
		return true
		
	return false
	
func _drop_data(at_position: Vector2, data: Variant):
	var propContainer = get_parent().get_parent().get_node("PropContainer")
	print("补充 %s" % data.name)
	var t = TextureRect.new()
	t.texture = data.textur
	t.scale= Vector2(0.5, 0.5)
	add_child(t)
	t.position=Vector2(16, 10)
	has_item = true
	propContainer.refreshAll()
	
