extends Control
class_name ItemPanel

@onready var boxContainer = $HBoxContainer

var current_page = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refreshItem()


func refreshItem() -> void:
	
	for el in self.boxContainer.get_children():
		el.queue_free() 
	
	
	var items = CultivationWarehouse.all_item_list.filter(func(item): return item is Tool or (item is Botany and item.state == Botany.PlantGrowthStage.WILTING))
	
	
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
