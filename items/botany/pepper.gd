"""
辣椒
"""
extends Botany
class_name Pepper

static var _seed_texture = load("res://textures/items/pepper/辣椒种子.png")
static var _1_texture = load("res://textures/items/pepper/pepper_1.png")
static var _2_texture = load("res://textures/items/pepper/pepper_2.png")
static var _3_texture = load("res://textures/items/pepper/pepper_3.png")
static var _4_texture = load("res://textures/items/pepper/pepper_4.png")
static var _5_texture = load("res://textures/items/pepper/pepper_5.png")
static var _texture = load("res://textures/items/pepper/pepper.png")


static var _name_stet_map = {
	PlantGrowthStage.SEED: "辣椒种子",
	PlantGrowthStage.SPROUT: "辣椒幼苗",
	PlantGrowthStage.YOUNG: "辣椒",
	PlantGrowthStage.MATURE: "辣椒",
	PlantGrowthStage.FLOWERING: "辣椒",
	PlantGrowthStage.FRUITING: "辣椒",
	PlantGrowthStage.WILTING: "辣椒",
}

static var _texture_stet_map = {
	PlantGrowthStage.SEED: _seed_texture,
	PlantGrowthStage.SPROUT: _1_texture,
	PlantGrowthStage.YOUNG: _2_texture,
	PlantGrowthStage.MATURE: _3_texture,
	PlantGrowthStage.FLOWERING: _4_texture,
	PlantGrowthStage.FRUITING: _5_texture,
	PlantGrowthStage.WILTING: _texture,
}

func  _init(qualityLevel:int, state:PlantGrowthStage=PlantGrowthStage.SEED) -> void:
	super(_name_stet_map.get(state), qualityLevel, state)
	textur = _texture_stet_map.get(state)

func update_state(state:PlantGrowthStage):
	super(state)
	self.textur = _texture_stet_map.get(state)
	self.name = _name_stet_map.get(state)
	
func gather():
	update_state(PlantGrowthStage.WILTING)
	if developmentalState > 100:
		return [
			Pepper.new(4, PlantGrowthStage.WILTING), 
			Pepper.new(4, PlantGrowthStage.WILTING),
			Pepper.new(4),
			Pepper.new(4)
			]
	elif developmentalState < 75:
		return [Pepper.new(1), Radish.new(4, PlantGrowthStage.WILTING)]
		
	else:
		return [
			Pepper.new(3, PlantGrowthStage.WILTING), 
			Pepper.new(3)
		]

func clone():
	return Pepper.new(self.qualityLevel, self.state)
