extends NutritionTracker
class_name ReuseWaterCycle

static var _textur = load("res://textures/items/nutrition_tracker/reuse_water_cycle.png")

func  _init(qualityLevel:int) -> void:
	super("再生水循环", qualityLevel)
	textur = _textur

func clone():
	return ReuseWaterCycle.new(self.qualityLevel)
