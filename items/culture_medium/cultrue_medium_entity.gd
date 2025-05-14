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
	if has_item:
		pure_cultrue_medium.grow()
		_item.update()
		



func _can_drop_data(position, data):
	
	if data is Botany and has_item == false:
		return true 
		
	print("培养基已经被占用了")
	return false
	
func _drop_data(at_position: Vector2, data: Variant):
	print("接受到物品 %s" % [data.name])
	data.update_state(Botany.PlantGrowthStage.SPROUT)
	
	self.z_index
	
	var botany = data.to_entity()
	add_child(botany)
	
	#调整位置
	
	_item = botany
	
	
	botany.position.x=12
	botany.position.y=-36
	
	
	botany.z_index =  self.z_index + 1
	var index = CultivationWarehouse.all_item_list.find(data)
	CultivationWarehouse.all_item_list.remove_at(index)
	var panel:SeedPanel = get_tree().get_root().get_node("/root/CultivationWarehouse/PropContainer/SeedPanel")
	panel.refreshItem()
	has_item = true
	
	pure_cultrue_medium.set_cultivation_item(data)
	
	
	var time:Timer = get_tree().get_root().get_node("/root/CultivationWarehouse/Timer")
	time.timeout.connect(grow)


func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
