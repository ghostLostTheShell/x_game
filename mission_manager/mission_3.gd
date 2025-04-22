extends TextureRect
@onready var enable_texture = preload("res://mission_manager/texture/任务3-已完成.png")
@onready var unenable_texture = preload("res://mission_manager/texture/任务3.png")
@onready var button_unenable_texture = preload("res://mission_manager/texture/不可领取.png")
@onready var button_enable_texture = preload("res://mission_manager/texture/可领取.png")
@onready var receive_button = $ReceiveButton
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	if 3 in Global.CompletedTasks:

		texture = enable_texture
		receive_button.texture_normal = button_unenable_texture
	else:
		texture = unenable_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_receive_button_pressed() -> void:
	if 3 in Global.CompletedTasks:
		pass
	else:
		Global.CompletedTasks.append(3)
		receive_button.texture_normal = button_unenable_texture
		texture = enable_texture
		Global.gold_num = Global.gold_num + 100
		Global.crystal_num = Global.crystal_num + 10
		Global.emit_signal("crystal_num_changed", Global.crystal_num)
		Global.emit_signal("gold_num_changed", Global.gold_num)
