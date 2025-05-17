extends Tool

class_name Shear

static var _textur = load("res://textures/items/shear/shear.png")

func  _init(qualityLevel:int=0) -> void:
	super("剪刀", qualityLevel)
	textur =  _textur

func clone():
	return Shear.new(self.qualityLevel)
