extends Control

class_name LiquidInletArea

var has_item:bool = false
var current_nutrition_tracker:NutritionTracker
var time:Timer
var cultivationWarehouse:CultivationWarehouse 
var current_nutrition_tracker_texture_rect:TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cultivationWarehouse= get_parent().get_parent()
	time = cultivationWarehouse.get_node("Timer")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _can_drop_data(position, data):
	print("%s, %s" % [data.name, data is NutritionTracker])
	if cultivationWarehouse.liquidInletState == 1:
		print("处理中。。。。")
		return
		
	if has_item == false and data is NutritionTracker:
		return true
		
	return false
	
func _drop_data(at_position: Vector2, data: Variant):
	var propContainer = cultivationWarehouse.get_node("PropContainer")
	
	cultivationWarehouse.audioStreamPlayer.stream = preload("res://Music/water_in.wav")
	cultivationWarehouse.audioStreamPlayer.play()
	
	if data is NutritionTracker:
		print("补充 %s" % data.name)
		var t = TextureRect.new()
		t.texture = data.textur
		t.scale= Vector2(0.5, 0.5)
		add_child(t)
		t.position=Vector2(16, 10)
		has_item = true
		

		var index = CultivationWarehouse.all_item_list.find(data)
		CultivationWarehouse.all_item_list.remove_at(index)
		
		propContainer.refreshAll()
		current_nutrition_tracker_texture_rect=t
		current_nutrition_tracker=data
		
		cultivationWarehouse.current_nutrition_type = data
		cultivationWarehouse.liquidInletState = 1
		time.timeout.connect(consumptionNutritionTracker)
		
	
func consumptionNutritionTracker():
	
	if cultivationWarehouse.liquidInletSwitchState == false:
		return
	
	if current_nutrition_tracker.capacity <= 0:
		time.timeout.disconnect(consumptionNutritionTracker)
		has_item=false
		current_nutrition_tracker_texture_rect.queue_free()
		cultivationWarehouse.liquidInletState = 0
		print("补充完成")
		
	else:
		cultivationWarehouse.supplement_nutrition(50.0)
		current_nutrition_tracker.capacity = current_nutrition_tracker.capacity - 50.0
	
	pass
