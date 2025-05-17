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
	

func grow(red_light:int, blue_light:int):
	
	if cultivation_item is Botany:
		#print("%s 当前状态%s" % [cultivation_item.name, cultivation_item.state])
		if  cultivation_item.state == Botany.PlantGrowthStage.SEED:
			if  blue_light > red_light:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1* 2)
			else:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1 * 0.5)
				cultivation_item.developmentalState = cultivation_item.developmentalState -  1
				
			if cultivation_item.growthProgress >=30:
				#print("%s进入 SPROUT 状态了"% [cultivation_item.name])
				cultivation_item.update_state(Botany.PlantGrowthStage.SPROUT)
				cultivation_item.growthProgress = 0
				
		elif cultivation_item.state == Botany.PlantGrowthStage.SPROUT:
			#print("%s进入 YOUNG 状态了"% [cultivation_item.name])
			
			if blue_light > red_light:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1* 2)
			else:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1 * 0.5)
				cultivation_item.developmentalState = cultivation_item.developmentalState -  1
	
			if cultivation_item.growthProgress >=30:
				#print("%s进入 SPROUT 状态了"% [cultivation_item.name])
				cultivation_item.update_state(Botany.PlantGrowthStage.YOUNG)
				cultivation_item.growthProgress = 0
			
		elif cultivation_item.state == Botany.PlantGrowthStage.YOUNG:
			#print("%s进入 MATURE 状态了"% [cultivation_item.name])
			
			if blue_light < red_light:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1* 2)
			else:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1 * 0.5)
				cultivation_item.developmentalState = cultivation_item.developmentalState -  1
			
			if cultivation_item.growthProgress >=30:
				#print("%s进入 SPROUT 状态了"% [cultivation_item.name])
				cultivation_item.update_state( Botany.PlantGrowthStage.MATURE)
				cultivation_item.growthProgress = 0
			
			
		elif cultivation_item.state == Botany.PlantGrowthStage.MATURE:
			#print("%s进入 FLOWERING 状态了"% [cultivation_item.name])
			
			if blue_light < red_light:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1* 2)
			else:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1 * 0.5)
				cultivation_item.developmentalState = cultivation_item.developmentalState -  1
			
			if cultivation_item.growthProgress >=30:
				#print("%s进入 SPROUT 状态了"% [cultivation_item.name])
				cultivation_item.update_state( Botany.PlantGrowthStage.FLOWERING)
				cultivation_item.growthProgress = 0
	
		elif cultivation_item.state == Botany.PlantGrowthStage.FLOWERING:
			#print("%s进入 FRUITING 状态了"% [cultivation_item.name])
			
			if blue_light < red_light:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1* 2)
			else:
				cultivation_item.growthProgress = cultivation_item.growthProgress + (1 * 0.5)
				cultivation_item.developmentalState = cultivation_item.developmentalState -  1
				
			if cultivation_item.growthProgress >=30:
				#print("%s进入 SPROUT 状态了"% [cultivation_item.name])
				cultivation_item.update_state(Botany.PlantGrowthStage.FRUITING)
				cultivation_item.growthProgress = 0

		
	
func to_entity()->CultrueMediumEntity:
	return CultrueMediumEntity.new(self)
