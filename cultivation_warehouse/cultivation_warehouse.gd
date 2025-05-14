extends Node2D

class_name CultivationWarehouse
@onready var timer = $Timer

static var all_item_list:Array[Item] = [
	RockWoolCultureMedium.new(0),
	VermiculitecultureMedium.new(1),
	RockWoolCultureMedium.new(3),
	VermiculitecultureMedium.new(4),
	Lettuce.new(0),
	Pepper.new(1),
	Radish.new(3),
	SoilLeachate.new(1),
	SyntheticInorganicSalts.new(1),
	ReuseWaterCycle.new(0)
]



func _init() -> void:
	pass
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	visible = false


func _on_home_button_pressed() -> void:
	visible = false
