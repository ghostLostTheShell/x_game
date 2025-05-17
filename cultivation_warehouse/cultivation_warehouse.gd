extends Node2D

class_name CultivationWarehouse
@onready var timer = $Timer

@onready var romWarehouseColorRect = $Rom/Warehouse/ColorRect
@onready var energySchedule = $ConsumptionPanel/TextureRect/Energy/Schedule
@onready var foodSchedule = $ConsumptionPanel/TextureRect/Food/Schedule
@onready var electricityLabel = $Electricity/ElectricityRect/ElectricityLabel
@onready var propContainer = $PropContainer
@onready var nutritionSchedule = $NutritionTracker/Background/Nutrition/Schedule
@onready var failureDialogPanel = $FailureDialogPanel


static var all_item_list:Array[Item] = [
	Rice.new(6),
	RockWoolCultureMedium.new(0),
	VermiculitecultureMedium.new(1),
	RockWoolCultureMedium.new(3),
	VermiculitecultureMedium.new(4),
	VermiculitecultureMedium.new(5),
	Lettuce.new(0),
	Pepper.new(1),
	Radish.new(3),
	SoilLeachate.new(1),
	SyntheticInorganicSalts.new(1),
	ReuseWaterCycle.new(0),
	PruningPliers.new(5),
	Shear.new(5),
]

var energy = 100
var food = 100
var nutrition = 0
var current_nutrition_type:NutritionTracker



func _init() -> void:
	pass
	

func energy_consumption():
	if energy < 0:
		Global.electricity_num = Global.electricity_num-1
		Global.emit_signal("electricity_num_changed", Global.electricity_num)
		if Global.electricity_num  <=0:
			failureDialogPanel.visible = true
			print("游戏结束")
			return
		
		else:
			energy = 100.0
			
	energy = energy - 0.1
	energySchedule.size.x = 990 * (energy / 100)

func food_consumption():
	if food <= 0:
		failureDialogPanel.visible = true
		print("游戏结束")
		pass
	food = food - 0.2
	var x = 990 * (food / 100)
	foodSchedule.size.x = x
	
func nutrition_consumption(value:float):
	
	if nutrition == 0:
		print("营养也为空")
		pass
		
	nutrition = nutrition - 0.5
	var y = 1120 * (nutrition / 100)
	nutritionSchedule.size.y = y

func supplement_nutrition(value:float):
	nutrition = nutrition + value
	if nutrition > 100:
		nutrition = 100.0
	
	var y = 1120 * (nutrition / 100)
	nutritionSchedule.size.y = y

func supplement_food(value:float):
	food = food + value
	if food > 100:
		food = 100.0
	
	var x = 990 * (food / 100)
	foodSchedule.size.x = x

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	romWarehouseColorRect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	timer.timeout.connect(energy_consumption)
	timer.timeout.connect(food_consumption)
	electricityLabel.text = "%d/100" % Global.electricity_num
	Global.connect("electricity_num_changed", _on_electricity_num_changed)
	nutritionSchedule.size.y = 0
	timer.timeout.connect(draining_liquid_handler)
	
	
func _on_electricity_num_changed(new_value: int) -> void:
	electricityLabel.text = "%d/100" % new_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	visible = false


func _on_home_button_pressed() -> void:
	visible = false


func _on_red_led_scroll_bar_value_changed(value: float) -> void:
	value = 10 - value
	romWarehouseColorRect.material.set_shader_parameter("red_progress", value * 0.04)


func _on_blue_led_scroll_bar_value_changed(value: float) -> void:
	value = 10 - value
	romWarehouseColorRect.material.set_shader_parameter("blue_progress", value * 0.04)


func _on_re_start_button_pressed() -> void:
	energy = 100.0
	energySchedule.size.x = 990 * (energy / 100)
	
	food = 100.0
	foodSchedule.size.x = 990 * (food / 100)
	
	Global.electricity_num = 100
	Global.emit_signal("electricity_num_changed", Global.electricity_num)
	
	nutrition = 100.0
	nutritionSchedule.size.y = 1120 * (nutrition / 100)
	
	failureDialogPanel.visible = false


var drainingLiquidState:bool = false

@onready var drainingLiquidSwitchButton = $ControlPanel/DrainingLiquidSwitchButton

func _on_draining_liquid_switch_button_pressed() -> void:
	if drainingLiquidState:
		drainingLiquidState = false
	else:
		drainingLiquidState = true
		
	drainingLiquidSwitchButton.update_texture_normal(drainingLiquidState)

@onready var drainingLiquidArea = $ControlPanel/DrainingLiquidArea

func draining_liquid_handler():
	if drainingLiquidState and nutrition > 0 and current_nutrition_type != null:
		nutrition = 0.0
		nutritionSchedule.size.y = nutrition
		drainingLiquidArea.load_current_nutrition_tracker(current_nutrition_type)
