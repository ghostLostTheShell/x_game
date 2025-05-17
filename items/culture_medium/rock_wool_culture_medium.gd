"""岩棉培养基"""
extends CultureMedium
class_name RockWoolCultureMedium
static var _textur = load("res://cultivation_warehouse/culture_medium/rock_wool.png")

func  _init(qualityLevel:int=0) -> void:
	super("岩棉培养基", qualityLevel)
	textur = _textur

func clone():
	return RockWoolCultureMedium.new(self.qualityLevel)
