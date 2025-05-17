extends Control

class_name DrainingLiquidArea

var current_nutrition_tracker:NutritionTracker
var current_nutrition_tracker_texture_rect:TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_current_nutrition_tracker(nutrition_tracker):
	self.current_nutrition_tracker = nutrition_tracker
	
	current_nutrition_tracker_texture_rect = TextureRect.new()
	current_nutrition_tracker_texture_rect.texture = nutrition_tracker.textur
	current_nutrition_tracker_texture_rect.scale= Vector2(0.5, 0.5)
	add_child(current_nutrition_tracker_texture_rect)
	current_nutrition_tracker_texture_rect.position=Vector2(16, 10)
	
	
func _get_drag_data(at_position: Vector2) -> Variant:
	if current_nutrition_tracker == null:
		return null
		
	var a = current_nutrition_tracker_texture_rect.duplicate()
	a.scale = Vector2(1, 1)
	set_drag_preview(a)
	
	#var _current_nutrition_tracker = current_nutrition_tracker
	#current_nutrition_tracker = null
	#current_nutrition_tracker_texture_rect.queue_free()
	
	return self
	
