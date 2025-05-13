extends TextureRect

class_name ItemCard

var item:Item

@onready var background_texture = preload("res://cultivation_warehouse/texture/item_backg_round.png")



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
	
	return self.item


func _ready() -> void:
	texture = background_texture
	
	back_panel = TextureRect.new()
	if item.qualityLevel == 0:
		back_panel.texture = Item.back_panel_blue_texture
	elif  item.qualityLevel == 1:
		back_panel.texture = Item.back_panel_green_texture
	elif  item.qualityLevel == 2:
		back_panel.texture = Item.back_panel_golden_texture
	elif  item.qualityLevel == 3:
		back_panel.texture = Item.back_panel_colour_mixture_texture

	back_panel.scale = Vector2(2, 2)
	back_panel.position =  Vector2(12, 10)

	item_texture = TextureRect.new()
	if item.textur != null:
		item_texture.texture = self.item.textur
	

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
