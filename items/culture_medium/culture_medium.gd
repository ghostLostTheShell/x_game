"""培养基"""
class_name CultureMedium
extends Item

# 变量：当前培育物
var cultivation_item:Item


func set_cultivation_item(cultivation_item:Item):
	return Result.Err("设置培育物失败")

func remove_cultivation_item(cultivation_item:Item):
	return Result.Err("移除培育物失败")
	

func grow():
	pass
	
func to_entity()->CultrueMediumEntity:
	return CultrueMediumEntity.new(self)
