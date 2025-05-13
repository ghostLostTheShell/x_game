extends Item
class_name NutritionTracker
var capacity:int

func _init(name:String, qualityLevel:int=0, capacity=100) -> void:
	super(name, qualityLevel)
	self.capacity = capacity
