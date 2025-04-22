extends Panel

var selected = 0
@onready var button1 = $HeroAdBannerBackground/TextureRect/Button1
@onready var button2 = $HeroAdBannerBackground/TextureRect/Button2
@onready var button3 = $HeroAdBannerBackground/TextureRect/Button3
@onready var content = $HeroAdBannerBackground/Content
@onready var button_status_enable = preload("res://main/placard/switch_button/texture/button_activated.png")
@onready var button_status_unenable = preload("res://main/placard/switch_button/texture/button.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_button()

func _update_button():
	if selected == 0:
		button1.texture_normal = button_status_enable
		button2.texture_normal = button_status_unenable
		button3.texture_normal = button_status_unenable
	elif selected == 1:
		button1.texture_normal = button_status_unenable
		button2.texture_normal = button_status_enable
		button3.texture_normal = button_status_unenable
	elif selected == 2:
		button1.texture_normal = button_status_unenable
		button2.texture_normal = button_status_unenable
		button3.texture_normal = button_status_enable

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	selected = 0 # Replace with function body.
	_update_button()
	var tween = get_tree().create_tween()
	tween.tween_property(content, "modulate:a", 0.0, 1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished
	tween.stop()
	tween = get_tree().create_tween()
	tween.tween_property(content, "modulate:a", 1.0, 1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished
	tween.stop()


func _on_button_2_pressed() -> void:
	selected = 1 # Replace with function body.
	_update_button()

	var tween = get_tree().create_tween()
	tween.tween_property(content, "modulate:a", 0.0, 1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished
	tween.stop()
	tween = get_tree().create_tween()
	tween.tween_property(content, "modulate:a", 1.0, 1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished
	tween.stop()

func _on_button_3_pressed() -> void:
	selected = 2 # Replace with function body.
	_update_button()
	var tween = get_tree().create_tween()
	tween.tween_property(content, "modulate:a", 0.0, 1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished
	tween.stop()
	tween = get_tree().create_tween()
	tween.tween_property(content, "modulate:a", 1.0, 1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished
	tween.stop()
