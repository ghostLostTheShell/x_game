extends NutritionTracker
class_name SyntheticInorganicSalts

static var _textur = load("res://textures/items/nutrition_tracker/synthetic_inorganic_salts.png")

func  _init(qualityLevel:int) -> void:
	super("人工合成无机盐", qualityLevel)
	textur = _textur
