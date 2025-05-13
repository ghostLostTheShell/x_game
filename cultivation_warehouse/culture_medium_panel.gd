@tool
extends Control

@onready var boxContainer = $HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refreshItem()


func refreshItem() -> void:

	for el in self.boxContainer.get_children():
		el.queue_free() 
	
	var i = 0
	
	for item in AppData.culture_medium_stock:

		if i > 5:
			break
			
		self.boxContainer.add_child(CultureMediumCard.new(item))
		i = i + 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#refreshItem()
	pass
