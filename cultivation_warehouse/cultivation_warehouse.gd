extends Node2D

class_name CultivationWarehouse
@onready var timer = $Timer

@onready var romWarehouseColorRect = $Rom/Warehouse/ColorRect
@onready var energySchedule = $ConsumptionPanel/TextureRect/Energy/Schedule
@onready var foodSchedule = $ConsumptionPanel/TextureRect/Food/Schedule
@onready var electricityLabel = $Electricity/ElectricityRect/ElectricityLabel
@onready var propContainer = $PropContainer


static var all_item_list:Array[Item] = [
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



func _init() -> void:
	pass
	

func energy_consumption():
	#print("剩余能源 %s" %energy)
	if energy == 0:
		pass
	energy = energy - 0.1
	
	
	energySchedule.size.x = 990 * (energy / 100)

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	romWarehouseColorRect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	timer.timeout.connect(energy_consumption)
	electricityLabel.text = "%d/100" % Global.electricity_num
	Global.connect("electricity_num_changed", _on_electricity_num_changed)
	
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
