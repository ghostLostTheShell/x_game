extends Control

class_name CultureMediumArea

@export var index:int = 0

var has_cultureMedium:bool = false
var currentCultrueMediumEntity:CultrueMediumEntity


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _can_drop_data(position, data):
		
	return true
	
func _drop_data(at_position: Vector2, data: Variant):
	var warehouse:Warehouse = get_parent()
	var propContainer = warehouse.get_parent().get_parent().get_node("PropContainer")
	
	if warehouse == null:
		printerr("无法找到培育仓")
	
	if data is CultureMedium:
		if has_cultureMedium:
			return
			
		var entity:CultrueMediumEntity = data.to_entity()
		
		add_child(entity)
		currentCultrueMediumEntity=entity
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
	
		var p:CultivationWarehouse = get_parent().get_parent().get_parent()
		propContainer.refreshAll()

		
	elif  data is Shear or  data is PruningPliers:
		if has_cultureMedium:
			if currentCultrueMediumEntity.has_item:
				var item = currentCultrueMediumEntity._item
				if item is BotanyEntity:
					if item.pure_botany.state == Botany.PlantGrowthStage.FRUITING:
						var botany = item.pure_botany
						CultivationWarehouse.all_item_list.append(botany.gather())
						

						propContainer.refreshAll()
						currentCultrueMediumEntity.has_item = false
						currentCultrueMediumEntity._item = null
						item.queue_free()
						
						pass
			return
			
			
