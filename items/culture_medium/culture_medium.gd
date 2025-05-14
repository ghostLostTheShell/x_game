"""培养基"""
class_name CultureMedium
extends Item

# 变量：当前培育物
var cultivation_item:Item


func set_cultivation_item(cultivation_item:Item):
	self.cultivation_item=cultivation_item
	#return Result.Err("设置培育物失败")

func remove_cultivation_item(cultivation_item:Item):
	self.cultivation_item = null
	#return Result.Err("移除培育物失败")
	

func grow():
	
	if cultivation_item is Botany:
		#print("%s 当前状态%s" % [cultivation_item.name, cultivation_item.state])
		if  cultivation_item.state == Botany.PlantGrowthStage.SEED:
			#print("%s进入 SPROUT 状态了"% [cultivation_item.name])
			cultivation_item.update_state(Botany.PlantGrowthStage.SPROUT)
			
		elif cultivation_item.state == Botany.PlantGrowthStage.SPROUT:
			#print("%s进入 YOUNG 状态了"% [cultivation_item.name])
			cultivation_item.update_state(Botany.PlantGrowthStage.YOUNG)
			
		elif cultivation_item.state == Botany.PlantGrowthStage.YOUNG:
			#print("%s进入 MATURE 状态了"% [cultivation_item.name])
			cultivation_item.update_state( Botany.PlantGrowthStage.MATURE)
			
		elif cultivation_item.state == Botany.PlantGrowthStage.MATURE:
			#print("%s进入 FLOWERING 状态了"% [cultivation_item.name])
			cultivation_item.update_state( Botany.PlantGrowthStage.FLOWERING)
			
		elif cultivation_item.state == Botany.PlantGrowthStage.FLOWERING:
			#print("%s进入 FRUITING 状态了"% [cultivation_item.name])
			cultivation_item.update_state(Botany.PlantGrowthStage.FRUITING)

		
	
func to_entity()->CultrueMediumEntity:
	return CultrueMediumEntity.new(self)
