extends TextureRect

class_name ItemCard

var item:Item

@onready var background_texture = preload("res://cultivation_warehouse/texture/item_backg_round.png")

@onready var level_1_texture = preload("res://cultivation_warehouse/prop_container/texture/level/level_1_texture.png")
@onready var level_2_texture = preload("res://cultivation_warehouse/prop_container/texture/level/level_2_texture.png")
@onready var level_3_texture = preload("res://cultivation_warehouse/prop_container/texture/level/level_3_texture.png")
@onready var level_4_texture = preload("res://cultivation_warehouse/prop_container/texture/level/level_4_texture.png")
@onready var level_5_texture = preload("res://cultivation_warehouse/prop_container/texture/level/level_5_texture.png")
@onready var level_6_texture = preload("res://cultivation_warehouse/prop_container/texture/level/level_6_texture.png")


@onready var trading_panel_bg_texture = preload("res://textures/ui/trading_panel/购买背板.png")

@onready var sell_button_texture = preload("res://textures/ui/trading_panel/水晶出售.png")
@onready var sell_button_p_texture = preload("res://textures/ui/trading_panel/水晶出售-暗.png")

@onready var buy_button_texture = preload("res://textures/ui/trading_panel/水晶购买.png")
@onready var buy_button_p_texture = preload("res://textures/ui/trading_panel/水晶购买-暗.png")

@onready var use_button_texture = preload("res://textures/ui/trading_panel/使用.png")
@onready var use_button_p_texture = preload("res://textures/ui/trading_panel/使用-暗.png")

var back_panel:TextureRect
var item_texture:TextureRect
var level_sign:TextureRect
var trading_panel:TextureRect

@onready var label_theme = preload("res://themes/item_label_text.tres") 
var txt:Label

func _init(item:Item) -> void:
	self.item = item
	


func _get_drag_data(at_position: Vector2) -> Variant:
	var drag_data = {"texture": texture}

	var a = item_texture.duplicate()
	
	a.scale = Vector2(1, 1)
	
	set_drag_preview(a)
	
	return self.item


func _ready() -> void:
	texture = background_texture
	
	back_panel = TextureRect.new()
	level_sign = TextureRect.new()
	if item.qualityLevel == 0:
		back_panel.texture = Item.back_panel_gray_texture
		level_sign.texture = level_1_texture
	elif  item.qualityLevel == 1:
		back_panel.texture = Item.back_panel_blue_texture
		level_sign.texture = level_2_texture
	elif  item.qualityLevel == 2:
		back_panel.texture = Item.back_panel_golden_texture
		level_sign.texture = level_3_texture
	elif  item.qualityLevel == 3:
		back_panel.texture = Item.back_panel_green_texture
		level_sign.texture = level_4_texture
	elif  item.qualityLevel == 4:
		back_panel.texture = Item.back_panel_golden_texture
		level_sign.texture = level_5_texture
	elif  item.qualityLevel == 5:
		level_sign.texture = level_6_texture
		back_panel.texture = Item.back_panel_colour_mixture_texture
		
	back_panel.scale = Vector2(2, 2)
	back_panel.position =  Vector2(12, 10)

	item_texture = TextureRect.new()
	if item.textur != null:
		item_texture.texture = self.item.textur
	

	item_texture.scale = Vector2(2, 2)
	if self.item is Botany:
		item_texture.position =  Vector2(10, 10)
	else:
		item_texture.position =  Vector2(36, 22)
	
	level_sign.scale = Vector2(-10, -10)
	
		
	level_sign.scale = Vector2(2, 2)
	level_sign.position=  Vector2(15, 180)
	

	txt = Label.new()
	txt.text = self.item.name
	txt.position=Vector2(16, 230)
	txt.size = Vector2(192, 47)
	txt.theme = label_theme
	txt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	
	##交易面板
	trading_panel = TextureRect.new()
	trading_panel.visible=false
	trading_panel.texture = trading_panel_bg_texture
	trading_panel.scale = Vector2(2, 2)
	trading_panel.position=Vector2(-5, 1)
	
	var sellButton = TextureButton.new()
	sellButton.texture_normal = sell_button_texture
	sellButton.texture_pressed =  sell_button_p_texture
	sellButton.pressed.connect(sell_button_on_pressed)
	sellButton.position=Vector2(8, 8)
	
	var buyButton = TextureButton.new()
	buyButton.texture_normal = buy_button_texture
	buyButton.texture_pressed =  buy_button_p_texture	
	buyButton.pressed.connect(buy_button_on_pressed)
	buyButton.position=Vector2(8, 36)
	
	var useButton = TextureButton.new()
	useButton.texture_normal = use_button_texture
	useButton.texture_pressed =  use_button_p_texture	
	useButton.pressed.connect(use_button_on_pressed)
	useButton.position=Vector2(8, 64)
	
	trading_panel.add_child(sellButton)
	trading_panel.add_child(buyButton)
	trading_panel.add_child(useButton)
	
	
	self.add_child(back_panel)
	self.add_child(item_texture)
	self.add_child(txt)
	self.add_child(level_sign)
	self.add_child(trading_panel)

func sell_button_on_pressed():
	var p = get_parent().get_parent().get_parent()
	
	var index = CultivationWarehouse.all_item_list.find(item)
	CultivationWarehouse.all_item_list.remove_at(index)
	p.refreshAll()
	trading_panel.visible=false

func buy_button_on_pressed():
	print("购买")
	var p = get_parent().get_parent().get_parent()
	CultivationWarehouse.all_item_list.append(item.clone())
	p.refreshAll()
	trading_panel.visible=false
		
func use_button_on_pressed():
	var p = get_parent().get_parent().get_parent()
	
	var index = CultivationWarehouse.all_item_list.find(item)
	CultivationWarehouse.all_item_list.remove_at(index)
	p.refreshAll()
	
	var cultivationWarehouse:CultivationWarehouse = get_parent().get_parent().get_parent().get_parent()
	cultivationWarehouse.supplement_food(20.0)
	
	trading_panel.visible=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _input(event):
	#if event is InputEventMouseButton and event.pressed:
		#print("鼠标点击位置: ", event.position)
	pass
	
func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		if trading_panel.visible:
			trading_panel.visible = false
		else:
			trading_panel.visible = true
		print("当前组件被点击！")
