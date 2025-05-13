extends Control

class_name CultureMediumArea

@export var index:int = 0

var has_cultureMedium:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _can_drop_data(position, data):
	
	if has_cultureMedium:
		return false
		
	return true
	
func _drop_data(at_position: Vector2, data: Variant):
	var warehouse:Warehouse = get_parent()
	
	if warehouse == null:
		printerr("无法找到培育仓")
	
	if data is CultureMedium:
		var entity:CultrueMediumEntity = data.to_entity()
		add_child(entity)
		var center_x = (size.x - entity.size.x )  / 2
		
		match index:
			0:
				center_x = center_x + 30.0
			1:
				center_x = center_x + 2.0
			2:
				center_x = center_x - 1.0
			3:
				center_x = center_x - 10.0
			4:
				center_x = center_x - 20.0
				
		entity.position.x = center_x
		entity.position.y = size.y -  entity.size.y - 5
	
	
	
		has_cultureMedium = true
		
		var index = CultivationWarehouse.all_item_list.find(data)
		CultivationWarehouse.all_item_list.remove_at(index)
	
		var panel:CultureMediumPanel = get_tree().get_root().get_node("/root/CultivationWarehouse/PropContainer/CultureMediumPanel")

		panel.refreshItem()
