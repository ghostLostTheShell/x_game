"""蛭石培养基"""
extends CultureMedium
class_name VermiculitecultureMedium

static var _textur = load("res://cultivation_warehouse/culture_medium/vermiculite.png")

func  _init(qualityLevel:int) -> void:
	super("蛭石培养基", qualityLevel)
	textur=_textur

	
