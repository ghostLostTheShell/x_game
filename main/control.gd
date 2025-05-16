extends Control

@onready var setupPage = $SetupPage
@onready var electricityLabel = $HBoxContainer/ElectricityRect/ElectricityLabel
@onready var goleLabel = $HBoxContainer/GoldRect/GoldLabel
@onready var crystLabel = $HBoxContainer/CrystalRect/CrystalLabel
@onready var cultivationWarehouse = $CultivationWarehouse
@onready var exitDialog = $ExitDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	electricityLabel.text = "%d/100" % Global.electricity_num
	goleLabel.text = "%d" % Global.gold_num
	crystLabel.text = "%d" % Global.crystal_num
	
	Global.connect("gold_num_changed", _on_gold_num_changed)
	Global.connect("electricity_num_changed", _on_electricity_num_changed)
	Global.connect("crystal_num_changed", _on_crystal_num_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_settings_buttion_pressed() -> void:
	setupPage.toggleVisibility()
	

func _on_crystal_num_changed(new_value: int) -> void:
	crystLabel.text = "%d" % new_value


func _on_electricity_num_changed(new_value: int) -> void:
	electricityLabel.text = "%d/100" % new_value


func _on_gold_num_changed(new_value: int) -> void:
	goleLabel.text = "%d" % new_value


func _on_to_cultivation_warehouse_button_pressed() -> void:
	cultivationWarehouse.visible = true
	



func _on_gui_input(event: InputEvent) -> void:
	
	if event is InputEventKey and event.pressed:
		print("========")
		if event.keycode == KEY_ESCAPE:
			print("ESC 键被按下")
			
func _input(event):
	if event is InputEventKey and event.pressed:

		if event.keycode == KEY_ESCAPE:
			exitDialog.visible = !exitDialog.visible


func _on_quite_button_pressed() -> void:
	get_tree().quit()
