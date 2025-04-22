extends Control

var selected = 0
@onready var Bar_Button1 = $Bar/Button1
@onready var Bar_Button2 = $Bar/Button2
@onready var Bar_Button3 = $Bar/Button3

@onready var button_1_status_enable_texture = preload("res://mission_manager/texture/全部-选中.png")
@onready var button_1_status_unenable_texture = preload("res://mission_manager/texture/全部.png")

@onready var button_2_status_enable_texture = preload("res://mission_manager/texture/每日-选中.png")
@onready var button_2_status_unenable_texture = preload("res://mission_manager/texture/每日.png")

@onready var button_3_status_enable_texture = preload("res://mission_manager/texture/主线-选中.png")
@onready var button_3_status_unenable_texture = preload("res://mission_manager/texture/主线.png")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	if selected == 0:
		Bar_Button1.texture_normal = button_1_status_enable_texture
		
	if selected == 1:
		Bar_Button2.texture_normal = button_2_status_enable_texture
		
		
	if selected == 2:
		Bar_Button3.texture_normal = button_3_status_enable_texture

func __update_bar_button():
	print(selected)
	if selected == 0:
		Bar_Button1.texture_normal = button_1_status_enable_texture
		Bar_Button2.texture_normal = button_2_status_unenable_texture
		Bar_Button3.texture_normal = button_3_status_unenable_texture
		
	if selected == 1:
		Bar_Button1.texture_normal = button_1_status_unenable_texture
		Bar_Button2.texture_normal = button_2_status_enable_texture
		Bar_Button3.texture_normal = button_3_status_unenable_texture
	if selected == 2:
		Bar_Button1.texture_normal = button_1_status_unenable_texture
		Bar_Button2.texture_normal = button_2_status_unenable_texture
		Bar_Button3.texture_normal = button_3_status_enable_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	selected = 0
	__update_bar_button()
	
	


func _on_button_2_pressed() -> void:
	selected = 1
	__update_bar_button()


func _on_button_3_pressed() -> void:
	selected = 2
	__update_bar_button()


func _on_home_button_pressed() -> void:
	visible = false 


func _on_back_button_pressed() -> void:
	visible = false 
