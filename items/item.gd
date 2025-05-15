class_name Item

extends Object

var name:String
var qualityLevel:int
var textur:CompressedTexture2D = null

static var back_panel_colour_mixture_texture = load("res://textures/item_card_level/彩.png")
static var back_panel_green_texture = load("res://textures/item_card_level/紫.png")
static var back_panel_blue_texture = load("res://textures/item_card_level//蓝.png")
static var back_panel_golden_texture = load("res://textures/item_card_level//金.png")
static var back_panel_gray_texture = load("res://textures/item_card_level/灰.png")



func  _init(name:String, qualityLevel:int=0) -> void:
	self.name = name
	self.qualityLevel = qualityLevel
