@tool
extends Control
class_name NutritionTrackerPanel
@onready var boxContainer = $HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refreshItem()

var current_page = 0

func refreshItem() -> void:
	
	for el in self.boxContainer.get_children():
		el.queue_free() 
	
	
	var items = CultivationWarehouse.all_item_list.filter(func(item): return item is NutritionTracker)
	
	var i = 0
	while true:
		var index = (current_page* 5)+ i 
		if i > 5:
			break
		
		if index >= items.size():
			break
			
		self.boxContainer.add_child(ItemCard.new(items[index]))
		i = i + 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#refreshItem()
	pass


func _on_r_page_turning_button_pressed() -> void:
	if current_page == 0:
		pass
	current_page = current_page+1	
	refreshItem()



func _on_l_page_turning_button_pressed() -> void:
	#上一页
	if current_page == 0:
		pass
	else:
		current_page = current_page-1	
		refreshItem()


	
func _can_drop_data(position, data):
	print(data)
	if data is DrainingLiquidArea:
		return true
	
	return false
	
func _drop_data(at_position: Vector2, data):
	var _current_nutrition= data.current_nutrition_tracker
	_current_nutrition.capacity = 100
	data.current_nutrition_tracker = null
	data.current_nutrition_tracker_texture_rect.queue_free()

	CultivationWarehouse.all_item_list.append(_current_nutrition)
	refreshItem()
	
