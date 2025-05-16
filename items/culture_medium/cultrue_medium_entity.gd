extends TextureRect

class_name CultrueMediumEntity

var pure_cultrue_medium:CultureMedium

var has_item:bool = false
var _timer:Timer
var _item

func _init(pure_cultrue_medium:CultureMedium) -> void:
	self.pure_cultrue_medium = pure_cultrue_medium
	texture = pure_cultrue_medium.textur

	
func grow():
	if _item != null:
		
		pure_cultrue_medium.grow()
		_item.update()
		var cultivationWarehouse = get_parent().get_parent().get_parent().get_parent()
		cultivationWarehouse.nutrition_consumption(0.5)



func _can_drop_data(position, data):
	
	if data is Botany and has_item == false:
		return true 
		

	return false
	
func _drop_data(at_position: Vector2, data: Variant):
	print("接受到物品 %s" % [data.name])
	data.update_state(Botany.PlantGrowthStage.SPROUT)
	
	self.z_index
	
	var botany = data.to_entity()
	add_child(botany)
	
	#调整位置
	
	_item = botany
	
	
	botany.position.x=-40
	botany.position.y=-150
	
	
	botany.z_index =  self.z_index + 1
	var index = CultivationWarehouse.all_item_list.find(data)
	CultivationWarehouse.all_item_list.remove_at(index)
	
	var propContainer = get_parent().get_parent().get_parent().get_parent().get_node("PropContainer")
	propContainer.refreshAll()
	has_item = true
	
	pure_cultrue_medium.set_cultivation_item(data)
	
	
	var time:Timer = get_parent().get_parent().get_parent().get_parent().get_node("Timer")
	time.timeout.connect(grow)


func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
