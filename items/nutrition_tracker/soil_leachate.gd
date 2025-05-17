extends NutritionTracker
class_name SoilLeachate

static var _textur = load("res://textures/items/nutrition_tracker/soil_leachate.png")

func  _init(qualityLevel:int) -> void:
	super("土壤浸出液", qualityLevel)
	textur = _textur

func clone():
	return SoilLeachate.new(self.qualityLevel)
