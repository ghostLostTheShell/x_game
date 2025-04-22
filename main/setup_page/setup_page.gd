extends Control

@onready var anti_aliasing_status = $TextureRect2/AntiAliasingStatus
@onready var t_anti_aliasing_status_unenable = preload("res://main/setup_page/texture/按钮未激活.png")
@onready var t_anti_aliasing_status_enable = preload("res://main/setup_page/texture/按钮激活.png")
@onready var voice_status_ui = $TextureRect2/VoiceStatus

# Called when the node enters the scene tree for the first time.
var voice_status = false


func _ready() -> void:
	if voice_status:
		voice_status_ui.texture_normal = t_anti_aliasing_status_enable
	else:
		voice_status_ui.texture_normal = t_anti_aliasing_status_unenable

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_home_button_pressed() -> void:
	visible = false
	
func toggleVisibility() -> void:
	
	var msaa = ProjectSettings.get_setting("rendering/anti_aliasing/msaa")
	if msaa == 4:
		anti_aliasing_status.texture_normal = t_anti_aliasing_status_enable
	else:
		anti_aliasing_status.texture_normal = t_anti_aliasing_status_unenable
	
	if visible == true:
		visible = false
	else:
		visible = true


func _on_anti_aliasing_status_pressed() -> void:
	var msaa = ProjectSettings.get_setting("rendering/anti_aliasing/msaa")
	if msaa == 4:
		ProjectSettings.set_setting("rendering/anti_aliasing/msaa", 0);
		ProjectSettings.set_setting("rendering/anti_aliasing/quality/msaa_2d", 0);
		ProjectSettings.set_setting("rendering/anti_aliasing/quality/msaa_3d", 0);
		anti_aliasing_status.texture_normal = t_anti_aliasing_status_unenable
	else:
		ProjectSettings.set_setting("rendering/anti_aliasing/msaa", 4);
		ProjectSettings.set_setting("rendering/anti_aliasing/quality/msaa_2d", 4);
		ProjectSettings.set_setting("rendering/anti_aliasing/quality/msaa_3d", 4);
		anti_aliasing_status.texture_normal = t_anti_aliasing_status_enable


func _on_voice_status_pressed() -> void:
	
	if voice_status:
		voice_status = false
		voice_status_ui.texture_normal = t_anti_aliasing_status_unenable
	else:
		voice_status = true
		voice_status_ui.texture_normal = t_anti_aliasing_status_enable
