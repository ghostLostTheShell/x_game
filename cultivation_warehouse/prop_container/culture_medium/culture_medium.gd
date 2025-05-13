extends BasePropContainer

class_name CultureMediumCard

#var qualityLevel:int
#var background:TextureRect
#
#@onready var background_texture = preload("res://cultivation_warehouse/texture/item_backg_round.png")
#
#func _init(_item:Seed) -> void:
	#pass
#
#func _get_drag_data(at_position: Vector2) -> Variant:
	#var drag_data = {"texture": texture}
	#var a = duplicate()
	#a.scale = Vector2(0.2, 0.2)
	#set_drag_preview(a)
	#return drag_data
#
#
#func _ready() -> void:
	#texture = background_texture
	#pass
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#pass
