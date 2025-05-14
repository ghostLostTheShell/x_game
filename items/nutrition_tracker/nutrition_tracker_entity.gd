extends TextureRect

var pureNutritionTracker:NutritionTracker

func _init(pureNutritionTracker:NutritionTracker) -> void:
	self.pureNutritionTracker = pureNutritionTracker
	texture = pureNutritionTracker.textur

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
