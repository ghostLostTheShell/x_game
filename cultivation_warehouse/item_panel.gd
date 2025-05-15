extends Control
class_name ItemPanel

@onready var boxContainer = $HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refreshItem()


func refreshItem() -> void:
	
	for el in self.boxContainer.get_children():
		el.queue_free() 
	
	
	var items = CultivationWarehouse.all_item_list.filter(func(item): return item is Tool or (item is Botany and item.state == Botany.PlantGrowthStage.WILTING))
	
	var i = 0
	for item in items:

		if i > 5:
			break
			
		self.boxContainer.add_child(ItemCard.new(item))
		i = i + 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#refreshItem()
	pass
