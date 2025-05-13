extends Item
class_name Botany

enum PlantGrowthStage { 
	SEED, 		#SEED - 种子阶段 🌱
 	SPROUT, 	#SPROUT - 发芽阶段 🌿
	YOUNG, 		#YOUNG - 幼苗阶段 🌾
	MATURE, 	#MATURE - 成熟阶段 🍃
	FLOWERING, 	#FLOWERING - 开花阶段 🌸
	FRUITING,  	#FRUITING - 结果阶段 🍏
	WILTING,  	#WILTING - 枯萎阶段 🍂
}

var state:PlantGrowthStage = PlantGrowthStage.SEED

func  _init(name:String, qualityLevel:int=0, state:PlantGrowthStage=PlantGrowthStage.SEED) -> void:
	super(name, qualityLevel)
	self.state = state

	
func update_state(state:PlantGrowthStage):
	self.state = state
	pass


func to_entity()->BotanyEntity:
	return BotanyEntity.new(self)
