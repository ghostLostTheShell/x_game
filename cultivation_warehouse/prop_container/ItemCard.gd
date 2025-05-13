extends TextureRect

class_name BasePropContainer

var item

@onready var background_texture = preload("res://cultivation_warehouse/texture/item_backg_round.png")

@onready var back_panel_colour_mixture_texture = preload("res://cultivation_warehouse/prop_container/texture/back_panel/彩.png")
@onready var back_panel_green_texture = preload("res://cultivation_warehouse/prop_container/texture/back_panel/紫.png")
@onready var back_panel_blue_texture = preload("res://cultivation_warehouse/prop_container/texture/back_panel/蓝.png")
@onready var back_panel_golden_texture = preload("res://cultivation_warehouse/prop_container/texture/back_panel/金.png")

@onready var chili_seed_texture = preload("res://cultivation_warehouse/prop_container/texture/items/chili_seed.png")
@onready var lettuce_seed_texture = preload("res://cultivation_warehouse/prop_container/texture/items/lettuce_seed.png")
@onready var radish_seed_texture = preload("res://cultivation_warehouse/prop_container/texture/items/radish_seed.png")


@onready var rock_wool_texture = preload("res://cultivation_warehouse/culture_medium/rock_wool.png")
@onready var vermiculite_texture = preload("res://cultivation_warehouse/culture_medium/vermiculite.png")


var back_panel:TextureRect
var item_texture:TextureRect

@onready var label_theme = preload("res://themes/item_label_text.tres") 
var txt:Label

func _init(item:Item) -> void:
	self.item = item
	


func _get_drag_data(at_position: Vector2) -> Variant:
	var drag_data = {"texture": texture}
	var a = duplicate()
	a.scale = Vector2(0.2, 0.2)
	set_drag_preview(a)
	
	return drag_data


func _ready() -> void:
	texture = background_texture
	
	back_panel = TextureRect.new()
	if item.qualityLevel == 0:
		back_panel.texture = back_panel_blue_texture
	elif  item.qualityLevel == 1:
		back_panel.texture = back_panel_green_texture
	elif  item.qualityLevel == 2:
		back_panel.texture = back_panel_golden_texture
	elif  item.qualityLevel == 3:
		back_panel.texture = back_panel_colour_mixture_texture

	back_panel.scale = Vector2(2, 2)
	back_panel.position =  Vector2(12, 10)

	item_texture = TextureRect.new()	
	if self.item.name == "生菜种子":
		item_texture.texture = lettuce_seed_texture
	elif  self.item.name == "辣椒种子":
		item_texture.texture = chili_seed_texture
	elif  self.item.name == "萝卜种子":
		item_texture.texture = chili_seed_texture
		
	elif  self.item.name == "岩棉培养基":
		item_texture.texture = rock_wool_texture
	elif  self.item.name == "蛭石培养基":
		item_texture.texture = vermiculite_texture

	item_texture.scale = Vector2(2, 2)
	item_texture.position =  Vector2(36, 22)

	txt = Label.new()
	txt.text = self.item.name
	txt.position=Vector2(16, 230)
	txt.size = Vector2(192, 47)
	txt.theme = label_theme
	txt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	self.add_child(back_panel)
	self.add_child(item_texture)
	self.add_child(txt)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
