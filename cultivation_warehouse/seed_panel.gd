@tool
extends Control
class_name SeedPanel
@onready var boxContainer = $HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refreshItem()


func refreshItem() -> void:

	for el in self.boxContainer.get_children():
		el.queue_free() 
	
	var botanys = CultivationWarehouse.all_item_list.filter(func(item): return item is Botany)
	
	var i = 0
	
	for item in botanys:
		
		if i > 5:
			break
			
		self.boxContainer.add_child(ItemCard.new(item))
		i = i + 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#refreshItem()
	pass
