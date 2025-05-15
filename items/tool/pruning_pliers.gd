extends Tool
class_name PruningPliers

static var _textur = load("res://textures/items/pruning_pliers/pruning_pliers.png")

func  _init(qualityLevel:int=0) -> void:
	super("修剪钳", qualityLevel)
	textur =  _textur
