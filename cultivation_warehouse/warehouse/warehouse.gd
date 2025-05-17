extends TextureRect

class_name Warehouse


@onready var cultureMediumArea1 = $CultureMediumArea1
@onready var cultureMediumArea2 = $CultureMediumArea2
@onready var cultureMediumArea3 = $CultureMediumArea3
@onready var cultureMediumArea4 = $CultureMediumArea4
@onready var cultureMediumArea5 = $CultureMediumArea5



var in_use_culture_medium_list:Array[CultureMedium] = [
	
]
#营养液
var in_nutrient_solution

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset_config():
	cultureMediumArea1.remove_currentCultrue_medium()
	cultureMediumArea2.remove_currentCultrue_medium()
	cultureMediumArea3.remove_currentCultrue_medium()
	cultureMediumArea4.remove_currentCultrue_medium()
	cultureMediumArea5.remove_currentCultrue_medium()
