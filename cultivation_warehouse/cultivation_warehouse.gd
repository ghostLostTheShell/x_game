extends Node2D

var seed_stock:Array[Seed] = [
	Seed.new("生菜种子", 0),
	Seed.new("生菜种子", 1),
	Seed.new("生菜种子", 2),
	Seed.new("生菜种子", 3),
	Seed.new("生菜种子", 3),
	Seed.new("生菜种子", 3),
]

var culture_medium_stock:Array[CultureMedium] = [
	CultureMedium.new("岩棉培养基", 0),
	CultureMedium.new("蛭石培养基", 1),
	CultureMedium.new("岩棉培养基", 2),
	CultureMedium.new("蛭石培养基", 3),
	CultureMedium.new("岩棉培养基", 3),
	CultureMedium.new("岩棉培养基", 3),
]

var in_use_culture_medium_list:Array[CultureMedium] = [
	
]
#营养液
var in_nutrient_solution


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
