extends Control


@onready var culture_medium_button = $SwitchControl/HBoxContainer/CultureMediumButton
@onready var culture_medium_button_texture = preload("res://cultivation_warehouse/prop_container/texture/switch_button/culture_medium.png")
@onready var culture_medium_select_button_texture = preload("res://cultivation_warehouse/prop_container/texture/switch_button/culture_medium_serlect.png")

@onready var nutrient_solution_button = $SwitchControl/HBoxContainer/NutrientSolutionButton
@onready var nutrient_solution_button_texture = preload("res://cultivation_warehouse/prop_container/texture/switch_button/nutrient_solution.png")
@onready var nutrient_solution_select_button_texture = preload("res://cultivation_warehouse/prop_container/texture/switch_button/nutrient_solution_select.png")

@onready var seed_button = $SwitchControl/HBoxContainer/SeedButton
@onready var seed_button_texture = preload("res://cultivation_warehouse/prop_container/texture/switch_button/seed_switch_button.png")
@onready var seed_select_button_texture = preload("res://cultivation_warehouse/prop_container/texture/switch_button/seed_switch_select_button.png")

@onready var tool_button = $SwitchControl/HBoxContainer/ToolButton
@onready var tool_button_texture = preload("res://cultivation_warehouse/prop_container/texture/switch_button/item.png")
@onready var tool_select_button_texture = preload("res://cultivation_warehouse/prop_container/texture/switch_button/item_select.png")

@onready var seedPanel = $SeedPanel
@onready var cultureMediumPanel = $CultureMediumPanel
@onready var nutritionTrackerPanel = $NutritionTrackerPanel
@onready var itemPanel = $ItemPanel


func _ready() -> void:
	switch_to_seed()
	

func switch_to_culture_medium() -> void:
	culture_medium_button.texture_normal = culture_medium_select_button_texture
	nutrient_solution_button.texture_normal = nutrient_solution_button_texture
	seed_button.texture_normal = seed_button_texture
	tool_button.texture_normal = tool_button_texture
	seedPanel.visible = false
	nutritionTrackerPanel.visible = false
	cultureMediumPanel.refreshItem()
	cultureMediumPanel.visible = true
	itemPanel.visible=false
	
func switch_to_nutrient_solution() -> void:
	culture_medium_button.texture_normal = culture_medium_button_texture
	nutrient_solution_button.texture_normal = nutrient_solution_select_button_texture
	seed_button.texture_normal = seed_button_texture
	tool_button.texture_normal = tool_button_texture
	seedPanel.visible = false
	cultureMediumPanel.visible = false
	nutritionTrackerPanel.refreshItem()
	nutritionTrackerPanel.visible = true
	itemPanel.visible=false

func switch_to_seed() -> void:
	culture_medium_button.texture_normal = culture_medium_button_texture
	nutrient_solution_button.texture_normal = nutrient_solution_button_texture
	seed_button.texture_normal = seed_select_button_texture
	tool_button.texture_normal = tool_button_texture
	seedPanel.refreshItem()
	seedPanel.visible = true
	cultureMediumPanel.visible = false
	nutritionTrackerPanel.visible = false
	itemPanel.visible=false
	

func switch_to_tool() -> void:
	culture_medium_button.texture_normal = culture_medium_button_texture
	nutrient_solution_button.texture_normal = nutrient_solution_button_texture
	seed_button.texture_normal = seed_button_texture
	tool_button.texture_normal = tool_select_button_texture
	
	seedPanel.visible = false
	cultureMediumPanel.visible = false
	nutritionTrackerPanel.visible = false
	itemPanel.visible=true
	itemPanel.refreshItem()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_seed_button_pressed() -> void:
	switch_to_seed()


func _on_culture_medium_button_pressed() -> void:
	switch_to_culture_medium()


func _on_nutrient_solution_button_pressed() -> void:
	switch_to_nutrient_solution()
	


func _on_tool_button_pressed() -> void:
	switch_to_tool()
	
func refreshAll():
	seedPanel.refreshItem()
	cultureMediumPanel.refreshItem()
	nutritionTrackerPanel.refreshItem()
	itemPanel.refreshItem()
